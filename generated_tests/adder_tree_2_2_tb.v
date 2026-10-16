`timescale 1ns/1ps

module tb_adder_tree_2;
    reg [2:0] a_in;
    reg [2:0] b_in;
    reg n129_tree_31;
    wire sum;

    // Instantiate the module under test (uut)
    adder_tree_2 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n129_tree_31(n129_tree_31),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 3'b000; 
        b_in = 3'b000; 
        n129_tree_31 = 1'b0; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 3'b001; 
        b_in = 3'b001; 
        n129_tree_31 = 1'b0; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3
        a_in = 3'b001; 
        b_in = 3'b001; 
        n129_tree_31 = 1'b1; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 3'b010; 
        b_in = 3'b011; 
        n129_tree_31 = 1'b0; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 4 failed, expected sum = 1, got sum = %b", sum);

        // Test case 5
        a_in = 3'b111; 
        b_in = 3'b111; 
        n129_tree_31 = 1'b1; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 5 failed, expected sum = 0, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule