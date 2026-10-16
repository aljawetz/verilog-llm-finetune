`timescale 1ns/1ps

module tb_CLA;

    reg [3:0] a;
    reg [3:0] b;
    reg carryIn;
    wire carryOut;
    wire [3:0] sum;

    // Instantiate the CLA module
    CLA uut (
        .a(a),
        .b(b),
        .carryIn(carryIn),
        .carryOut(carryOut),
        .sum(sum)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        a = 4'b0000; b = 4'b0000; carryIn = 1'b0;
        #10;
        if (sum !== 4'b0000 || carryOut !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 + 0 = 2
        a = 4'b0001; b = 4'b0001; carryIn = 1'b0;
        #10;
        if (sum !== 4'b0010 || carryOut !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 3 + 3 + 0 = 6
        a = 4'b0011; b = 4'b0011; carryIn = 1'b0;
        #10;
        if (sum !== 4'b0110 || carryOut !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 7 + 1 + 0 = 8
        a = 4'b0111; b = 4'b0001; carryIn = 1'b0;
        #10;
        if (sum !== 4'b1000 || carryOut !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 8 + 1 + 0 = 9
        a = 4'b1000; b = 4'b0001; carryIn = 1'b0;
        #10;
        if (sum !== 4'b1001 || carryOut !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 15 + 1 + 0 = 0 with carry out
        a = 4'b1111; b = 4'b0001; carryIn = 1'b0;
        #10;
        if (sum !== 4'b0000 || carryOut !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 5 + 5 + 1 = 11
        a = 4'b0101; b = 4'b0101; carryIn = 1'b1;
        #10;
        if (sum !== 4'b1011 || carryOut !== 1'b0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 7 + 7 + 1 = 15
        a = 4'b0111; b = 4'b0111; carryIn = 1'b1;
        #10;
        if (sum !== 4'b1111 || carryOut !== 1'b0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: 8 + 8 + 1 = 17 with carry out
        a = 4'b1000; b = 4'b1000; carryIn = 1'b1;
        #10;
        if (sum !== 4'b0001 || carryOut !== 1'b1) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule