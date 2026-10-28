module lock_module(In_clk,In_lock,o_lock);
    input In_clk, In_lock;
    output o_lock;
    
    reg sw_prev, sw_state;

    initial sw_state = 1;
    always@(posedge In_clk)begin
        sw_prev <= In_lock;
        if(In_lock && !sw_prev)begin
            sw_state <= ~sw_state;
        end 
    end
    
    assign o_lock = In_clk && sw_state;

endmodule