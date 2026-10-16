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
        // Test Case 1: Multiplicand A and Multiplier B
        multiplicandA = 8'd15; // 15
        multiplierB = 8'd3;    // 3
        multiplicandC = 8'd5;   // 5
        multiplierD = 8'd2;     // 2
        sel = 1'b1;             // Select A and B
        #10;
        if (product !== 16'd45) begin
            $display("FAIL: Test Case 1 failed, expected 45 but got %d", product);
            $finish;
        end

        // Test Case 2: Multiplicand C and Multiplier D
        sel = 1'b0;             // Select C and D
        #10;
        if (product !== 16'd10) begin
            $display("FAIL: Test Case 2 failed, expected 10 but got %d", product);
            $finish;
        end

        // Test Case 3: Edge case with zero
        multiplicandA = 8'd0;   // 0
        multiplierB = 8'd10;    // 10
        sel = 1'b1;             // Select A and B
        #10;
        if (product !== 16'd0) begin
            $display("FAIL: Test Case 3 failed, expected 0 but got %d", product);
            $finish;
        end

        // Test Case 4: Maximum values
        multiplicandA = 8'd255; // 255
        multiplierB = 8'd255;   // 255
        sel = 1'b1;             // Select A and B
        #10;
        if (product !== 16'd65025) begin
            $display("FAIL: Test Case 4 failed, expected 65025 but got %d", product);
            $finish;
        end

        // Test Case 5: Another combination
        multiplicandC = 8'd12;  // 12
        multiplierD = 8'd11;     // 11
        sel = 1'b0;             // Select C and D
        #10;
        if (product !== 16'd132) begin
            $display("FAIL: Test Case 5 failed, expected 132 but got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule