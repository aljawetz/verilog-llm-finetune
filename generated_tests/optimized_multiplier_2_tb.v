`timescale 1ns/1ps

module tb_optimized_multiplier;

    // Inputs
    reg [7:0] multiplicandA;
    reg [7:0] multiplierB;
    reg [7:0] multiplicandC;
    reg [7:0] multiplierD;
    reg sel;

    // Output
    wire [15:0] product;

    // Instantiate the Unit Under Test (UUT)
    optimized_multiplier uut (
        .multiplicandA(multiplicandA),
        .multiplierB(multiplierB),
        .multiplicandC(multiplicandC),
        .multiplierD(multiplierD),
        .sel(sel),
        .product(product)
    );

    initial begin
        // Test case 1: Multiplicand A and Multiplier B
        multiplicandA = 8'd15; // 15
        multiplierB = 8'd3;    // 3
        multiplicandC = 8'd0;   // 0
        multiplierD = 8'd0;     // 0
        sel = 1'b1;             // Select first pair
        #10;
        if (product !== 16'd45) begin
            $display("FAIL: Expected product 45, got %d", product);
            $finish;
        end

        // Test case 2: Multiplicand C and Multiplier D
        multiplicandA = 8'd0;   // 0
        multiplierB = 8'd0;     // 0
        multiplicandC = 8'd7;   // 7
        multiplierD = 8'd6;     // 6
        sel = 1'b0;             // Select second pair
        #10;
        if (product !== 16'd42) begin
            $display("FAIL: Expected product 42, got %d", product);
            $finish;
        end

        // Test case 3: Edge case with maximum values
        multiplicandA = 8'd255; // 255
        multiplierB = 8'd255;   // 255
        multiplicandC = 8'd255; // 255
        multiplierD = 8'd255;   // 255
        sel = 1'b1;             // Select first pair
        #10;
        if (product !== 16'd65025) begin
            $display("FAIL: Expected product 65025, got %d", product);
            $finish;
        end

        // Test case 4: Another edge case with zero
        multiplicandA = 8'd0;   // 0
        multiplierB = 8'd0;     // 0
        multiplicandC = 8'd0;   // 0
        multiplierD = 8'd0;     // 0
        sel = 1'b0;             // Select second pair
        #10;
        if (product !== 16'd0) begin
            $display("FAIL: Expected product 0, got %d", product);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule