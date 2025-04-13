/*
 vic_keymap.v
 
 table to translate from FPGA Compantions key codes into the 
 VIC20 keyboard matrix. The incoming FPGA Companion codes
 are mainly the USB HID key codes with the modifier keys
 mapped into the 0x68+ range.
*/

module keymap (
  input [6:0]  code,
  output [2:0] row,
  output [2:0] column
);
// ST  #define MATRIX(a,b)   (b*16+a)
// C64 #define MATRIX(b,a)   (b*8+a)
// VIC #define MATRIX(a,b)   (b*8+a)
assign { row,column } // vice versa than AtariST
= 
                                // 00: NoEvent
                                // 01: Overrun Error
                                // 02: POST fail
                                // 03: ErrorUndefined
  
  // characters
  (code == 7'h04)?{ 3'd2,3'd1}: // 04: a
  (code == 7'h05)?{ 3'd4,3'd3}: // 05: b
  (code == 7'h06)?{ 3'd4,3'd2}: // 06: c
  (code == 7'h07)?{ 3'd2,3'd2}: // 07: d
  (code == 7'h08)?{ 3'd6,3'd1}: // 08: e
  (code == 7'h09)?{ 3'd5,3'd2}: // 09: f
  (code == 7'h0a)?{ 3'd2,3'd3}: // 0a: g
  (code == 7'h0b)?{ 3'd5,3'd3}: // 0b: h
  (code == 7'h0c)?{ 3'd1,3'd4}: // 0c: i
  (code == 7'h0d)?{ 3'd2,3'd4}: // 0d: j
  (code == 7'h0e)?{ 3'd5,3'd4}: // 0e: k
  (code == 7'h0f)?{ 3'd2,3'd5}: // 0f: l
  (code == 7'h10)?{ 3'd4,3'd4}: // 10: m
  (code == 7'h11)?{ 3'd3,3'd4}: // 11: n
  (code == 7'h12)?{ 3'd6,3'd4}: // 12: o
  (code == 7'h13)?{ 3'd1,3'd5}: // 13: p
  (code == 7'h14)?{ 3'd6,3'd0}: // 14: q
  (code == 7'h15)?{ 3'd1,3'd2}: // 15: r
  (code == 7'h16)?{ 3'd5,3'd1}: // 16: s
  (code == 7'h17)?{ 3'd6,3'd2}: // 17: t
  (code == 7'h18)?{ 3'd6,3'd3}: // 18: u
  (code == 7'h19)?{ 3'd3,3'd3}: // 19: v
  (code == 7'h1a)?{ 3'd1,3'd1}: // 1a: w
  (code == 7'h1b)?{ 3'd3,3'd2}: // 1b: x
  (code == 7'h1c)?{ 3'd1,3'd3}: // 1c: y
  (code == 7'h1d)?{ 3'd4,3'd1}: // 1d: z

  // top number key row
  (code == 7'h1e)?{ 3'd0,3'd0}: // 1e: 1
  (code == 7'h1f)?{ 3'd7,3'd0}: // 1f: 2
  (code == 7'h20)?{ 3'd0,3'd1}: // 20: 3
  (code == 7'h21)?{ 3'd7,3'd1}: // 21: 4
  (code == 7'h22)?{ 3'd0,3'd2}: // 22: 5
  (code == 7'h23)?{ 3'd7,3'd2}: // 23: 6
  (code == 7'h24)?{ 3'd0,3'd3}: // 24: 7
  (code == 7'h25)?{ 3'd7,3'd3}: // 25: 8
  (code == 7'h26)?{ 3'd0,3'd4}: // 26: 9
  (code == 7'h27)?{ 3'd7,3'd4}: // 27: 0
  
  // other keys
  (code == 7'h28)?{ 3'd1,3'd7}: // 28: return
  (code == 7'h29)?{ 3'd3,3'd0}: // 29: esc  as run/stop
  (code == 7'h2a)?{ 3'd0,3'd7}: // 2a: backspace as del
  (code == 7'h2b)?{ 3'd3,3'd1}: // lshift // 2b: tab
  (code == 7'h2c)?{ 3'd4,3'd0}: // 2c: space

  (code == 7'h2d)?{ 3'd7,3'd5}: // 2d: - as -
  (code == 7'h2e)?{ 3'd0,3'd5}: // 2e: = as +
  (code == 7'h2f)?{ 3'd6,3'd5}: // 2f: [  as @
  (code == 7'h30)?{ 3'd1,3'd6}: // 30: ]  as *
  (code == 7'h31)?{ 3'd0,3'd6}: // 31: backslash as poun
  (code == 7'h32)?{ 3'd0,3'd6}: // 32: EUR-1 as pound ba keyboards(near enter)
  (code == 7'h33)?{ 3'd5,3'd5}: // 33: ; as :
  (code == 7'h34)?{ 3'd2,3'd6}: // 34: ' as ;
  (code == 7'h35)?{ 3'd1,3'd0}: // 35: ` as arrow left
  (code == 7'h36)?{ 3'd3,3'd5}: // 36: , as ,
  (code == 7'h37)?{ 3'd4,3'd5}: // 37: . as .
  (code == 7'h38)?{ 3'd3,3'd6}: // 38: / as /
  (code == 7'h39)?{ 3'd5,3'd0}: // 39: caps lock as cbm 
  
  // function keys
  (code == 7'h3a)?{ 3'd4,3'd7}: // 3a: F1
  (code == 7'h3b)?{ 3'd4,3'd7}: // 3b: F2
  (code == 7'h3c)?{ 3'd5,3'd7}: // 3c: F3
  (code == 7'h3d)?{ 3'd5,3'd7}: // 3d: F4
  (code == 7'h3e)?{ 3'd6,3'd7}: // 3e: F5
  (code == 7'h3f)?{ 3'd6,3'd7}: // 3f: F6
  (code == 7'h40)?{ 3'd7,3'd7}: // 40: F7
  (code == 7'h41)?{ 3'd7,3'd7}: // 41: F8
  (code == 7'h42)?{ 3'd6,3'd6}: // 42: F9
  (code == 7'h43)?{ 3'd5,3'd6}: // 43: F10
  (code == 7'h44)?{ 3'd3,3'd1}: // 44: F11
  (code == 7'h45)?{ 3'd3,3'd1}: // 45: F12 (OSD)

  (code == 7'h46)?{ 3'd3,3'd1}: // lshift // 46: PrtScr
  (code == 7'h47)?{ 3'd3,3'd1}: // lshift // 47: Scroll Lock
  (code == 7'h48)?{ 3'd3,3'd1}: // lshift // 48: Pause
  (code == 7'h49)?{ 3'd7,3'd6}: // 49: Insert as CLR
  (code == 7'h4a)?{ 3'd3,3'd1}: // lshift // 4a: Home
  (code == 7'h4b)?{ 3'd3,3'd1}: // lshift // 4b: PageUp
  (code == 7'h4c)?{ 3'd7,3'd6}: // 4c: Delete as CLR
  (code == 7'h4d)?{ 3'd3,3'd1}: // lshift // 4d: End
  (code == 7'h4e)?{ 3'd3,3'd1}: // lshift // 4e: PageDown
  
  // cursor keys
  (code == 7'h4f)?{ 3'd2,3'd7}: // 4f: right
  (code == 7'h50)?{ 3'd2,3'd7}: // 50: left
  (code == 7'h51)?{ 3'd3,3'd7}: // 51: down
  (code == 7'h52)?{ 3'd3,3'd7}: // 52: up
  (code == 7'h53)?{ 3'd3,3'd1}: // lshift // 53: Num Lock

  // keypad
  (code == 7'h54)?{ 3'd3,3'd1}: // 54: KP /
  (code == 7'h55)?{ 3'd3,3'd1}: // 55: KP *
  (code == 7'h56)?{ 3'd3,3'd1}: // 56: KP -
  (code == 7'h57)?{ 3'd3,3'd1}: // 57: KP +
  (code == 7'h58)?{ 3'd3,3'd1}: // 58: KP Enter
  (code == 7'h59)?{ 3'd3,3'd1}: // 59: KP 1
  (code == 7'h5a)?{ 3'd3,3'd1}: // 5a: KP 2
  (code == 7'h5b)?{ 3'd3,3'd1}: // 5b: KP 3
  (code == 7'h5c)?{ 3'd3,3'd1}: // 5c: KP 4
  (code == 7'h5d)?{ 3'd3,3'd1}: // 5d: KP 5
  (code == 7'h5e)?{ 3'd3,3'd1}: // 5e: KP 6
  (code == 7'h5f)?{ 3'd3,3'd1}: // 5f: KP 7
  (code == 7'h60)?{ 3'd3,3'd1}: // 60: KP 8
  (code == 7'h61)?{ 3'd3,3'd1}: // 61: KP 9
  (code == 7'h62)?{ 3'd3,3'd1}: // 62: KP 0
  (code == 7'h63)?{ 3'd3,3'd1}: // 63: KP .
  (code == 7'h64)?{ 3'd3,3'd1}: // 64: EUR-2

  // remapped modifier keys
  (code == 7'h68)?{ 3'd2,3'd0}: // 68: left ctrl
  (code == 7'h69)?{ 3'd3,3'd1}: // 69: left shift
  (code == 7'h6a)?{ 3'd5,3'd0}: // 6a: left alt
  (code == 7'h6b)?{ 3'd3,3'd1}: // 6b: left meta
  (code == 7'h6c)?{ 3'd2,3'd0}: // 6c: right ctrl
  (code == 7'h6d)?{ 3'd4,3'd6}: // 6d: right shift
  (code == 7'h6e)?{ 3'd5,3'd0}: // 6e: right alt
  (code == 7'h6f)?{ 3'd3,3'd1}: // 6f: right meta
  
  { 3'd0,3'd0};
  
endmodule
