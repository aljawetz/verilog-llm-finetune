`timescale 1ns/1ps

module tb_adder_tree_12;

    reg [12:0] a_in;
    reg [12:0] b_in;
    reg n82_tree_31;
    reg n83_tree_31;
    reg n119_tree_29;
    wire sum;

    // Instantiate the module under test
    adder_tree_12 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n82_tree_31(n82_tree_31),
        .n83_tree_31(n83_tree_31),
        .n119_tree_29(n119_tree_29),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 12'b000000000000; 
        b_in = 12'b000000000000; 
        n82_tree_31 = 0; 
        n83_tree_31 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 1 failed"); 

        // Test case 2
        a_in = 12'b111111111111; 
        b_in = 12'b111111111111; 
        n82_tree_31 = 0; 
        n83_tree_31 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 2 failed"); 

        // Test case 3
        a_in = 12'b000000000001; 
        b_in = 12'b000000000001; 
        n82_tree_31 = 0; 
        n83_tree_31 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 0) $display("FAIL: Test case 3 failed"); 

        // Test case 4
        a_in = 12'b000000000001; 
        b_in = 12'b000000000001; 
        n82_tree_31 = 1; 
        n83_tree_31 = 0; 
        n119_tree_29 = 0; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 4 failed"); 

        // Test case 5
        a_in = 12'b000000000000; 
        b_in = 12'b000000000001; 
        n82_tree_31 = 1; 
        n83_tree_31 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 5 failed"); 

        // Test case 6
        a_in = 12'b111111111111; 
        b_in = 12'b000000000000; 
        n82_tree_31 = 1; 
        n83_tree_31 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 6 failed"); 

        // Test case 7
        a_in = 12'b111111111111; 
        b_in = 12'b111111111111; 
        n82_tree_31 = 1; 
        n83_tree_31 = 1; 
        n119_tree_29 = 1; 
        #10;
        if (sum !== 1) $display("FAIL: Test case 7 failed"); 

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule