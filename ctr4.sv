module ctr4(In_clk, In_rst, In_slc, uni, dec, cent, thou);
    input In_clk, In_rst, In_slc;
    output logic[3:0] uni, dec, cent, thou;

    always@(posedge In_rst, posedge In_clk)begin
        if(In_rst) begin // Reset all to NULL when external reset is pulled UP!
            uni  <= 4'd0;
            dec  <= 4'd0;
            cent <= 4'd0;
            thou <= 4'd0;
        end else begin
            if(!In_slc)begin // Incremental count
                if(uni == 4'd9 && dec != 4'd9)begin
                    uni <= 4'd0;
                    dec <= dec+1;
                end else if(uni == 4'd9 && dec == 4'd9 && cent != 4'd9)begin 
                    uni <= 4'd0;
                    dec <= 4'd0;
                    cent <= cent+1;
                end else if(uni == 4'd9 && dec == 4'd9 && cent == 4'd9)begin
                    uni <= 4'd0;
                    dec <= 4'd0;
                    cent <= 4'd0;
                    thou <= thou+1;
                end else begin
                    uni <= uni+1;
                end
            end else begin  // Reverse count
                if(uni == 4'd0 && dec == 4'd0 && cent == 4'd0 && thou != 4'd0)begin
                    uni <= 4'd9;
                    dec <= 4'd9;
                    cent <= 4'd9;
                    thou <= thou-1;
                end else if (uni == 4'd0 && dec == 4'd0 && cent != 4'd0)begin
                    uni <= 4'd9;
                    dec <= 4'd9;
                    cent <= cent-1;
                end else if (uni == 4'd0 && dec != 4'd0)begin
                    uni <= 4'd9;
                    dec <= dec-1;
                end else begin  
                    uni <= uni-1; 
                end
                end
            end 
        end
endmodule