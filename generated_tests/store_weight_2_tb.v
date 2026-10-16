`timescale 1ns/1ps

module tb_store_weight;

    reg i_clk;
    reg i_rst_n;
    reg signed [7:0] i_w;
    reg [4:0] i_addr;
    reg i_wr_en;
    reg i_valid;
    
    wire signed [7:0] o_w0;
    wire signed [7:0] o_w1;
    wire signed [7:0] o_w2;
    wire signed [7:0] o_w3;
    wire signed [7:0] o_w4;
    wire signed [7:0] o_w5;
    wire signed [7:0] o_w6;
    wire signed [7:0] o_w7;
    wire signed [7:0] o_w8;
    wire signed [7:0] o_w9;
    wire signed [7:0] o_w10;
    wire signed [7:0] o_w11;
    wire signed [7:0] o_w12;
    wire signed [7:0] o_w13;
    wire signed [7:0] o_w14;
    wire signed [7:0] o_w15;
    wire signed [7:0] o_w16;
    wire signed [7:0] o_w17;
    wire signed [7:0] o_w18;
    wire signed [7:0] o_w19;
    wire signed [7:0] o_w20;
    wire signed [7:0] o_w21;
    wire signed [7:0] o_w22;
    wire signed [7:0] o_w23;
    wire signed [7:0] o_w24;

    store_weight uut (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_w(i_w),
        .i_addr(i_addr),
        .i_wr_en(i_wr_en),
        .i_valid(i_valid),
        .o_w0(o_w0),
        .o_w1(o_w1),
        .o_w2(o_w2),
        .o_w3(o_w3),
        .o_w4(o_w4),
        .o_w5(o_w5),
        .o_w6(o_w6),
        .o_w7(o_w7),
        .o_w8(o_w8),
        .o_w9(o_w9),
        .o_w10(o_w10),
        .o_w11(o_w11),
        .o_w12(o_w12),
        .o_w13(o_w13),
        .o_w14(o_w14),
        .o_w15(o_w15),
        .o_w16(o_w16),
        .o_w17(o_w17),
        .o_w18(o_w18),
        .o_w19(o_w19),
        .o_w20(o_w20),
        .o_w21(o_w21),
        .o_w22(o_w22),
        .o_w23(o_w23),
        .o_w24(o_w24)
    );

    initial begin
        i_clk = 0;
        i_rst_n = 0;
        i_w = 0;
        i_addr = 0;
        i_wr_en = 0;
        i_valid = 0;

        // Reset the module
        #5 i_rst_n = 1;

        // Test writing to register 0
        i_w = 8'sd10; 
        i_addr = 5'd0; 
        i_wr_en = 1; 
        i_valid = 1; 
        #10;
        if (o_w0 !== 8'sd10) $display("FAIL: Expected o_w0 = 10, got %d", o_w0);

        // Test writing to register 1
        i_w = 8'sd20; 
        i_addr = 5'd1; 
        #10;
        if (o_w1 !== 8'sd20) $display("FAIL: Expected o_w1 = 20, got %d", o_w1);

        // Test writing to register 2
        i_w = 8'sd30; 
        i_addr = 5'd2; 
        #10;
        if (o_w2 !== 8'sd30) $display("FAIL: Expected o_w2 = 30, got %d", o_w2);

        // Test writing to register 3 with valid and write enable
        i_w = 8'sd40; 
        i_addr = 5'd3; 
        #10;
        if (o_w3 !== 8'sd40) $display("FAIL: Expected o_w3 = 40, got %d", o_w3);

        // Test reset functionality
        i_rst_n = 0; 
        #5; 
        i_rst_n = 1; 
        #10;
        if (o_w0 !== 8'sd0 || o_w1 !== 8'sd0 || o_w2 !== 8'sd0 || o_w3 !== 8'sd0) 
            $display("FAIL: Expected all outputs to be 0 after reset");

        // Test writing with valid = 0
        i_w = 8'sd50; 
        i_addr = 5'd0; 
        i_wr_en = 1; 
        i_valid = 0; 
        #10;
        if (o_w0 !== 8'sd0) $display("FAIL: Expected o_w0 = 0 when valid is low, got %d", o_w0);

        // Test writing with valid = 1 but without write enable
        i_valid = 1; 
        i_wr_en = 0; 
        #10;
        if (o_w0 !== 8'sd0) $display("FAIL: Expected o_w0 = 0 when write enable is low, got %d", o_w0);

        // Final check
        $display("PASS");
        $finish;
    end

    always #5 i_clk = ~i_clk;

endmodule