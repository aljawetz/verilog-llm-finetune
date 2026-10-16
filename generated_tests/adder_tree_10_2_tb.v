`timescale 1ns/1ps

module tb_adder_tree_10;

    // Inputs
    reg [10:0] a_in;
    reg [10:0] b_in;
    reg n90_tree_32;
    reg n91_tree_32;
    reg n119_tree_29;

    // Output
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    adder_tree_10 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n90_tree_32(n90_tree_32),
        .n91_tree_32(n91_tree_32),
        .n119_tree_29(n119_tree_29),
        .sum(sum)
    );

    initial begin
        // Test Case 1
        a_in = 11'b00000000000; 
        b_in = 11'b00000000000; 
        n90_tree_32 = 0; 
        n91_tree_32 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test Case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test Case 2
        a_in = 11'b11111111111; 
        b_in = 11'b11111111111; 
        n90_tree_32 = 0; 
        n91_tree_32 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test Case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test Case 3
        a_in = 11'b00000000000; 
        b_in = 11'b00000000000; 
        n90_tree_32 = 1; 
        n91_tree_32 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 1) $display("FAIL: Test Case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test Case 4
        a_in = 11'b00000000000; 
        b_in = 11'b00000000000; 
        n90_tree_32 = 0; 
        n91_tree_32 = 1; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 1) $display("FAIL: Test Case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test Case 5
        a_in = 11'b00000000000; 
        b_in = 11'b00000000000; 
        n90_tree_32 = 0; 
        n91_tree_32 = 0; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 0) $display("FAIL: Test Case 5 failed, expected sum = 0, got sum = %b", sum);

        // Test Case 6
        a_in = 11'b10101010101; 
        b_in = 11'b01010101010; 
        n90_tree_32 = 1; 
        n91_tree_32 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test Case 6 failed, expected sum = 1, got sum = %b", sum);

        // Test Case 7
        a_in = 11'b10101010101; 
        b_in = 11'b01010101010; 
        n90_tree_32 = 0; 
        n91_tree_32 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test Case 7 failed, expected sum = 1, got sum = %b", sum);

        // Test Case 8
        a_in = 11'b10101010101; 
        b_in = 11'b01010101010; 
        n90_tree_32 = 1; 
        n91_tree_32 = 0; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test Case 8 failed, expected sum = 1, got sum = %b", sum);

        // Test Case 9
        a_in = 11'b10101010101; 
        b_in = 11'b01010101010; 
        n90_tree_32 = 0; 
        n91_tree_32 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test Case 9 failed, expected sum = 0, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule