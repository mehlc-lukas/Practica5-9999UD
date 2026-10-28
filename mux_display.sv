module mux_display(In_rst, In_clk, o_disp_uni, o_disp_dec, o_disp_cent, o_disp_thou);
    input In_clk, In_rst;
    output logic o_disp_uni, o_disp_dec, o_disp_cent, o_disp_thou;
    
    logic [2:0] ctr;
    always@(posedge In_rst,posedge In_clk)begin
        if(In_rst)ctr<=3'd0;
        else begin
        case(ctr)
            2'b00:     {o_disp_thou,o_disp_cent,o_disp_dec,o_disp_uni} <= 4'b1110;//   4'b1110;
            2'b01:     {o_disp_thou,o_disp_cent,o_disp_dec,o_disp_uni} <= 4'b1101;//   4'b1101;
            2'b10:     {o_disp_thou,o_disp_cent,o_disp_dec,o_disp_uni} <= 4'b1011;//   4'b1011;
            2'b11:     {o_disp_thou,o_disp_cent,o_disp_dec,o_disp_uni} <= 4'b0111;//   4'b0111;
            default:   {o_disp_thou,o_disp_cent,o_disp_dec,o_disp_uni} <= 4'b1111;//   ALL OFF;
        endcase
        ctr <= (ctr == 3'd4)? 3'b000: ctr+1;
        end
    end
endmodule