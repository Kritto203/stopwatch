module decoder7d(
	input [3:0] Q,
  output [0:6] hex 
);
	assign hex =(Q== 4'd0)? 7'b0000001:
					(Q== 4'd1)? 7'b1001111:
					(Q== 4'd2)? 7'b0010010:
					(Q== 4'd3)? 7'b0000110:
					(Q== 4'd4)? 7'b1001100:
					(Q== 4'd5)? 7'b0100100:
					(Q== 4'd6)? 7'b0100000:
					(Q== 4'd7)? 7'b0001111:
					(Q== 4'd8)? 7'b0000000:
					(Q== 4'd9)? 7'b0000100: 7'b1111111;
					
endmodule