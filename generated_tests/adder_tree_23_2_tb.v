`timescale 1ns/1ps

module tb_adder_tree_23;
    reg [23:0] a_in;
    reg [23:0] b_in;
    reg n41_tree_32;
    reg n40_tree_32;
    reg n42_tree_32;
    reg n43_tree_32;
    reg n50_tree_31;
    reg n51_tree_31;
    reg n114_tree_28;
    wire sum;

    // Instantiate the module under test (uut)
    adder_tree_23 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n41_tree_32(n41_tree_32),
        .n40_tree_32(n40_tree_32),
        .n42_tree_32(n42_tree_32),
        .n43_tree_32(n43_tree_32),
        .n50_tree_31(n50_tree_31),
        .n51_tree_31(n51_tree_31),
        .n114_tree_28(n114_tree_28),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 24'hFFFFFF; // 24-bit input a
        b_in = 24'h000000; // 24-bit input b
        n41_tree_32 = 1;
        n40_tree_32 = 0;
        n42_tree_32 = 1;
        n43_tree_32 = 1;
        n50_tree_31 = 1;
        n51_tree_31 = 1;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 1 failed, expected sum = 1, got sum = %b", sum);

        // Test case 2
        a_in = 24'h000000; // 24-bit input a
        b_in = 24'hFFFFFF; // 24-bit input b
        n41_tree_32 = 1;
        n40_tree_32 = 0;
        n42_tree_32 = 1;
        n43_tree_32 = 1;
        n50_tree_31 = 1;
        n51_tree_31 = 1;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 2 failed, expected sum = 1, got sum = %b", sum);

        // Test case 3
        a_in = 24'h123456; // 24-bit input a
        b_in = 24'h654321; // 24-bit input b
        n41_tree_32 = 0;
        n40_tree_32 = 1;
        n42_tree_32 = 0;
        n43_tree_32 = 1;
        n50_tree_31 = 0;
        n51_tree_31 = 1;
        n114_tree_28 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 3 failed, expected sum = 0, got sum = %b", sum);

        // Test case 4
        a_in = 24'hAAAAAAAA; // 24-bit input a
        b_in = 24'h555555; // 24-bit input b
        n41_tree_32 = 1;
        n40_tree_32 = 1;
        n42_tree_32 = 1;
        n43_tree_32 = 1;
        n50_tree_31 = 1;
        n51_tree_31 = 1;
        n114_tree_28 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule