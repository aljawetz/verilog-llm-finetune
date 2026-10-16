`timescale 1ns/1ps

module tb_comparator_4bit;

    reg [3:0] A;
    reg [3:0] B;
    wire A_greater;
    wire A_equal;
    wire A_less;

    // Instantiate the module under test (uut)
    comparator_4bit uut (
        .A(A),
        .B(B),
        .A_greater(A_greater),
        .A_equal(A_equal),
        .A_less(A_less)
    );

    initial begin
        // Test case 1: A = 4, B = 2 (A > B)
        A = 4'b0100; B = 4'b0010; #10;
        if (A_greater !== 1 || A_equal !== 0 || A_less !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A = 2, B = 4 (A < B)
        A = 4'b0010; B = 4'b0100; #10;
        if (A_greater !== 0 || A_equal !== 0 || A_less !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A = 3, B = 3 (A == B)
        A = 4'b0011; B = 4'b0011; #10;
        if (A_greater !== 0 || A_equal !== 1 || A_less !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A = 0, B = 1 (A < B)
        A = 4'b0000; B = 4'b0001; #10;
        if (A_greater !== 0 || A_equal !== 0 || A_less !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A = 15, B = 0 (A > B)
        A = 4'b1111; B = 4'b0000; #10;
        if (A_greater !== 1 || A_equal !== 0 || A_less !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A = 8, B = 8 (A == B)
        A = 4'b1000; B = 4'b1000; #10;
        if (A_greater !== 0 || A_equal !== 1 || A_less !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule