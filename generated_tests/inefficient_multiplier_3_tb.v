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
        // Test case 1: sel = 0, multiplicandC = 3, multiplierD = 4
        multiplicandC = 8'd3;
        multiplierD = 8'd4;
        sel = 0;
        #10;
        if (product !== 16'd12) begin
            $display("FAIL: Test case 1 failed, expected 12 but got %d", product);
            $finish;
        end

        // Test case 2: sel = 1, multiplicandA = 5, multiplierB = 6
        multiplicandA = 8'd5;
        multiplierB = 8'd6;
        sel = 1;
        #10;
        if (product !== 16'd30) begin
            $display("FAIL: Test case 2 failed, expected 30 but got %d", product);
            $finish;
        end

        // Test case 3: sel = 0, multiplicandC = 255, multiplierD = 1
        multiplicandC = 8'd255;
        multiplierD = 8'd1;
        sel = 0;
        #10;
        if (product !== 16'd255) begin
            $display("FAIL: Test case 3 failed, expected 255 but got %d", product);
            $finish;
        end

        // Test case 4: sel = 1, multiplicandA = 0, multiplierB = 0
        multiplicandA = 8'd0;
        multiplierB = 8'd0;
        sel = 1;
        #10;
        if (product !== 16'd0) begin
            $display("FAIL: Test case 4 failed, expected 0 but got %d", product);
            $finish;
        end

        // Test case 5: sel = 0, multiplicandC = 10, multiplierD = 10
        multiplicandC = 8'd10;
        multiplierD = 8'd10;
        sel = 0;
        #10;
        if (product !== 16'd100) begin
            $display("FAIL: Test case 5 failed, expected 100 but got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule