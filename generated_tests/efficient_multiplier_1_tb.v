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
        // Test case 1: Multiplicand A = 5, Multiplier B = 3 (should select A and B)
        multiplicandA = 8'd5;
        multiplierB = 8'd3;
        multiplicandC = 8'd10;
        multiplierD = 8'd2;
        sel = 1'b1; // Select A and B
        #10;
        if (product !== 16'd15) begin
            $display("FAIL: Test case 1 failed, expected 15 but got %d", product);
            $finish;
        end

        // Test case 2: Multiplicand C = 10, Multiplier D = 2 (should select C and D)
        sel = 1'b0; // Select C and D
        #10;
        if (product !== 16'd20) begin
            $display("FAIL: Test case 2 failed, expected 20 but got %d", product);
            $finish;
        end

        // Test case 3: Multiplicand A = 0, Multiplier B = 5 (should select A and B)
        multiplicandA = 8'd0;
        multiplierB = 8'd5;
        sel = 1'b1; // Select A and B
        #10;
        if (product !== 16'd0) begin
            $display("FAIL: Test case 3 failed, expected 0 but got %d", product);
            $finish;
        end

        // Test case 4: Multiplicand C = 7, Multiplier D = 6 (should select C and D)
        multiplicandC = 8'd7;
        multiplierD = 8'd6;
        sel = 1'b0; // Select C and D
        #10;
        if (product !== 16'd42) begin
            $display("FAIL: Test case 4 failed, expected 42 but got %d", product);
            $finish;
        end

        // Test case 5: Multiplicand A = 255, Multiplier B = 1 (should select A and B)
        multiplicandA = 8'd255;
        multiplierB = 8'd1;
        sel = 1'b1; // Select A and B
        #10;
        if (product !== 16'd255) begin
            $display("FAIL: Test case 5 failed, expected 255 but got %d", product);
            $finish;
        end

        // Test case 6: Multiplicand C = 128, Multiplier D = 2 (should select C and D)
        multiplicandC = 8'd128;
        multiplierD = 8'd2;
        sel = 1'b0; // Select C and D
        #10;
        if (product !== 16'd256) begin
            $display("FAIL: Test case 6 failed, expected 256 but got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule