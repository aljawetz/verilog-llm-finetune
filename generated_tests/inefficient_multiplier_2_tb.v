`timescale 1ns/1ps

module tb_inefficient_multiplier;

    // Inputs
    reg [7:0] multiplicandA;
    reg [7:0] multiplierB;
    reg [7:0] multiplicandC;
    reg [7:0] multiplierD;
    reg sel;

    // Output
    wire [15:0] product;

    // Instantiate the Unit Under Test (UUT)
    inefficient_multiplier uut (
        .multiplicandA(multiplicandA),
        .multiplierB(multiplierB),
        .multiplicandC(multiplicandC),
        .multiplierD(multiplierD),
        .sel(sel),
        .product(product)
    );

    initial begin
        // Test case 1: Test with multiplicandA = 3, multiplierB = 4 (should yield 12)
        multiplicandA = 8'd3;
        multiplierB = 8'd4;
        multiplicandC = 8'd0; // Not used
        multiplierD = 8'd0;   // Not used
        sel = 1'b1; // Select first pair
        #10;
        if (product !== 16'd12) begin
            $display("FAIL: Test case 1 failed, expected 12 but got %d", product);
            $finish;
        end

        // Test case 2: Test with multiplicandC = 5, multiplierD = 6 (should yield 30)
        multiplicandA = 8'd0; // Not used
        multiplierB = 8'd0;   // Not used
        multiplicandC = 8'd5;
        multiplierD = 8'd6;
        sel = 1'b0; // Select second pair
        #10;
        if (product !== 16'd30) begin
            $display("FAIL: Test case 2 failed, expected 30 but got %d", product);
            $finish;
        end

        // Test case 3: Test with multiplicandA = 255, multiplierB = 255 (should yield 65025)
        multiplicandA = 8'd255;
        multiplierB = 8'd255;
        multiplicandC = 8'd0; // Not used
        multiplierD = 8'd0;   // Not used
        sel = 1'b1; // Select first pair
        #10;
        if (product !== 16'd65025) begin
            $display("FAIL: Test case 3 failed, expected 65025 but got %d", product);
            $finish;
        end

        // Test case 4: Test with multiplicandC = 1, multiplierD = 1 (should yield 1)
        multiplicandA = 8'd0; // Not used
        multiplierB = 8'd0;   // Not used
        multiplicandC = 8'd1;
        multiplierD = 8'd1;
        sel = 1'b0; // Select second pair
        #10;
        if (product !== 16'd1) begin
            $display("FAIL: Test case 4 failed, expected 1 but got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule