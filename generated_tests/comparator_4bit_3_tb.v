`timescale 1ns/1ps

module tb_comparator_4bit;

    reg [3:0] A;
    reg [3:0] B;
    wire A_gt_B;
    wire A_lt_B;
    wire A_eq_B;

    // Instantiate the module under test (uut)
    comparator_4bit uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B),
        .A_eq_B(A_eq_B)
    );

    initial begin
        // Test case 1: A = 4'b0000, B = 4'b0000 (Equal)
        A = 4'b0000; B = 4'b0000;
        #10;
        if (A_gt_B !== 0 || A_lt_B !== 0 || A_eq_B !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A = 4'b0001, B = 4'b0000 (A > B)
        A = 4'b0001; B = 4'b0000;
        #10;
        if (A_gt_B !== 1 || A_lt_B !== 0 || A_eq_B !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A = 4'b0000, B = 4'b0001 (A < B)
        A = 4'b0000; B = 4'b0001;
        #10;
        if (A_gt_B !== 0 || A_lt_B !== 1 || A_eq_B !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A = 4'b0010, B = 4'b0010 (Equal)
        A = 4'b0010; B = 4'b0010;
        #10;
        if (A_gt_B !== 0 || A_lt_B !== 0 || A_eq_B !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A = 4'b0011, B = 4'b0010 (A > B)
        A = 4'b0011; B = 4'b0010;
        #10;
        if (A_gt_B !== 1 || A_lt_B !== 0 || A_eq_B !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A = 4'b0010, B = 4'b0011 (A < B)
        A = 4'b0010; B = 4'b0011;
        #10;
        if (A_gt_B !== 0 || A_lt_B !== 1 || A_eq_B !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: A = 4'b1111, B = 4'b0000 (A > B)
        A = 4'b1111; B = 4'b0000;
        #10;
        if (A_gt_B !== 1 || A_lt_B !== 0 || A_eq_B !== 0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: A = 4'b0000, B = 4'b1111 (A < B)
        A = 4'b0000; B = 4'b1111;
        #10;
        if (A_gt_B !== 0 || A_lt_B !== 1 || A_eq_B !== 0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: A = 4'b1010, B = 4'b0101 (A > B)
        A = 4'b1010; B = 4'b0101;
        #10;
        if (A_gt_B !== 1 || A_lt_B !== 0 || A_eq_B !== 0) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: A = 4'b0101, B = 4'b1010 (A < B)
        A = 4'b0101; B = 4'b1010;
        #10;
        if (A_gt_B !== 0 || A_lt_B !== 1 || A_eq_B !== 0) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule