`timescale 1ns/1ps

module tb_efficient_multiplier;

    // Inputs
    reg [7:0] multiplicandA;
    reg [7:0] multiplierB;
    reg [7:0] multiplicandC;
    reg [7:0] multiplierD;
    reg sel;

    // Output
    wire [15:0] product;

    // Instantiate the Unit Under Test (UUT)
    efficient_multiplier uut (
        .multiplicandA(multiplicandA),
        .multiplierB(multiplierB),
        .multiplicandC(multiplicandC),
        .multiplierD(multiplierD),
        .sel(sel),
        .product(product)
    );

    initial begin
        // Test Case 1: Select first pair (A * B)
        multiplicandA = 8'd5;      // 5
        multiplierB = 8'd3;        // 3
        multiplicandC = 8'd7;      // 7
        multiplierD = 8'd2;        // 2
        sel = 1'b1;                // Select A and B
        #10;                        // Wait for the product to settle
        if (product !== 16'd15)    // 5 * 3 = 15
            $display("FAIL: Expected product 15, got %d", product);
        
        // Test Case 2: Select second pair (C * D)
        sel = 1'b0;                // Select C and D
        #10;                        // Wait for the product to settle
        if (product !== 16'd14)    // 7 * 2 = 14
            $display("FAIL: Expected product 14, got %d", product);
        
        // Test Case 3: Edge case (0 * B)
        multiplicandA = 8'd0;      // 0
        multiplierB = 8'd10;       // 10
        sel = 1'b1;                // Select A and B
        #10;                        // Wait for the product to settle
        if (product !== 16'd0)     // 0 * 10 = 0
            $display("FAIL: Expected product 0, got %d", product);
        
        // Test Case 4: Edge case (C * 0)
        multiplicandC = 8'd8;      // 8
        multiplierD = 8'd0;        // 0
        sel = 1'b0;                // Select C and D
        #10;                        // Wait for the product to settle
        if (product !== 16'd0)     // 8 * 0 = 0
            $display("FAIL: Expected product 0, got %d", product);
        
        // Test Case 5: Maximum values
        multiplicandA = 8'd255;    // 255
        multiplierB = 8'd255;      // 255
        sel = 1'b1;                // Select A and B
        #10;                        // Wait for the product to settle
        if (product !== 16'd65025)  // 255 * 255 = 65025
            $display("FAIL: Expected product 65025, got %d", product);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule