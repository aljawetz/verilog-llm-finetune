`timescale 1ns/1ps

module tb_comparator_3bit;

    // Inputs
    reg [2:0] A;
    reg [2:0] B;

    // Outputs
    wire A_eq_B;
    wire A_lt_B;
    wire A_gt_B;

    // Instantiate the Unit Under Test (UUT)
    comparator_3bit uut (
        .A(A),
        .B(B),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B),
        .A_gt_B(A_gt_B)
    );

    initial begin
        // Test case 1: A = 3'b000, B = 3'b000
        A = 3'b000; B = 3'b000;
        #10;
        if (!(A_eq_B && !A_lt_B && !A_gt_B)) $display("FAIL: Test case 1 failed");

        // Test case 2: A = 3'b001, B = 3'b000
        A = 3'b001; B = 3'b000;
        #10;
        if (!(A_gt_B && !A_eq_B && !A_lt_B)) $display("FAIL: Test case 2 failed");

        // Test case 3: A = 3'b000, B = 3'b001
        A = 3'b000; B = 3'b001;
        #10;
        if (!(A_lt_B && !A_eq_B && !A_gt_B)) $display("FAIL: Test case 3 failed");

        // Test case 4: A = 3'b010, B = 3'b010
        A = 3'b010; B = 3'b010;
        #10;
        if (!(A_eq_B && !A_lt_B && !A_gt_B)) $display("FAIL: Test case 4 failed");

        // Test case 5: A = 3'b011, B = 3'b010
        A = 3'b011; B = 3'b010;
        #10;
        if (!(A_gt_B && !A_eq_B && !A_lt_B)) $display("FAIL: Test case 5 failed");

        // Test case 6: A = 3'b010, B = 3'b011
        A = 3'b010; B = 3'b011;
        #10;
        if (!(A_lt_B && !A_eq_B && !A_gt_B)) $display("FAIL: Test case 6 failed");

        // Test case 7: A = 3'b111, B = 3'b111
        A = 3'b111; B = 3'b111;
        #10;
        if (!(A_eq_B && !A_lt_B && !A_gt_B)) $display("FAIL: Test case 7 failed");

        // Test case 8: A = 3'b100, B = 3'b111
        A = 3'b100; B = 3'b111;
        #10;
        if (!(A_lt_B && !A_eq_B && !A_gt_B)) $display("FAIL: Test case 8 failed");

        // Test case 9: A = 3'b111, B = 3'b100
        A = 3'b111; B = 3'b100;
        #10;
        if (!(A_gt_B && !A_eq_B && !A_lt_B)) $display("FAIL: Test case 9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule