`timescale 1ns/1ps

module tb_adder_tree_21;

    reg [21:0] a_in;
    reg [21:0] b_in;
    reg n49_tree_32;
    reg n48_tree_32;
    reg n50_tree_31;
    reg n51_tree_31;
    reg n114_tree_28;
    wire sum;

    // Instantiate the module under test (uut)
    adder_tree_21 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n49_tree_32(n49_tree_32),
        .n48_tree_32(n48_tree_32),
        .n50_tree_31(n50_tree_31),
        .n51_tree_31(n51_tree_31),
        .n114_tree_28(n114_tree_28),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 22'b000000000000000000000000; // a_in = 0
        b_in = 22'b000000000000000000000000; // b_in = 0
        n49_tree_32 = 0;
        n48_tree_32 = 0;
        n50_tree_31 = 0;
        n51_tree_31 = 0;
        n114_tree_28 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 22'b000000000000000000000001; // a_in = 1
        b_in = 22'b000000000000000000000001; // b_in = 1
        n49_tree_32 = 1;
        n48_tree_32 = 0;
        n50_tree_31 = 1;
        n51_tree_31 = 1;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 2 failed, expected sum = 1, got sum = %b", sum);

        // Test case 3
        a_in = 22'b000000000000000000000010; // a_in = 2
        b_in = 22'b000000000000000000000011; // b_in = 3
        n49_tree_32 = 1;
        n48_tree_32 = 1;
        n50_tree_31 = 0;
        n51_tree_31 = 1;
        n114_tree_28 = 0;
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 22'b000000000000000000000111; // a_in = 7
        b_in = 22'b000000000000000000000100; // b_in = 4
        n49_tree_32 = 1;
        n48_tree_32 = 0;
        n50_tree_31 = 1;
        n51_tree_31 = 0;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test case 5
        a_in = 22'b000000000000000000001111; // a_in = 15
        b_in = 22'b000000000000000000000000; // b_in = 0
        n49_tree_32 = 1;
        n48_tree_32 = 0;
        n50_tree_31 = 0;
        n51_tree_31 = 0;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 5 failed, expected sum = 1, got sum = %b", sum);

        $display("PASS");
        $finish;
    end

endmodule