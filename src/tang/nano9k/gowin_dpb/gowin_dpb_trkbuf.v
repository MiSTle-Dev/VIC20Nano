//Copyright (C)2014-2026 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.12.02 (64-bit)
//IP Version: 1.0
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9
//Device Version: C
//Created Time: Sat Mar 21 19:44:07 2026

module Gowin_DPB_trkbuf (douta, doutb, clka, ocea, cea, reseta, wrea, clkb, oceb, ceb, resetb, wreb, ada, dina, adb, dinb);

output [7:0] douta;
output [7:0] doutb;
input clka;
input ocea;
input cea;
input reseta;
input wrea;
input clkb;
input oceb;
input ceb;
input resetb;
input wreb;
input [12:0] ada;
input [7:0] dina;
input [12:0] adb;
input [7:0] dinb;

wire [11:0] dpb_inst_0_douta_w;
wire [3:0] dpb_inst_0_douta;
wire [11:0] dpb_inst_0_doutb_w;
wire [3:0] dpb_inst_0_doutb;
wire [11:0] dpb_inst_1_douta_w;
wire [3:0] dpb_inst_1_douta;
wire [11:0] dpb_inst_1_doutb_w;
wire [3:0] dpb_inst_1_doutb;
wire [11:0] dpb_inst_2_douta_w;
wire [7:4] dpb_inst_2_douta;
wire [11:0] dpb_inst_2_doutb_w;
wire [7:4] dpb_inst_2_doutb;
wire [11:0] dpb_inst_3_douta_w;
wire [7:4] dpb_inst_3_douta;
wire [11:0] dpb_inst_3_doutb_w;
wire [7:4] dpb_inst_3_doutb;
wire dff_q_0;
wire dff_q_1;
wire cea_w;
wire ceb_w;
wire gw_gnd;

assign cea_w = ~wrea & cea;
assign ceb_w = ~wreb & ceb;
assign gw_gnd = 1'b0;

DPB dpb_inst_0 (
    .DOA({dpb_inst_0_douta_w[11:0],dpb_inst_0_douta[3:0]}),
    .DOB({dpb_inst_0_doutb_w[11:0],dpb_inst_0_doutb[3:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[12]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[12]}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3:0]})
);

defparam dpb_inst_0.READ_MODE0 = 1'b0;
defparam dpb_inst_0.READ_MODE1 = 1'b0;
defparam dpb_inst_0.WRITE_MODE0 = 2'b00;
defparam dpb_inst_0.WRITE_MODE1 = 2'b00;
defparam dpb_inst_0.BIT_WIDTH_0 = 4;
defparam dpb_inst_0.BIT_WIDTH_1 = 4;
defparam dpb_inst_0.BLK_SEL_0 = 3'b000;
defparam dpb_inst_0.BLK_SEL_1 = 3'b000;
defparam dpb_inst_0.RESET_MODE = "SYNC";

DPB dpb_inst_1 (
    .DOA({dpb_inst_1_douta_w[11:0],dpb_inst_1_douta[3:0]}),
    .DOB({dpb_inst_1_doutb_w[11:0],dpb_inst_1_doutb[3:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[12]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[12]}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3:0]})
);

defparam dpb_inst_1.READ_MODE0 = 1'b0;
defparam dpb_inst_1.READ_MODE1 = 1'b0;
defparam dpb_inst_1.WRITE_MODE0 = 2'b00;
defparam dpb_inst_1.WRITE_MODE1 = 2'b00;
defparam dpb_inst_1.BIT_WIDTH_0 = 4;
defparam dpb_inst_1.BIT_WIDTH_1 = 4;
defparam dpb_inst_1.BLK_SEL_0 = 3'b001;
defparam dpb_inst_1.BLK_SEL_1 = 3'b001;
defparam dpb_inst_1.RESET_MODE = "SYNC";

DPB dpb_inst_2 (
    .DOA({dpb_inst_2_douta_w[11:0],dpb_inst_2_douta[7:4]}),
    .DOB({dpb_inst_2_doutb_w[11:0],dpb_inst_2_doutb[7:4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[12]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[12]}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:4]})
);

defparam dpb_inst_2.READ_MODE0 = 1'b0;
defparam dpb_inst_2.READ_MODE1 = 1'b0;
defparam dpb_inst_2.WRITE_MODE0 = 2'b00;
defparam dpb_inst_2.WRITE_MODE1 = 2'b00;
defparam dpb_inst_2.BIT_WIDTH_0 = 4;
defparam dpb_inst_2.BIT_WIDTH_1 = 4;
defparam dpb_inst_2.BLK_SEL_0 = 3'b000;
defparam dpb_inst_2.BLK_SEL_1 = 3'b000;
defparam dpb_inst_2.RESET_MODE = "SYNC";

DPB dpb_inst_3 (
    .DOA({dpb_inst_3_douta_w[11:0],dpb_inst_3_douta[7:4]}),
    .DOB({dpb_inst_3_doutb_w[11:0],dpb_inst_3_doutb[7:4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,ada[12]}),
    .BLKSELB({gw_gnd,gw_gnd,adb[12]}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:4]})
);

defparam dpb_inst_3.READ_MODE0 = 1'b0;
defparam dpb_inst_3.READ_MODE1 = 1'b0;
defparam dpb_inst_3.WRITE_MODE0 = 2'b00;
defparam dpb_inst_3.WRITE_MODE1 = 2'b00;
defparam dpb_inst_3.BIT_WIDTH_0 = 4;
defparam dpb_inst_3.BIT_WIDTH_1 = 4;
defparam dpb_inst_3.BLK_SEL_0 = 3'b001;
defparam dpb_inst_3.BLK_SEL_1 = 3'b001;
defparam dpb_inst_3.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ada[12]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(adb[12]),
  .CLK(clkb),
  .CE(ceb_w)
);
MUX2 mux_inst_0 (
  .O(douta[0]),
  .I0(dpb_inst_0_douta[0]),
  .I1(dpb_inst_1_douta[0]),
  .S0(dff_q_0)
);
MUX2 mux_inst_1 (
  .O(douta[1]),
  .I0(dpb_inst_0_douta[1]),
  .I1(dpb_inst_1_douta[1]),
  .S0(dff_q_0)
);
MUX2 mux_inst_2 (
  .O(douta[2]),
  .I0(dpb_inst_0_douta[2]),
  .I1(dpb_inst_1_douta[2]),
  .S0(dff_q_0)
);
MUX2 mux_inst_3 (
  .O(douta[3]),
  .I0(dpb_inst_0_douta[3]),
  .I1(dpb_inst_1_douta[3]),
  .S0(dff_q_0)
);
MUX2 mux_inst_4 (
  .O(douta[4]),
  .I0(dpb_inst_2_douta[4]),
  .I1(dpb_inst_3_douta[4]),
  .S0(dff_q_0)
);
MUX2 mux_inst_5 (
  .O(douta[5]),
  .I0(dpb_inst_2_douta[5]),
  .I1(dpb_inst_3_douta[5]),
  .S0(dff_q_0)
);
MUX2 mux_inst_6 (
  .O(douta[6]),
  .I0(dpb_inst_2_douta[6]),
  .I1(dpb_inst_3_douta[6]),
  .S0(dff_q_0)
);
MUX2 mux_inst_7 (
  .O(douta[7]),
  .I0(dpb_inst_2_douta[7]),
  .I1(dpb_inst_3_douta[7]),
  .S0(dff_q_0)
);
MUX2 mux_inst_8 (
  .O(doutb[0]),
  .I0(dpb_inst_0_doutb[0]),
  .I1(dpb_inst_1_doutb[0]),
  .S0(dff_q_1)
);
MUX2 mux_inst_9 (
  .O(doutb[1]),
  .I0(dpb_inst_0_doutb[1]),
  .I1(dpb_inst_1_doutb[1]),
  .S0(dff_q_1)
);
MUX2 mux_inst_10 (
  .O(doutb[2]),
  .I0(dpb_inst_0_doutb[2]),
  .I1(dpb_inst_1_doutb[2]),
  .S0(dff_q_1)
);
MUX2 mux_inst_11 (
  .O(doutb[3]),
  .I0(dpb_inst_0_doutb[3]),
  .I1(dpb_inst_1_doutb[3]),
  .S0(dff_q_1)
);
MUX2 mux_inst_12 (
  .O(doutb[4]),
  .I0(dpb_inst_2_doutb[4]),
  .I1(dpb_inst_3_doutb[4]),
  .S0(dff_q_1)
);
MUX2 mux_inst_13 (
  .O(doutb[5]),
  .I0(dpb_inst_2_doutb[5]),
  .I1(dpb_inst_3_doutb[5]),
  .S0(dff_q_1)
);
MUX2 mux_inst_14 (
  .O(doutb[6]),
  .I0(dpb_inst_2_doutb[6]),
  .I1(dpb_inst_3_doutb[6]),
  .S0(dff_q_1)
);
MUX2 mux_inst_15 (
  .O(doutb[7]),
  .I0(dpb_inst_2_doutb[7]),
  .I1(dpb_inst_3_doutb[7]),
  .S0(dff_q_1)
);
endmodule //Gowin_DPB_trkbuf
