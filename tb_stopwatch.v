`timescale 1ns / 1ns
module tb_stopwatch;
parameter CLK_HALF_PERIOD   = 10;
parameter CLK_PERIOD        = 2 * CLK_HALF_PERIOD;
reg clk_50Mhz;
reg reset;
reg start_pause;
wire [6:0] hex0,hex1,hex2,hex3;
stopwatch DUT(
  .clk_50Mhz(clk_50Mhz), 
  .reset(reset), 
  .start_pause(start_pause), 
  .hex0(hex0), 
  .hex1(hex1), 
  .hex2(hex2), 
  .hex3(hex3)
);
  
//tao xung clock
initial 
  begin
    clk_50Mhz=0;
    reset=1;
    start_pause=1;

  end
always begin : clk_gen
    #CLK_HALF_PERIOD;
    clk_50Mhz = !clk_50Mhz; 
end
initial
    begin      			
      $display("\t\ttime,\tclk,\treset,\tenable\,\thex3,\thex2,\thex1,\thex0");
      $monitor("%d,\t%b,\t%b,\t%b,\t%b,\t%b,\t%b,\t%b",$time,clk_50Mhz,reset,start_pause,hex3,hex2,hex1,hex0);
    end

initial 
  begin : test
  // bắt đầu chạy
  #(10*CLK_PERIOD);
  start_pause  = 0;
  #(2*CLK_HALF_PERIOD);
  start_pause = 1;

  #(50*CLK_PERIOD)

  //reset=0 
  reset  = 0;
  #(2*CLK_PERIOD);
  reset = 1;

  // chạy lại 
  #(50*CLK_PERIOD)
  start_pause  = 0;
  #(2*CLK_PERIOD);
  start_pause = 1;

  //tạm ngưng
  #(50*CLK_PERIOD)
  start_pause  = 0;
  #(2*CLK_PERIOD);
  start_pause = 1;

  //tiếp tục chạy
  #(50*CLK_PERIOD)
  start_pause  = 0;
  #(2*CLK_PERIOD);
  start_pause = 1;

  #(20*CLK_PERIOD)

  $finish;

end
 

endmodule