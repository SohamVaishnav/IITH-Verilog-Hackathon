module divider(input [7:0] dividend, divisor, 
output reg [7:0] quotient, remainder,
output reg divisor_zero_flag);

initial begin
     quotient = 0;
     remainder = 0;
     divisor_zero_flag = 0;
end
reg dzf;
integer i;
always @ (*) begin
    if (divisor == 0) begin 
        divisor_zero_flag = 1;
    end
    if (divisor_zero_flag == 0) begin
    remainder = dividend - divisor;
    quotient = 1;
    for (i=0; i<=dividend; i=i+1) begin 
        if (remainder > 0) begin 
            remainder = remainder - divisor;
            quotient = quotient + 1;
        end
        else if (remainder == 0) begin 
            $finish;
        end
        else if (remainder < 0) begin 
            quotient = quotient - 1;
            remainder = remainder + divisor;
            $finish;
        end
    end
    end
end
endmodule 