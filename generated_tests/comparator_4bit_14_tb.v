`timescale 1ns/1ps

module tb_comparator_4bit;

    reg [3:0] inA;
    reg [3:0] inB;
    wire A_eq_B;
    wire A_lt_B;
    wire A_gt_B;

    // Instantiate the module under test (uut)
    comparator_4bit uut (
        .inA(inA),
        .inB(inB),
        .A_eq_B(A_eq_B),
        .A_lt_B(A_lt_B),
        .A_gt_B(A_gt_B)
    );

    initial begin
        // Test case 1: A = 4, B = 4 (Equal)
        inA = 4'b0100; // 4
        inB = 4'b0100; // 4
        #10;
        if (A_eq_B !== 1'b1 || A_lt_B !== 1'b0 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 5, B = 3 (A > B)
        inA = 4'b0101; // 5
        inB = 4'b0011; // 3
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b0 || A_gt_B !== 1'b1) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: A = 2, B = 3 (A < B)
        inA = 4'b0010; // 2
        inB = 4'b0011; // 3
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b1 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: A = 0, B = 0 (Equal)
        inA = 4'b0000; // 0
        inB = 4'b0000; // 0
        #10;
        if (A_eq_B !== 1'b1 || A_lt_B !== 1'b0 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: A = 15, B = 0 (A > B)
        inA = 4'b1111; // 15
        inB = 4'b0000; // 0
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b0 || A_gt_B !== 1'b1) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: A = 0, B = 15 (A < B)
        inA = 4'b0000; // 0
        inB = 4'b1111; // 15
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b1 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule