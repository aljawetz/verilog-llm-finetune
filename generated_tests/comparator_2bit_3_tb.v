`timescale 1ns/1ps

module tb_comparator_2bit;

    reg [1:0] A;
    reg [1:0] B;
    wire A_eq_B;
    wire A_lt_B;
    wire A_gt_B;

    // Instantiate the module under test
    comparator_2bit uut (
        .A(A),
        .B(B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B),
        .A_gt_B(A_gt_B)
    );

    initial begin
        // Test case 1: A = 00, B = 00
        A = 2'b00; B = 2'b00;
        #10;
        if (!(A_eq_B && !A_lt_B && !A_gt_B)) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A = 01, B = 00
        A = 2'b01; B = 2'b00;
        #10;
        if (!(A_eq_B == 0 && A_lt_B == 0 && A_gt_B)) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A = 00, B = 01
        A = 2'b00; B = 2'b01;
        #10;
        if (!(A_eq_B == 0 && A_lt_B && A_gt_B == 0)) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A = 10, B = 01
        A = 2'b10; B = 2'b01;
        #10;
        if (!(A_eq_B == 0 && A_lt_B == 0 && A_gt_B)) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A = 01, B = 10
        A = 2'b01; B = 2'b10;
        #10;
        if (!(A_eq_B == 0 && A_lt_B && A_gt_B == 0)) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A = 11, B = 11
        A = 2'b11; B = 2'b11;
        #10;
        if (!(A_eq_B && !A_lt_B && !A_gt_B)) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: A = 10, B = 10
        A = 2'b10; B = 2'b10;
        #10;
        if (!(A_eq_B && !A_lt_B && !A_gt_B)) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule