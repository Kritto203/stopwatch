module clock_1hz(
  input clk_50Mhz,
  output reg clk_1hz
);
  initial clk_1hz=0;
  reg [24:0] counter=0;
  always @(posedge clk_50Mhz) begin
    // do bắt đầu =0 nên tới 25M -1để bằng 2 để chạy mô phỏng
    if (counter == 2) begin 
      counter <= 0;
      clk_1hz <= ~clk_1hz; // Tạo xung clock 1Hz
    end else
      counter <= counter + 1;
  end
endmodule
