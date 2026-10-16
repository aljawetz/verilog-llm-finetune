`timescale 1ns/1ps

module tb_adder_tree_8;
    reg [8:0] a_in;
    reg [8:0] b_in;
    reg n119_tree_29;
    wire sum;

    // Instantiate the module under test (uut)
    adder_tree_8 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n119_tree_29(n119_tree_29),
        .sum(sum)
    );

    initial begin
        // Test case 1: a_in = 9'b000000000, b_in = 9'b000000000, n119_tree_29 = 0
        a_in = 9'b000000000;
        b_in = 9'b000000000;
        n119_tree_29 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2: a_in = 9'b000000001, b_in = 9'b000000001, n119_tree_29 = 0
        a_in = 9'b000000001;
        b_in = 9'b000000001;
        n119_tree_29 = 0;
        #10;
        if (sum !== 0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3: a_in = 9'b000000001, b_in = 9'b000000001, n119_tree_29 = 1
        a_in = 9'b000000001;
        b_in = 9'b000000001;
        n119_tree_29 = 1;
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4: a_in = 9'b111111111, b_in = 9'b000000000, n119_tree_29 = 0
        a_in = 9'b111111111;
        b_in = 9'b000000000;
        n119_tree_29 = 0;
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test case 5: a_in = 9'b111111111, b_in = 9'b111111111, n119_tree_29 = 1
        a_in = 9'b111111111;
        b_in = 9'b111111111;
        n119_tree_29 = 1;
        #10;
        if (sum !== 0) $display("FAIL: Test case 5 failed, expected sum = 0, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule