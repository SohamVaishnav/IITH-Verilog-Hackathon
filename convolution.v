module conv(input [15:0][7:0] signal_a,
input [15:0][7:0] signal_b, 
output reg [30:0][7:0] convoluted_signal, 
output reg invalid_input_flag);

initial begin 
    invalid_input_flag = 0;
end

integer i;
integer j;
integer count_a, count_b;
always @ (*) begin 
    count_a = 0;
    for (i=0 ; i<=15 ; i=i+1) begin 
        if (signal_a[i] == 0)
            count_a = count_a + 1;
    end
    count_b = 0;
    for (i=0 ; i<=15 ; i=i+1) begin 
        if (signal_a[i] == 0)
            count_b = count_b + 1;
    end

    if (count_a == 16 || count_b == 16) begin 
        invalid_input_flag = 1;
    end
end

reg [7:0] rev [15:0];
always @ (*) begin
    if (invalid_input_flag == 0) begin 
    for (i=0 ; i<=15 ; i=i+1)begin 
        rev[i] = signal_b[15-i];
    end
    for (i=0 ; i<=15; i=i+1) begin 
        for (j=0 ; j<i+1 ; j=j+1) begin 
            convoluted_signal[i] = convoluted_signal[i] + signal_a[j]*rev[(15-i)+j];
        end
    end
    for (i=0 ; i<=14; i=i+1) begin 
        for (j=0 ; j<i+1 ; j=j+1) begin 
            convoluted_signal[30-i] = convoluted_signal[30-i] + rev[j]*signal_a[15-i+j];
        end
    end
    end
end
endmodule