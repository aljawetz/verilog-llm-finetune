`timescale 1ns/1ps

module tb_signed_comparator;

    reg signed [3:0] A;
    reg signed [3:0] B;
    wire A_greater_B;
    wire A_equal_B;
    wire A_less_B;

    // Instantiate the module under test (uut)
    signed_comparator uut (
        .A(A),
        .B(B),
        .A_greater_B(A_greater_B),
        .A_equal_B(A_equal_B),
        .A_less_B(A_less_B)
    );

    initial begin
        // Test case 1: A > B
        A = 4'b0110; // 6
        B = 4'b0011; // 3
        #10;
        if (A_greater_B !== 1 || A_equal_B !== 0 || A_less_B !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A < B
        A = 4'b0010; // 2
        B = 4'b0100; // 4
        #10;
        if (A_greater_B !== 0 || A_equal_B !== 0 || A_less_B !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A == B
        A = 4'b0111; // 7
        B = 4'b0111; // 7
        #10;
        if (A_greater_B !== 0 || A_equal_B !== 1 || A_less_B !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A negative < B positive
        A = 4'b1001; // -7
        B = 4'b0001; // 1
        #10;
        if (A_greater_B !== 0 || A_equal_B !== 0 || A_less_B !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A positive > B negative
        A = 4'b0010; // 2
        B = 4'b1000; // -8
        #10;
        if (A_greater_B !== 1 || A_equal_B !== 0 || A_less_B !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A negative == B negative
        A = 4'b1000; // -8
        B = 4'b1000; // -8
        #10;
        if (A_greater_B !== 0 || A_equal_B !== 1 || A_less_B !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule