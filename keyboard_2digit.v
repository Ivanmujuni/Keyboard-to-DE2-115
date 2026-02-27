module keyboard_2digit(
input clk,
input PS2_CLK,
input PS2_DAT,
output [6:0] HEX0,
output [6:0] HEX1
);

wire [7:0] scan_code;
wire ready;

wire [3:0] digit;
wire valid;

PS2_receiver PS2(
.clk(clk),
.ps2_clk(PS2_CLK),
.ps2_data(PS2_DAT),
.scan_code(scan_code),
.ready(ready)
);

key_to_digit decoder(
.scan_code(scan_code),
.digit(digit),
.valid(valid)
);

reg[3:0] number = 0;

always@(posedge clk) begin
if(ready && valid) begin
number <= digit;
end
end 

wire[3:0] ones;
wire[3:0] tens;

assign ones = number % 10;
assign tens = number / 10;

seven_seg_2decoder d0 (
.bin(ones),
.seg(HEX0)
);

seven_seg_2decoder d1(
.bin(tens),
.seg(HEX1)
);

endmodule 
