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
        // Test case 1: A = 4'b0000, B = 4'b0000 (Equal)
        inA = 4'b0000; inB = 4'b0000;
        #10;
        if (A_eq_B !== 1'b1 || A_lt_B !== 1'b0 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 4'b0001, B = 4'b0000 (A > B)
        inA = 4'b0001; inB = 4'b0000;
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b0 || A_gt_B !== 1'b1) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: A = 4'b0000, B = 4'b0001 (A < B)
        inA = 4'b0000; inB = 4'b0001;
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b1 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: A = 4'b0010, B = 4'b0010 (Equal)
        inA = 4'b0010; inB = 4'b0010;
        #10;
        if (A_eq_B !== 1'b1 || A_lt_B !== 1'b0 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: A = 4'b1111, B = 4'b0000 (A > B)
        inA = 4'b1111; inB = 4'b0000;
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b0 || A_gt_B !== 1'b1) 
            $display("FAIL: Test case 5 failed");
        
        // Test case 6: A = 4'b0000, B = 4'b1111 (A < B)
        inA = 4'b0000; inB = 4'b1111;
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b1 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 6 failed");
        
        // Test case 7: A = 4'b1010, B = 4'b0101 (A > B)
        inA = 4'b1010; inB = 4'b0101;
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b0 || A_gt_B !== 1'b1) 
            $display("FAIL: Test case 7 failed");
        
        // Test case 8: A = 4'b0101, B = 4'b1010 (A < B)
        inA = 4'b0101; inB = 4'b1010;
        #10;
        if (A_eq_B !== 1'b0 || A_lt_B !== 1'b1 || A_gt_B !== 1'b0) 
            $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule