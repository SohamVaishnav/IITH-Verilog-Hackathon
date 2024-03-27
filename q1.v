module Master(ss, MOSI, done, data_in, clk, rst);
    output reg ss, MOSI, done;
    input data_in, clk, rst;

    integer count;

    always @ (posedge clk) begin 
        done = 0;
        if (rst != 1) begin 
            ss = 1;
            if (ss == 1) begin 
                MOSI = data_in;
                if (data_in == 1) begin 
                    count = count + 1;
                end
                else if (data_in == 0) begin
                    count = 0; 
                end
                if (count == 4) begin 
                    ss <= 0;
                    done <= 1;
                end
            end
        end
        else begin
            done <= 0;
            ss <= 0;
            count <= 0;
        end
    end
endmodule 