`timescale 1ns/1ps

module tb_adder_tree_11;

    reg [11:0] a_in;
    reg [11:0] b_in;
    reg n89_tree_32;
    reg n88_tree_32;
    reg n90_tree_32;
    reg n91_tree_32;
    reg n119_tree_29;
    wire sum;

    // Instantiate the module under test (uut)
    adder_tree_11 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n89_tree_32(n89_tree_32),
        .n88_tree_32(n88_tree_32),
        .n90_tree_32(n90_tree_32),
        .n91_tree_32(n91_tree_32),
        .n119_tree_29(n119_tree_29),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 12'b000000000000; 
        b_in = 12'b000000000000; 
        n89_tree_32 = 1; 
        n88_tree_32 = 0; 
        n90_tree_32 = 0; 
        n91_tree_32 = 1; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 12'b111111111111; 
        b_in = 12'b111111111111; 
        n89_tree_32 = 1; 
        n88_tree_32 = 0; 
        n90_tree_32 = 1; 
        n91_tree_32 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3
        a_in = 12'b101010101010; 
        b_in = 12'b010101010101; 
        n89_tree_32 = 1; 
        n88_tree_32 = 0; 
        n90_tree_32 = 1; 
        n91_tree_32 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 12'b000000000001; 
        b_in = 12'b000000000010; 
        n89_tree_32 = 1; 
        n88_tree_32 = 0; 
        n90_tree_32 = 0; 
        n91_tree_32 = 0; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test case 5
        a_in = 12'b111111111111; 
        b_in = 12'b000000000000; 
        n89_tree_32 = 0; 
        n88_tree_32 = 1; 
        n90_tree_32 = 1; 
        n91_tree_32 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 5 failed, expected sum = 1, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule