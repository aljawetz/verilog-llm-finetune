`timescale 1ns/1ps

module tb_comparator;

    reg [3:0] A;
    reg [3:0] B;
    wire A_greater_than_B;
    wire A_equal_to_B;
    wire A_less_than_B;

    // Instantiate the module under test (uut)
    comparator uut (
        .A(A),
        .B(B),
        .A_greater_than_B(A_greater_than_B),
        .A_equal_to_B(A_equal_to_B),
        .A_less_than_B(A_less_than_B)
    );

    initial begin
        // Test case 1: A = 4, B = 2
        A = 4; B = 2;
        #10;
        if (A_greater_than_B !== 1 || A_equal_to_B !== 0 || A_less_than_B !== 0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 2, B = 4
        A = 2; B = 4;
        #10;
        if (A_greater_than_B !== 0 || A_equal_to_B !== 0 || A_less_than_B !== 1) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: A = 3, B = 3
        A = 3; B = 3;
        #10;
        if (A_greater_than_B !== 0 || A_equal_to_B !== 1 || A_less_than_B !== 0) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (A_greater_than_B !== 0 || A_equal_to_B !== 1 || A_less_than_B !== 0) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: A = 15, B = 1
        A = 15; B = 1;
        #10;
        if (A_greater_than_B !== 1 || A_equal_to_B !== 0 || A_less_than_B !== 0) 
            $display("FAIL: Test case 5 failed");
        
        // Test case 6: A = 1, B = 15
        A = 1; B = 15;
        #10;
        if (A_greater_than_B !== 0 || A_equal_to_B !== 0 || A_less_than_B !== 1) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule