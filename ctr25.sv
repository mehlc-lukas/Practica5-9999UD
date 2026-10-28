module ctr25(In_rst, In_clk, div_clk);
    input In_clk, In_rst;
    output div_clk;

    reg[24:0]q;
    parameter limit = 25'd27000000;
    always@(posedge In_rst, posedge In_clk)begin
        if(In_rst || q == limit)begin
            q <= 25'd0;
        end else begin
            q <= q+1;
        end
    end
    assign div_clk = q[20];
endmodule