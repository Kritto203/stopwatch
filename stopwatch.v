module stopwatch(
  input clk_50Mhz,
  input reset,// key0
  input start_pause,// key1
  output [0:6] hex0, hex1, hex2, hex3
);
  wire clk_1hz;
  clock_1hz clk_divider(.clk_50Mhz(clk_50Mhz),  .clk_1hz(clk_1hz));
  
  wire[3:0] dvs,chucs,dvm,chucm;
  clock donghodem (.clk(clk_1hz), .clk_50Mhz(clk_50Mhz), .reset(reset), .start_pause(start_pause), .dvseconds_count(dvs), .chucseconds_count(chucs), .dvminutes_count(dvm), .chucminutes_count(chucm));
  
  decoder7d U1(.Q(chucm), .hex(hex3));
  decoder7d U2(.Q(dvm), .hex(hex2));
  decoder7d U3(.Q(chucs), .hex(hex1));
  decoder7d U4(.Q(dvs), .hex(hex0));
  
endmodule
