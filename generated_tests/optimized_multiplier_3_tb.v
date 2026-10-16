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
        // Test case 1: Test first pair (A * B)
        multiplicandA = 8'd15; // 15
        multiplierB = 8'd3;    // 3
        multiplicandC = 8'd0;   // 0
        multiplierD = 8'd0;     // 0
        sel = 1'b1;             // Select A and B
        #10;
        if (product !== (multiplicandA * multiplierB)) begin
            $display("FAIL: Test case 1 failed. Expected %d, got %d", multiplicandA * multiplierB, product);
            $finish;
        end

        // Test case 2: Test second pair (C * D)
        multiplicandA = 8'd0;   // 0
        multiplierB = 8'd0;     // 0
        multiplicandC = 8'd7;   // 7
        multiplierD = 8'd6;     // 6
        sel = 1'b0;             // Select C and D
        #10;
        if (product !== (multiplicandC * multiplierD)) begin
            $display("FAIL: Test case 2 failed. Expected %d, got %d", multiplicandC * multiplierD, product);
            $finish;
        end

        // Test case 3: Test first pair with different values
        multiplicandA = 8'd8;   // 8
        multiplierB = 8'd2;     // 2
        sel = 1'b1;             // Select A and B
        #10;
        if (product !== (multiplicandA * multiplierB)) begin
            $display("FAIL: Test case 3 failed. Expected %d, got %d", multiplicandA * multiplierB, product);
            $finish;
        end

        // Test case 4: Test second pair with different values
        multiplicandC = 8'd4;   // 4
        multiplierD = 8'd5;     // 5
        sel = 1'b0;             // Select C and D
        #10;
        if (product !== (multiplicandC * multiplierD)) begin
            $display("FAIL: Test case 4 failed. Expected %d, got %d", multiplicandC * multiplierD, product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule