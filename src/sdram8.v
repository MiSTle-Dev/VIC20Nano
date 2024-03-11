//
// sdram8.v
//
// sdram controller implementation for the MiST board
// http://code.google.com/p/mist-board/
// 
// Copyright (c) 2013 Till Harbaum <till@harbaum.org> 
// 
// This source file is free software: you can redistribute it and/or modify 
// it under the terms of the GNU General Public License as published 
// by the Free Software Foundation, either version 3 of the License, or 
// (at your option) any later version. 
// 
// This source file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License 
// along with this program.  If not, see <http://www.gnu.org/licenses/>. 
//

// adapted for TN20k internal 64mbit sdram 32 bit wide
// 2024 Stefan Voss

module sdram8 (


    output              sd_clk, // sd clock
    output              sd_cke, // clock enable
    inout reg [31:0]    sd_data,// 32 bit bidirectional data bus
    output reg [10:0]   sd_addr,// 11 bit multiplexed address bus
    output 		[3:0]   sd_dqm, // two byte masks
    output reg [ 1:0]   sd_ba,  // two banks
    output              sd_cs,  // a single chip select
    output              sd_we,  // write enable
    output              sd_ras, // row address select
    output              sd_cas, // columns address select

	// cpu/chipset interface
    input               clk,    // sdram is accessed up to 65MHz
    input               reset_n,// init signal after FPGA config to initialize RAM
	
    output              ready,  // ram is ready and has been initialized
    input               refresh,// refresh cycle
    input      [ 7:0]   din,
    output     [ 7:0]   dout,
    input      [22:0]   addr,   // 23 bit word address
    input      [1:0]    ds,     // unused
    input               cs,     // cpu/chipset requests read/write
    input               we      // cpu/chipset requests write
);

assign sd_clk = clk;
assign sd_cke = 1'b1;
localparam RASCAS_DELAY   = 3'd2;   // tRCD>=20ns -> 2 cycles@64MHz
localparam BURST_LENGTH   = 3'b000; // 000=none, 001=2, 010=4, 011=8
localparam ACCESS_TYPE    = 1'b0;   // 0=sequential, 1=interleaved
localparam CAS_LATENCY    = 3'd2;   // 2/3 allowed
localparam OP_MODE        = 2'b00;  // only 00 (standard operation) allowed
localparam NO_WRITE_BURST = 1'b1;   // 0= write burst enabled, 1=only single access write

localparam MODE = { 3'b000, NO_WRITE_BURST, OP_MODE, CAS_LATENCY, ACCESS_TYPE, BURST_LENGTH}; 

// ---------------------------------------------------------------------
// ------------------------ cycle state machine ------------------------
// ---------------------------------------------------------------------
localparam STATE_CMD_START = 3'd0;   // state in which a new command can be started
localparam STATE_CMD_CONT  = STATE_CMD_START  + RASCAS_DELAY; // command can be continued
localparam STATE_READ      = STATE_CMD_CONT + CAS_LATENCY + 1'd1;
localparam STATE_LAST      = 3'd7;   // last state in cycle

reg [2:0] q /* synthesis noprune */;
reg last_ce, last_refresh;
always @(posedge clk) begin
	last_ce <= cs;
	last_refresh <= refresh;

	// start a new cycle in rising edge of ce
	if(cs && !last_ce) q <= 3'd1;
	if(q || reset) q <= q + 3'd1;
end

// ---------------------------------------------------------------------
// --------------------------- startup/reset ---------------------------
// ---------------------------------------------------------------------

// wait 1ms (32 clkref cycles) after FPGA config is done before going
// into normal operation. Initialize the ram in the last 16 reset cycles (cycles 15-0)
initial reset = 5'h1f;

reg [4:0] reset; /* synthesis noprune=1 */;
always @(posedge clk) begin
	if(!reset_n) reset <= 5'h1f;
	else if((q == STATE_LAST) && (reset != 0)) reset <= reset - 5'd1;
end

assign ready = !(|reset);

// all possible commands
localparam CMD_NOP             = 3'b111;
localparam CMD_ACTIVE          = 3'b011;
localparam CMD_READ            = 3'b101;
localparam CMD_WRITE           = 3'b100;
localparam CMD_BURST_TERMINATE = 3'b110;
localparam CMD_PRECHARGE       = 3'b010;
localparam CMD_AUTO_REFRESH    = 3'b001;
localparam CMD_LOAD_MODE       = 3'b000;

reg [2:0] sd_cmd;   // current command sent to sd ram
reg [1:0] bt;

// drive control signals according to current command
assign sd_cs  = 0;
assign sd_ras = sd_cmd[2];
assign sd_cas = sd_cmd[1];
assign sd_we  = sd_cmd[0];

assign sd_data = (cs && we) ? {din, din, din, din } : 32'bzzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz_zzzz;
assign sd_dqm = (!we)?4'b0000: {bt} == 2'd0 ? 4'b0111: 
                               {bt} == 2'd1 ? 4'b1011: 
                               {bt} == 2'd2 ? 4'b1101:
                                              4'b1110;
assign dout = {bt} == 2'd0 ? dout_r[31:24]: 
              {bt} == 2'd1 ? dout_r[23:16]:
              {bt} == 2'd2 ? dout_r[15:8] :
                             dout_r[7:0];

reg [31:0] dout_r;

always @(posedge clk) begin
	reg [8:0] caddr;
	sd_cmd  <= CMD_NOP;

	if(q == STATE_READ) dout_r <= sd_data[31:0];

	if(reset) begin
		sd_ba <= 0;
		if(q == STATE_CMD_START) begin
			if(reset == 13) begin
				sd_cmd <= CMD_PRECHARGE;
				sd_addr <= 11'b10000000000;
			end
			if(reset == 2) begin
				sd_cmd <= CMD_LOAD_MODE;
				sd_addr <= MODE;
			end
		end
	end
	else begin
		if(refresh && !last_refresh) sd_cmd <= CMD_AUTO_REFRESH;

		if(cs && !last_ce) begin
			sd_cmd  <= CMD_ACTIVE;
			sd_addr <= addr[18:8];
			sd_ba   <= addr[20:19];
			bt      <= addr[22:21];
		end
        // CAS phase 
		if(q == STATE_CMD_CONT) begin
			sd_cmd  <= we ? CMD_WRITE : CMD_READ;
			sd_addr <={3'b100, addr[7:0] };
		end
	end
end

endmodule
