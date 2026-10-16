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
        // Test case 1: Select first pair
        multiplicandA = 8'd3; multiplierB = 8'd4; // 3 * 4 = 12
        multiplicandC = 8'd5; multiplierD = 8'd6; // 5 * 6 = 30
        sel = 1'b1; // Select A and B
        #10;
        if (product !== 12) begin
            $display("FAIL: Test case 1 failed, expected 12 but got %d", product);
            $finish;
        end

        // Test case 2: Select second pair
        sel = 1'b0; // Select C and D
        #10;
        if (product !== 30) begin
            $display("FAIL: Test case 2 failed, expected 30 but got %d", product);
            $finish;
        end

        // Test case 3: Edge case with zeros
        multiplicandA = 8'd0; multiplierB = 8'd0; // 0 * 0 = 0
        multiplicandC = 8'd0; multiplierD = 8'd0; // 0 * 0 = 0
        sel = 1'b1; // Select A and B
        #10;
        if (product !== 0) begin
            $display("FAIL: Test case 3 failed, expected 0 but got %d", product);
            $finish;
        end

        // Test case 4: Large values
        multiplicandA = 8'd255; multiplierB = 8'd255; // 255 * 255 = 65025
        multiplicandC = 8'd128; multiplierD = 8'd2;   // 128 * 2 = 256
        sel = 1'b1; // Select A and B
        #10;
        if (product !== 65025) begin
            $display("FAIL: Test case 4 failed, expected 65025 but got %d", product);
            $finish;
        end

        sel = 1'b0; // Select C and D
        #10;
        if (product !== 256) begin
            $display("FAIL: Test case 4 failed, expected 256 but got %d", product);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule