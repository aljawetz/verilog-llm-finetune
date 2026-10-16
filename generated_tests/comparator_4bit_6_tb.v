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
        // Test case 1: a = 4'b0000, b = 4'b0000 (Equal)
        a = 4'b0000; b = 4'b0000;
        #10;
        if (a_greater !== 1'b0 || a_equal !== 1'b1 || a_less !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 4'b0001, b = 4'b0000 (Greater)
        a = 4'b0001; b = 4'b0000;
        #10;
        if (a_greater !== 1'b1 || a_equal !== 1'b0 || a_less !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 4'b0000, b = 4'b0001 (Less)
        a = 4'b0000; b = 4'b0001;
        #10;
        if (a_greater !== 1'b0 || a_equal !== 1'b0 || a_less !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 4'b1111, b = 4'b1110 (Greater)
        a = 4'b1111; b = 4'b1110;
        #10;
        if (a_greater !== 1'b1 || a_equal !== 1'b0 || a_less !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a = 4'b1110, b = 4'b1111 (Less)
        a = 4'b1110; b = 4'b1111;
        #10;
        if (a_greater !== 1'b0 || a_equal !== 1'b0 || a_less !== 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: a = 4'b1010, b = 4'b1010 (Equal)
        a = 4'b1010; b = 4'b1010;
        #10;
        if (a_greater !== 1'b0 || a_equal !== 1'b1 || a_less !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule