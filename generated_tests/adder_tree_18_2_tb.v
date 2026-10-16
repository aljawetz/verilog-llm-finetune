`timescale 1ns/1ps

module tb_adder_tree_18;

    reg [18:0] a_in;
    reg [18:0] b_in;
    reg n58_tree_32;
    reg n59_tree_32;
    reg n114_tree_28;
    wire sum;

    // Instantiate the module under test (uut)
    adder_tree_18 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n58_tree_32(n58_tree_32),
        .n59_tree_32(n59_tree_32),
        .n114_tree_28(n114_tree_28),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 19'b0000000000000000000; 
        b_in = 19'b0000000000000000000; 
        n58_tree_32 = 0; 
        n59_tree_32 = 0; 
        n114_tree_28 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 19'b1111111111111111111; 
        b_in = 19'b0000000000000000000; 
        n58_tree_32 = 0; 
        n59_tree_32 = 0; 
        n114_tree_28 = 0; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 2 failed, expected sum = 1, got sum = %b", sum);

        // Test case 3
        a_in = 19'b0000000000000000000; 
        b_in = 19'b1111111111111111111; 
        n58_tree_32 = 0; 
        n59_tree_32 = 0; 
        n114_tree_28 = 0; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 19'b1010101010101010101; 
        b_in = 19'b0101010101010101010; 
        n58_tree_32 = 1; 
        n59_tree_32 = 1; 
        n114_tree_28 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test case 5
        a_in = 19'b1111111111111111111; 
        b_in = 19'b1111111111111111111; 
        n58_tree_32 = 1; 
        n59_tree_32 = 1; 
        n114_tree_28 = 1; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 5 failed, expected sum = 0, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule