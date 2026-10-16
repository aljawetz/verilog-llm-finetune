`timescale 1ns/1ps

module tb_adder_tree_22;

    reg [22:0] a_in;
    reg [22:0] b_in;
    reg n42_tree_32;
    reg n43_tree_32;
    reg n50_tree_31;
    reg n51_tree_31;
    reg n114_tree_28;
    wire sum;

    // Instantiate the module under test
    adder_tree_22 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n42_tree_32(n42_tree_32),
        .n43_tree_32(n43_tree_32),
        .n50_tree_31(n50_tree_31),
        .n51_tree_31(n51_tree_31),
        .n114_tree_28(n114_tree_28),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 23'h000000; 
        b_in = 23'h000000; 
        n42_tree_32 = 0; 
        n43_tree_32 = 0; 
        n50_tree_31 = 0; 
        n51_tree_31 = 0; 
        n114_tree_28 = 0; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 23'h000001; 
        b_in = 23'h000001; 
        n42_tree_32 = 0; 
        n43_tree_32 = 0; 
        n50_tree_31 = 0; 
        n51_tree_31 = 0; 
        n114_tree_28 = 0; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3
        a_in = 23'h000001; 
        b_in = 23'h000001; 
        n42_tree_32 = 1; 
        n43_tree_32 = 0; 
        n50_tree_31 = 0; 
        n51_tree_31 = 0; 
        n114_tree_28 = 0; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 23'hFFFFFF; 
        b_in = 23'hFFFFFF; 
        n42_tree_32 = 0; 
        n43_tree_32 = 1; 
        n50_tree_31 = 1; 
        n51_tree_31 = 1; 
        n114_tree_28 = 1; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 4 failed, expected sum = 0, got sum = %b", sum);

        // Test case 5
        a_in = 23'h7FFFFF; 
        b_in = 23'h800000; 
        n42_tree_32 = 1; 
        n43_tree_32 = 1; 
        n50_tree_31 = 1; 
        n51_tree_31 = 1; 
        n114_tree_28 = 1; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 5 failed, expected sum = 1, got sum = %b", sum);

        $display("PASS");
        $finish;
    end

endmodule