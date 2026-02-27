module key_to_digit(
input[7:0] scan_code,
output reg [3:0] digit,
output reg valid
);

always @(*) begin
valid = 1;
case(scan_code)
8'h16: digit = 1;
8'h1E: digit = 2;
8'h26: digit = 3;
8'h25: digit = 4;
8'h2E: digit = 5;
8'h36: digit = 6;
8'h3E: digit = 8;
8'h46: digit = 9; 
8'h45: digit = 0;
default: begin
	digit = 0;
	valid = 0;
end
endcase
end 
endmodule 
