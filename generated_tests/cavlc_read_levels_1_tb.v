`timescale 1ns/1ps

module tb_cavlc_read_levels;

    // Parameters
    reg clk;
    reg rst_n;
    reg ena;
    reg t1s_sel;
    reg prefix_sel;
    reg suffix_sel;
    reg calc_sel;
    reg [1:0] TrailingOnes;
    reg [4:0] TotalCoeff;
    reg [0:15] rbsp;
    reg [3:0] i;
    
    wire [8:0] level_0;
    wire [8:0] level_1;
    wire [8:0] level_2;
    wire [8:0] level_3;
    wire [8:0] level_4;
    wire [8:0] level_5;
    wire [8:0] level_6;
    wire [8:0] level_7;
    wire [8:0] level_8;
    wire [8:0] level_9;
    wire [8:0] level_10;
    wire [8:0] level_11;
    wire [8:0] level_12;
    wire [8:0] level_13;
    wire [8:0] level_14;
    wire [8:0] level_15;
    wire [4:0] len_comb;

    // Instantiate the Unit Under Test (UUT)
    cavlc_read_levels uut (
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .t1s_sel(t1s_sel),
        .prefix_sel(prefix_sel),
        .suffix_sel(suffix_sel),
        .calc_sel(calc_sel),
        .TrailingOnes(TrailingOnes),
        .TotalCoeff(TotalCoeff),
        .rbsp(rbsp),
        .i(i),
        .level_0(level_0),
        .level_1(level_1),
        .level_2(level_2),
        .level_3(level_3),
        .level_4(level_4),
        .level_5(level_5),
        .level_6(level_6),
        .level_7(level_7),
        .level_8(level_8),
        .level_9(level_9),
        .level_10(level_10),
        .level_11(level_11),
        .level_12(level_12),
        .level_13(level_13),
        .level_14(level_14),
        .level_15(level_15),
        .len_comb(len_comb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst_n = 0;
        ena = 0;
        t1s_sel = 0;
        prefix_sel = 0;
        suffix_sel = 0;
        calc_sel = 0;
        TrailingOnes = 2'b00;
        TotalCoeff = 5'b00000;
        rbsp = 16'b0000000000000000;
        i = 4'b0000;

        // Release reset
        #10;
        rst_n = 1;

        // Test case 1: Basic operation
        ena = 1;
        t1s_sel = 1;
        TotalCoeff = 5'b00011; // 3 coefficients
        TrailingOnes = 2'b01; // 1 trailing one
        rbsp = 16'b0000000000000001; // rbsp input
        i = 4'b0000; // First level

        #10;
        if (level_0 !== 1) begin
            $display("FAIL: level_0 expected 1, got %d", level_0);
            $finish;
        end

        // Test case 2: Check second level
        i = 4'b0001; // Second level
        #10;
        if (level_1 !== 1) begin
            $display("FAIL: level_1 expected 1, got %d", level_1);
            $finish;
        end

        // Test case 3: Check with different rbsp
        rbsp = 16'b0000000000000010; // Change rbsp input
        i = 4'b0000; // First level again
        #10;
        if (level_0 !== 1) begin
            $display("FAIL: level_0 expected 1, got %d", level_0);
            $finish;
        end

        // Test case 4: Check suffix selection
        suffix_sel = 1;
        #10;
        if (len_comb !== 1) begin
            $display("FAIL: len_comb expected 1, got %d", len_comb);
            $finish;
        end

        // Test case 5: Check calculation selection
        calc_sel = 1;
        #10;
        if (level_0 !== 1) begin
            $display("FAIL: level_0 expected 1, got %d", level_0);
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule