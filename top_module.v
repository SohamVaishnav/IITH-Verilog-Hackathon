module top_module(
input clk,
input load,
input [255:0] data,
output reg [255:0] q );

initial
begin
    q = data;
end

reg [15:0] curr [15:0];

integer i,j,count;

always@(posedge clk)
begin
    curr[0] = data[15:0];
    curr[1] = data[31:16];
    curr[2] = data[47:32];
    curr[3] = data[63:48];
    curr[4] = data[79:64];
    curr[5] = data[95:80];
    curr[6] = data[111:96];
    curr[7] = data[127:112];
    curr[8] = data[143:128];
    curr[9] = data[159:144];
    curr[10] = data[175:160];
    curr[11] = data[191:176];
    curr[12] = data[207:192];
    curr[13] = data[223:208];
    curr[14] = data[239:224];
    curr[15] = data[255:240];

    for(i = 0; i< 16 ; i = i+1)
    begin
        for(j = 0; j<16; j = j+1)
        begin
            count = 0;
            if((i >=1) && (i<15) && (j >=1) && (j<15))
            begin
                if(curr[i-1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j+1] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((i==0) && (j>=1) && (j<15))
            begin
                if(curr[15][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[15][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[15][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j+1] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((i ==15) && (j >=1) && (j<15))
            begin
                if(curr[i-1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][j+1] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((i >=1) && (i<15) && (j ==0))
            begin
                if(curr[i-1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j+1] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((i >=1) && (i<15) && (j >=15))
            begin
                if(curr[i-1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][0] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][0] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][0] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((i ==0) && (j == 0) )
            begin
                if(curr[15][0] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[1][0] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[15][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[15][1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[1][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[1][1] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((i == 15) &&(j ==15))
            begin
                if(curr[i-1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][0] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][0] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][0] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((i ==0) && (j==15))
            begin
                if(curr[15][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][0] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[15][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[15][0] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][j-1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i+1][0] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((i ==15) &&(j ==0))
            begin
                if(curr[i-1][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][j] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[i-1][j+1] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][15] == 1)
                begin
                    count = count +1 ;
                end
                if(curr[0][j+1] == 1)
                begin
                    count = count +1 ;
                end
            end

            if((count == 0) || (count == 1))
            begin
                curr[i][j] = 0;
            end
            else if(count == 3)
            begin
                curr[i][j] = 1;
            end
            else if(count >=4)
            begin
                curr[i][j] = 0;
            end
        end
    end

    q[15:0] = curr[0];
    q[31:16] = curr[1];
    q[47:32] = curr[2];
    q[63:48] = curr[3];
    q[79:64] = curr[4];
    q[95:80] = curr[5];
    q[111:96] = curr[6];
    q[127:112] = curr[7];
    q[143:128] = curr[8];
    q[159:144] = curr[9];
    q[175:160] = curr[10];
    q[191:176] = curr[11];
    q[207:192] = curr[12];
    q[223:208] = curr[13];
    q[239:224] = curr[14];
    q[255:240] = curr[15];

end


endmodule

