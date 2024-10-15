module clock(
  input clk,//thiết kế 1hz(dùng để đếm đồng hồ)
  input clk_50Mhz,
  input reset,// key0
  input start_pause,// key1
  // Bộ đếm số giây
  output reg [3:0] dvseconds_count, 
  output reg [3:0] chucseconds_count,
  // Bộ đếm số phút
  output reg [3:0] dvminutes_count, 
  output reg [3:0] chucminutes_count
);
  reg [1:0] key=2'b0;
  //nut nhan
  reg reset_prev, start_pause_prev;

  always @(posedge clk_50Mhz) begin
    reset_prev <= reset;
    start_pause_prev <= start_pause;
    if ((reset_prev && ~reset)) begin 
      key[0] <= ~key[0];
      key[1] <= 0;
    end
    if (start_pause_prev && ~start_pause) begin 
      key[1] <= ~key[1];
      key[0] <= 0;
    end 
  end
  //khởi tạo giá tri ban dau =0
  initial dvseconds_count = 0; 
  initial chucseconds_count = 0;
  initial dvminutes_count = 0; 
  initial chucminutes_count = 0;
  // Bộ đếm số
  always @(posedge clk) begin
    if (key[0]) begin
      dvseconds_count <= 0;
      chucseconds_count <= 0;
      dvminutes_count <= 0;
      chucminutes_count <= 0;
    end 
    else if (key[1]) begin
   // đếm 
        if (dvseconds_count == 9) begin
            dvseconds_count <= 0;
            if (chucseconds_count == 5) begin
                chucseconds_count <= 0;
                // tăng phút khi giay 59
                if (dvminutes_count == 9) begin
                    dvminutes_count <= 0;
                    if (chucminutes_count == 5) begin
                        chucminutes_count <= 0; // Reset 
                    end else begin
                        chucminutes_count <= chucminutes_count + 1;
                    end
                end else begin
                    dvminutes_count <= dvminutes_count + 1;
                end
            end else begin
                chucseconds_count <= chucseconds_count + 1;
            end
        end else begin
            dvseconds_count <= dvseconds_count + 1;
        end
    end
    else begin
      dvseconds_count <= dvseconds_count;
      chucseconds_count <= chucseconds_count;
      dvminutes_count <= dvminutes_count;
      chucminutes_count <= chucminutes_count;
    end
  end
endmodule
