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
        // Test case 1: sel = 1, A = 3, B = 4 (Expected product = 12)
        multiplicandA = 8'd3;
        multiplierB = 8'd4;
        multiplicandC = 8'd0; // Not used
        multiplierD = 8'd0;   // Not used
        sel = 1'b1;
        #10;
        if (product !== 16'd12) begin
            $display("FAIL: Test case 1 failed, expected 12 but got %d", product);
            $finish;
        end

        // Test case 2: sel = 0, C = 5, D = 6 (Expected product = 30)
        multiplicandC = 8'd5;
        multiplierD = 8'd6;
        sel = 1'b0;
        #10;
        if (product !== 16'd30) begin
            $display("FAIL: Test case 2 failed, expected 30 but got %d", product);
            $finish;
        end

        // Test case 3: sel = 1, A = 10, B = 10 (Expected product = 100)
        multiplicandA = 8'd10;
        multiplierB = 8'd10;
        sel = 1'b1;
        #10;
        if (product !== 16'd100) begin
            $display("FAIL: Test case 3 failed, expected 100 but got %d", product);
            $finish;
        end

        // Test case 4: sel = 0, C = 7, D = 8 (Expected product = 56)
        multiplicandC = 8'd7;
        multiplierD = 8'd8;
        sel = 1'b0;
        #10;
        if (product !== 16'd56) begin
            $display("FAIL: Test case 4 failed, expected 56 but got %d", product);
            $finish;
        end

        // Test case 5: sel = 1, A = 15, B = 15 (Expected product = 225)
        multiplicandA = 8'd15;
        multiplierB = 8'd15;
        sel = 1'b1;
        #10;
        if (product !== 16'd225) begin
            $display("FAIL: Test case 5 failed, expected 225 but got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule