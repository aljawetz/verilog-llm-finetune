`timescale 1ns/1ps

module tb_adder_tree_3;
    reg [3:0] a_in;
    reg [3:0] b_in;
    reg n121_tree_32;
    reg n120_tree_32;
    reg n129_tree_31;
    wire sum;

    // Instantiate the module under test
    adder_tree_3 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n121_tree_32(n121_tree_32),
        .n120_tree_32(n120_tree_32),
        .n129_tree_31(n129_tree_31),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 4'b0000; b_in = 4'b0000; n121_tree_32 = 0; n120_tree_32 = 0; n129_tree_31 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 4'b1111; b_in = 4'b1111; n121_tree_32 = 1; n120_tree_32 = 1; n129_tree_31 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 2 failed, expected sum = 1, got sum = %b", sum);

        // Test case 3
        a_in = 4'b1010; b_in = 4'b0101; n121_tree_32 = 0; n120_tree_32 = 1; n129_tree_31 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 4'b1100; b_in = 4'b0011; n121_tree_32 = 1; n120_tree_32 = 0; n129_tree_31 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 4 failed, expected sum = 0, got sum = %b", sum);

        // Test case 5
        a_in = 4'b1110; b_in = 4'b0001; n121_tree_32 = 1; n120_tree_32 = 0; n129_tree_31 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 5 failed, expected sum = 1, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule