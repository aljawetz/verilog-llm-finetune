`timescale 1ns/1ps

module tb_adder_tree_19;

    reg [19:0] a_in;
    reg [19:0] b_in;
    reg n57_tree_32;
    reg n56_tree_32;
    reg n58_tree_32;
    reg n59_tree_32;
    reg n114_tree_28;
    wire sum;

    // Instantiate the module under test
    adder_tree_19 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n57_tree_32(n57_tree_32),
        .n56_tree_32(n56_tree_32),
        .n58_tree_32(n58_tree_32),
        .n59_tree_32(n59_tree_32),
        .n114_tree_28(n114_tree_28),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 20'b00000000000000000001; // a_in[19] = 0
        b_in = 20'b00000000000000000001; // b_in[19] = 0
        n57_tree_32 = 1;
        n56_tree_32 = 0;
        n58_tree_32 = 0;
        n59_tree_32 = 1;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 1 failed, expected sum = 1, got sum = %b", sum);

        // Test case 2
        a_in = 20'b00000000000000000000; // a_in[19] = 0
        b_in = 20'b00000000000000000000; // b_in[19] = 0
        n57_tree_32 = 0;
        n56_tree_32 = 0;
        n58_tree_32 = 0;
        n59_tree_32 = 0;
        n114_tree_28 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3
        a_in = 20'b00000000000000000001; // a_in[19] = 0
        b_in = 20'b00000000000000000010; // b_in[19] = 0
        n57_tree_32 = 1;
        n56_tree_32 = 1;
        n58_tree_32 = 1;
        n59_tree_32 = 1;
        n114_tree_28 = 1;
        #10;
        if (sum !== 0) $display("FAIL: Test case 3 failed, expected sum = 0, got sum = %b", sum);

        // Test case 4
        a_in = 20'b00000000000000000011; // a_in[19] = 0
        b_in = 20'b00000000000000000001; // b_in[19] = 0
        n57_tree_32 = 1;
        n56_tree_32 = 0;
        n58_tree_32 = 0;
        n59_tree_32 = 1;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule