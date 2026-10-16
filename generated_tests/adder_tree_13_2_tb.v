`timescale 1ns/1ps

module tb_adder_tree_13;

    // Inputs
    reg [13:0] a_in;
    reg [13:0] b_in;
    reg n81_tree_32;
    reg n80_tree_32;
    reg n82_tree_31;
    reg n83_tree_31;
    reg n119_tree_29;

    // Output
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    adder_tree_13 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n81_tree_32(n81_tree_32),
        .n80_tree_32(n80_tree_32),
        .n82_tree_31(n82_tree_31),
        .n83_tree_31(n83_tree_31),
        .n119_tree_29(n119_tree_29),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 14'b00000000000000; 
        b_in = 14'b00000000000000; 
        n81_tree_32 = 0; 
        n80_tree_32 = 0; 
        n82_tree_31 = 0; 
        n83_tree_31 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2
        a_in = 14'b11111111111111; 
        b_in = 14'b11111111111111; 
        n81_tree_32 = 1; 
        n80_tree_32 = 1; 
        n82_tree_31 = 1; 
        n83_tree_31 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3
        a_in = 14'b10101010101010; 
        b_in = 14'b01010101010101; 
        n81_tree_32 = 1; 
        n80_tree_32 = 0; 
        n82_tree_31 = 0; 
        n83_tree_31 = 1; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4
        a_in = 14'b11001100110011; 
        b_in = 14'b00110011001100; 
        n81_tree_32 = 0; 
        n80_tree_32 = 1; 
        n82_tree_31 = 1; 
        n83_tree_31 = 0; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule