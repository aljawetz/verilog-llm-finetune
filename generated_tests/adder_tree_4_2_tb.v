`timescale 1ns/1ps

module tb_adder_tree_4;

    // Inputs
    reg [4:0] a_in;
    reg [4:0] b_in;
    reg n124_tree_30;

    // Output
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    adder_tree_4 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n124_tree_30(n124_tree_30),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 5'b00000; 
        b_in = 5'b00000; 
        n124_tree_30 = 1'b0; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);

        // Test case 2
        a_in = 5'b11111; 
        b_in = 5'b11111; 
        n124_tree_30 = 1'b0; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %b", sum);

        // Test case 3
        a_in = 5'b00000; 
        b_in = 5'b00000; 
        n124_tree_30 = 1'b1; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);

        // Test case 4
        a_in = 5'b10101; 
        b_in = 5'b01010; 
        n124_tree_30 = 1'b0; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 4 failed, expected sum = 0, got sum = %b", sum);

        // Test case 5
        a_in = 5'b10101; 
        b_in = 5'b01010; 
        n124_tree_30 = 1'b1; 
        #10;
        if (sum !== 1'b1) $display("FAIL: Test case 5 failed, expected sum = 1, got sum = %b", sum);

        // Test case 6
        a_in = 5'b11101; 
        b_in = 5'b00010; 
        n124_tree_30 = 1'b1; 
        #10;
        if (sum !== 1'b0) $display("FAIL: Test case 6 failed, expected sum = 0, got sum = %b", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule