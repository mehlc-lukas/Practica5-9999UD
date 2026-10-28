module toggle(In_uni, In_dec, In_cent, In_thou, out_mode);
    input [3:0] In_uni, In_dec, In_cent, In_thou;
    output logic out_mode;
    
    logic [15:0] q;
    
    parameter limit_up = 16'h9_9_9_9;
    parameter limit_dn = 16'h0_0_0_0;
    
    always@(*)begin
        q <= {In_thou,In_cent,In_dec,In_uni};
        if(q == limit_up)begin
            out_mode <= 1; 
        end if(q == limit_dn)begin
            out_mode <= 0;
        end 
    end
endmodule