`timescale 1ns/1ps

module tb_adder_tree_16;

    // Inputs
    reg [16:0] a_in;
    reg [16:0] b_in;
    reg n114_tree_28;

    // Output
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    adder_tree_16 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n114_tree_28(n114_tree_28),
        .sum(sum)
    );

    initial begin
        // Test Case 1: Both MSBs are 0, n114_tree_28 is 0
        a_in = 17'b00000000000000000;
        b_in = 17'b00000000000000000;
        n114_tree_28 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test Case 1 Failed"); 

        // Test Case 2: Both MSBs are 1, n114_tree_28 is 0
        a_in = 17'b11111111111111111;
        b_in = 17'b11111111111111111;
        n114_tree_28 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test Case 2 Failed"); 

        // Test Case 3: MSB of a_in is 1, b_in is 0, n114_tree_28 is 1
        a_in = 17'b10000000000000000;
        b_in = 17'b00000000000000000;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test Case 3 Failed"); 

        // Test Case 4: MSB of a_in is 0, b_in is 1, n114_tree_28 is 1
        a_in = 17'b00000000000000000;
        b_in = 17'b10000000000000000;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test Case 4 Failed"); 

        // Test Case 5: MSBs are different, n114_tree_28 is 0
        a_in = 17'b10000000000000000;
        b_in = 17'b00000000000000001;
        n114_tree_28 = 0;
        #10;
        if (sum !== 1) $display("FAIL: Test Case 5 Failed"); 

        // Test Case 6: MSBs are different, n114_tree_28 is 1
        a_in = 17'b00000000000000001;
        b_in = 17'b10000000000000000;
        n114_tree_28 = 1;
        #10;
        if (sum !== 0) $display("FAIL: Test Case 6 Failed"); 

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule