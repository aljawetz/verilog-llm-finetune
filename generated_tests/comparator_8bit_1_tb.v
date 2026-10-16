`timescale 1ns/1ps

module tb_comparator_8bit;

    reg [7:0] A;
    reg [7:0] B;
    wire A_gt_B;
    wire A_lt_B;
    wire A_eq_B;

    // Instantiate the module under test (uut)
    comparator_8bit uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B),
        .A_eq_B(A_eq_B)
    );

    initial begin
        // Test case 1: A = 8'hFF, B = 8'h00 (A > B)
        A = 8'hFF; B = 8'h00;
        #10;
        if (A_gt_B !== 1'b1 || A_lt_B !== 1'b0 || A_eq_B !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A = 8'h00, B = 8'hFF (A < B)
        A = 8'h00; B = 8'hFF;
        #10;
        if (A_gt_B !== 1'b0 || A_lt_B !== 1'b1 || A_eq_B !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A = 8'hAA, B = 8'hAA (A == B)
        A = 8'hAA; B = 8'hAA;
        #10;
        if (A_gt_B !== 1'b0 || A_lt_B !== 1'b0 || A_eq_B !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A = 8'h01, B = 8'h02 (A < B)
        A = 8'h01; B = 8'h02;
        #10;
        if (A_gt_B !== 1'b0 || A_lt_B !== 1'b1 || A_eq_B !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A = 8'h03, B = 8'h02 (A > B)
        A = 8'h03; B = 8'h02;
        #10;
        if (A_gt_B !== 1'b1 || A_lt_B !== 1'b0 || A_eq_B !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A = 8'h00, B = 8'h00 (A == B)
        A = 8'h00; B = 8'h00;
        #10;
        if (A_gt_B !== 1'b0 || A_lt_B !== 1'b0 || A_eq_B !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule