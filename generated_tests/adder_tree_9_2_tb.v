`timescale 1ns/1ps

module tb_adder_tree_9;

    // Inputs
    reg [9:0] a_in;
    reg [9:0] b_in;
    reg n97_tree_32;
    reg n96_tree_32;
    reg n119_tree_29;

    // Output
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    adder_tree_9 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n97_tree_32(n97_tree_32),
        .n96_tree_32(n96_tree_32),
        .n119_tree_29(n119_tree_29),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 10'b0000000000; 
        b_in = 10'b0000000000; 
        n97_tree_32 = 0; 
        n96_tree_32 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed, expected sum=0, got sum=%b", sum);

        // Test case 2
        a_in = 10'b1111111111; 
        b_in = 10'b1111111111; 
        n97_tree_32 = 1; 
        n96_tree_32 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 2 failed, expected sum=1, got sum=%b", sum);

        // Test case 3
        a_in = 10'b1010101010; 
        b_in = 10'b0101010101; 
        n97_tree_32 = 0; 
        n96_tree_32 = 1; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 3 failed, expected sum=1, got sum=%b", sum);

        // Test case 4
        a_in = 10'b0000000001; 
        b_in = 10'b0000000001; 
        n97_tree_32 = 1; 
        n96_tree_32 = 0; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 4 failed, expected sum=0, got sum=%b", sum);

        // Test case 5
        a_in = 10'b1111111110; 
        b_in = 10'b0000000001; 
        n97_tree_32 = 1; 
        n96_tree_32 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 5 failed, expected sum=1, got sum=%b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule