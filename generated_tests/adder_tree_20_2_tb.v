`timescale 1ns/1ps

module tb_adder_tree_20;

    reg [20:0] a_in;
    reg [20:0] b_in;
    reg n50_tree_31;
    reg n51_tree_31;
    reg n114_tree_28;
    wire sum;

    // Instantiate the module under test
    adder_tree_20 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n50_tree_31(n50_tree_31),
        .n51_tree_31(n51_tree_31),
        .n114_tree_28(n114_tree_28),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 21'b000000000000000000000; 
        b_in = 21'b000000000000000000000; 
        n50_tree_31 = 0; 
        n51_tree_31 = 0; 
        n114_tree_28 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 21'b000000000000000000001; 
        b_in = 21'b000000000000000000001; 
        n50_tree_31 = 0; 
        n51_tree_31 = 0; 
        n114_tree_28 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3
        a_in = 21'b000000000000000000000; 
        b_in = 21'b000000000000000000001; 
        n50_tree_31 = 0; 
        n51_tree_31 = 1; 
        n114_tree_28 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 21'b000000000000000000001; 
        b_in = 21'b000000000000000000000; 
        n50_tree_31 = 1; 
        n51_tree_31 = 1; 
        n114_tree_28 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test case 5
        a_in = 21'b000000000000000000010; 
        b_in = 21'b000000000000000000011; 
        n50_tree_31 = 1; 
        n51_tree_31 = 0; 
        n114_tree_28 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 5 failed, expected sum = 1, got sum = %b", sum);

        // Test case 6
        a_in = 21'b111111111111111111111; 
        b_in = 21'b000000000000000000000; 
        n50_tree_31 = 0; 
        n51_tree_31 = 1; 
        n114_tree_28 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 6 failed, expected sum = 1, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule