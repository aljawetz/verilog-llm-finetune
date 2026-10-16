`timescale 1ns/1ps

module tb_store_weight;

    reg i_clk;
    reg i_rst_n;
    reg [7:0] i_w;
    reg [4:0] i_addr;
    reg i_wr_en;
    
    wire [7:0] o_w0;
    wire [7:0] o_w1;
    wire [7:0] o_w2;
    wire [7:0] o_w3;
    wire [7:0] o_w4;
    wire [7:0] o_w5;
    wire [7:0] o_w6;
    wire [7:0] o_w7;
    wire [7:0] o_w8;
    wire [7:0] o_w9;
    wire [7:0] o_w10;
    wire [7:0] o_w11;
    wire [7:0] o_w12;
    wire [7:0] o_w13;
    wire [7:0] o_w14;
    wire [7:0] o_w15;
    wire [7:0] o_w16;
    wire [7:0] o_w17;
    wire [7:0] o_w18;
    wire [7:0] o_w19;
    wire [7:0] o_w20;
    wire [7:0] o_w21;
    wire [7:0] o_w22;
    wire [7:0] o_w23;
    wire [7:0] o_w24;

    store_weight uut (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_w(i_w),
        .i_addr(i_addr),
        .i_wr_en(i_wr_en),
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
        // Initialize signals
        i_clk = 0;
        i_rst_n = 0;
        i_w = 8'b0;
        i_addr = 5'b0;
        i_wr_en = 0;

        // Release reset
        #5 i_rst_n = 1;

        // Test writing to registers
        i_wr_en = 1;

        // Write to register 0
        i_addr = 5'd0; i_w = 8'hAA; #10;
        if (o_w0 !== 8'hAA) $display("FAIL: Register 0 did not store the correct value");

        // Write to register 1
        i_addr = 5'd1; i_w = 8'hBB; #10;
        if (o_w1 !== 8'hBB) $display("FAIL: Register 1 did not store the correct value");

        // Write to register 2
        i_addr = 5'd2; i_w = 8'hCC; #10;
        if (o_w2 !== 8'hCC) $display("FAIL: Register 2 did not store the correct value");

        // Write to register 3
        i_addr = 5'd3; i_w = 8'hDD; #10;
        if (o_w3 !== 8'hDD) $display("FAIL: Register 3 did not store the correct value");

        // Write to register 4
        i_addr = 5'd4; i_w = 8'hEE; #10;
        if (o_w4 !== 8'hEE) $display("FAIL: Register 4 did not store the correct value");

        // Test reset functionality
        i_rst_n = 0; #5; // Assert reset
        i_rst_n = 1; #5; // Release reset

        // Check if all registers are reset to 0
        if (o_w0 !== 8'b0 || o_w1 !== 8'b0 || o_w2 !== 8'b0 || o_w3 !== 8'b0 || o_w4 !== 8'b0) 
            $display("FAIL: Registers are not reset to zero");

        // Final check for all registers
        i_addr = 5'd0; i_w = 8'hFF; #10; // Write to register 0 again
        if (o_w0 !== 8'hFF) $display("FAIL: Register 0 did not store the correct value after reset");

        // If all checks pass
        $display("PASS");
        $finish;
    end

    always #5 i_clk = ~i_clk; // Clock generation

endmodule