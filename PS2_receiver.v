module PS2_receiver(
input clk,
input ps2_clk,
input ps2_data,
output reg [7:0] scan_code,
output reg ready
);

reg [10:0] shift_reg;
reg [3:0] count = 0;

reg ps2_clk_prev = 1;

always@(posedge clk) begin
ps2_clk_prev <= ps2_clk;

if(ps2_clk_prev && !ps2_clk) begin

shift_reg <= {ps2_data, shift_reg[10:1]};
count <= count+1;

if (count == 10) begin
scan_code <= shift_reg[8:1];
ready <= 1;
count <= 0; 
end else begin
ready <= 0; 

end 
end 
end 
endmodule 
