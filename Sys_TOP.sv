module S_TOP(In_rst,In_clk,In_lock,a,b,c,d,e,f,g,disp_thou,disp_cent,disp_dec,disp_uni);
    input In_clk, In_rst, In_lock;
    output a,b,c,d,e,f,g, disp_dec, disp_uni, disp_cent, disp_thou;
    
    //Wire declarations
    wire [3:0] display_val, data_thou, data_cent, data_dec, data_uni;
    wire or_rst, o_comp, div_clk, clk_lock, ctr_slc;

    ctr25 m0(
        .In_clk(clk_lock),
        .In_rst(In_rst),
        .div_clk(div_clk)
    );
    
    ctr4 m1(
        .In_clk(In_clk),
        .In_rst(or_rst),
        .In_slc(ctr_slc),
        .uni(data_uni), 
        .dec(data_dec),
        .cent(data_cent),
        .thou(data_thou)
    );
    
    mux_decoder m2(
        .o_data(display_val),
        .In_clk(In_clk),
        .In_rst(In_rst),
        .data_uni(data_uni),
        .data_dec(data_dec),
        .data_cent(data_cent),
        .data_thou(data_thou)
    );
    
    decoder m3(
        .val(display_val),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );
    
    or_module m4(
        .out(or_rst),
        .In_A(In_rst),
        .In_B(o_comp)
    );
    
    comparator m5(
        .In_count_thou(data_thou),
        .In_count_cent(data_cent),
        .In_count_dec(data_dec),
        .In_count_uni(data_uni),
        .out(o_comp)
    );
    
    mux_display m6(
        .In_rst(In_rst),
        .In_clk(In_clk),
        .o_disp_uni(disp_uni), 
        .o_disp_dec(disp_dec),
        .o_disp_cent(disp_cent),
        .o_disp_thou(disp_thou)
    );

    lock_module m7(
        .In_clk(In_clk),
        .In_lock(In_lock),
        .o_lock(clk_lock)
    );

    toggle m8(
      .In_uni(data_uni), 
      .In_dec(data_dec),
      .In_cent(data_cent),
      .In_thou(data_thou),
      .out_mode(ctr_slc)
    );
endmodule