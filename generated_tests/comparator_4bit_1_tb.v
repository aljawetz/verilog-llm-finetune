`timescale 1ns/1ps

module tb_comparator_4bit;

    reg [3:0] a;
    reg [3:0] b;
    wire a_greater;
    wire a_equal;
    wire a_less;

    // Instantiate the module under test (uut)
    comparator_4bit uut (
        .a(a),
        .b(b),
        .a_greater(a_greater),
        .a_equal(a_equal),
        .a_less(a_less)
    );

    initial begin
        // Test case 1: a = 4, b = 2 (a > b)
        a = 4'b0100; b = 4'b0010;
        #10;
        if (a_greater !== 1'b1 || a_equal !== 1'b0 || a_less !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 2, b = 4 (a < b)
        a = 4'b0010; b = 4'b0100;
        #10;
        if (a_greater !== 1'b0 || a_equal !== 1'b0 || a_less !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 3, b = 3 (a == b)
        a = 4'b0011; b = 4'b0011;
        #10;
        if (a_greater !== 1'b0 || a_equal !== 1'b1 || a_less !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 0, b = 0 (a == b)
        a = 4'b0000; b = 4'b0000;
        #10;
        if (a_greater !== 1'b0 || a_equal !== 1'b1 || a_less !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a = 15, b = 0 (a > b)
        a = 4'b1111; b = 4'b0000;
        #10;
        if (a_greater !== 1'b1 || a_equal !== 1'b0 || a_less !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: a = 0, b = 15 (a < b)
        a = 4'b0000; b = 4'b1111;
        #10;
        if (a_greater !== 1'b0 || a_equal !== 1'b0 || a_less !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule