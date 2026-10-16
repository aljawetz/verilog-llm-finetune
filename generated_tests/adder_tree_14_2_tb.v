`timescale 1ns/1ps

module tb_adder_tree_14;
    reg [14:0] a_in;
    reg [14:0] b_in;
    reg n74_tree_32;
    reg n75_tree_32;
    reg n82_tree_31;
    reg n83_tree_31;
    reg n119_tree_29;
    wire sum;

    // Instantiate the module under test (uut)
    adder_tree_14 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n74_tree_32(n74_tree_32),
        .n75_tree_32(n75_tree_32),
        .n82_tree_31(n82_tree_31),
        .n83_tree_31(n83_tree_31),
        .n119_tree_29(n119_tree_29),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 15'b000000000000000; 
        b_in = 15'b000000000000000; 
        n74_tree_32 = 0; 
        n75_tree_32 = 0; 
        n82_tree_31 = 0; 
        n83_tree_31 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 15'b000000000000001; 
        b_in = 15'b000000000000001; 
        n74_tree_32 = 0; 
        n75_tree_32 = 0; 
        n82_tree_31 = 0; 
        n83_tree_31 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3
        a_in = 15'b000000000000001; 
        b_in = 15'b000000000000001; 
        n74_tree_32 = 1; 
        n75_tree_32 = 1; 
        n82_tree_31 = 1; 
        n83_tree_31 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 15'b111111111111111; 
        b_in = 15'b000000000000001; 
        n74_tree_32 = 1; 
        n75_tree_32 = 1; 
        n82_tree_31 = 1; 
        n83_tree_31 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test case 5
        a_in = 15'b111111111111111; 
        b_in = 15'b111111111111111; 
        n74_tree_32 = 0; 
        n75_tree_32 = 0; 
        n82_tree_31 = 0; 
        n83_tree_31 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 5 failed, expected sum = 0, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule