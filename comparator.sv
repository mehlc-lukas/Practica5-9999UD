module comparator(In_count_dec, In_count_uni, In_count_cent, In_count_thou, out);
    input [3:0] In_count_dec, In_count_uni, In_count_cent, In_count_thou;
    output out;
    
    assign out = (In_count_uni==4'd1 && In_count_dec==4'd0 && In_count_cent==4'd0 && In_count_thou==4'd10)? 1:0; // 4'd0 - 4'd10 for 0 to 99
endmodule