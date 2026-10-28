module freq_mux(clk, mux_div);
    input clk;
    output mux_div;
    
    reg[16:0] q;
    parameter limit = 3; //112500
    
    always@(posedge clk) begin
        if(q==limit) q <= 0;
        else q <= q+1;
    end

    assign mux_div = (q == limit)? 1: 0; 

endmodule