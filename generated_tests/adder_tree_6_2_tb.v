`timescale 1ns/1ps

module tb_adder_tree_6;

    // Inputs
    reg [6:0] a_in;
    reg [6:0] b_in;
    reg n106_tree_32;
    reg n107_tree_32;
    reg n124_tree_30;

    // Output
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    adder_tree_6 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n106_tree_32(n106_tree_32),
        .n107_tree_32(n107_tree_32),
        .n124_tree_30(n124_tree_30),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 7'b0000000; 
        b_in = 7'b0000000; 
        n106_tree_32 = 0; 
        n107_tree_32 = 0; 
        n124_tree_30 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 7'b1111111; 
        b_in = 7'b1111111; 
        n106_tree_32 = 0; 
        n107_tree_32 = 0; 
        n124_tree_30 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3
        a_in = 7'b1010101; 
        b_in = 7'b0101010; 
        n106_tree_32 = 0; 
        n107_tree_32 = 1; 
        n124_tree_30 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 7'b1111110; 
        b_in = 7'b0000001; 
        n106_tree_32 = 1; 
        n107_tree_32 = 1; 
        n124_tree_30 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test case 5
        a_in = 7'b0000001; 
        b_in = 7'b0000001; 
        n106_tree_32 = 1; 
        n107_tree_32 = 0; 
        n124_tree_30 = 1; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 5 failed, expected sum = 0, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule