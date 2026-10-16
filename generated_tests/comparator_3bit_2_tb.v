`timescale 1ns/1ps

module tb_comparator_3bit;

    reg [2:0] A;
    reg [2:0] B;
    wire A_greater;
    wire A_equal;
    wire A_less;

    // Instantiate the module under test (uut)
    comparator_3bit uut (
        .A(A),
        .B(B),
        .A_greater(A_greater),
        .A_equal(A_equal),
        .A_less(A_less)
    );

    initial begin
        // Test case 1: A = 3, B = 2 (A > B)
        A = 3'b011; // 3
        B = 3'b010; // 2
        #10;
        if (A_greater !== 1'b1 || A_equal !== 1'b0 || A_less !== 1'b0) 
            $display("FAIL: Test case 1 failed");

        // Test case 2: A = 2, B = 2 (A == B)
        A = 3'b010; // 2
        B = 3'b010; // 2
        #10;
        if (A_greater !== 1'b0 || A_equal !== 1'b1 || A_less !== 1'b0) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: A = 1, B = 2 (A < B)
        A = 3'b001; // 1
        B = 3'b010; // 2
        #10;
        if (A_greater !== 1'b0 || A_equal !== 1'b0 || A_less !== 1'b1) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: A = 0, B = 0 (A == B)
        A = 3'b000; // 0
        B = 3'b000; // 0
        #10;
        if (A_greater !== 1'b0 || A_equal !== 1'b1 || A_less !== 1'b0) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: A = 5, B = 3 (A > B)
        A = 3'b101; // 5
        B = 3'b011; // 3
        #10;
        if (A_greater !== 1'b1 || A_equal !== 1'b0 || A_less !== 1'b0) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: A = 3, B = 5 (A < B)
        A = 3'b011; // 3
        B = 3'b101; // 5
        #10;
        if (A_greater !== 1'b0 || A_equal !== 1'b0 || A_less !== 1'b1) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule