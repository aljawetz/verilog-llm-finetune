`timescale 1ns/1ps

module tb_adder_tree_1;

    // Inputs
    reg [1:0] a_in;
    reg [1:0] b_in;
    reg n134_tree_32;

    // Output
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    adder_tree_1 uut (
        .a_in(a_in),
        .b_in(b_in),
        .n134_tree_32(n134_tree_32),
        .sum(sum)
    );

    initial begin
        // Test case 1
        a_in = 2'b00; b_in = 2'b00; n134_tree_32 = 1'b0;
        #10;
        if (sum !== (n134_tree_32 ^ (a_in[1] ^ b_in[1]))) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2
        a_in = 2'b01; b_in = 2'b01; n134_tree_32 = 1'b0;
        #10;
        if (sum !== (n134_tree_32 ^ (a_in[1] ^ b_in[1]))) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3
        a_in = 2'b10; b_in = 2'b10; n134_tree_32 = 1'b1;
        #10;
        if (sum !== (n134_tree_32 ^ (a_in[1] ^ b_in[1]))) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4
        a_in = 2'b11; b_in = 2'b00; n134_tree_32 = 1'b1;
        #10;
        if (sum !== (n134_tree_32 ^ (a_in[1] ^ b_in[1]))) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5
        a_in = 2'b01; b_in = 2'b10; n134_tree_32 = 1'b1;
        #10;
        if (sum !== (n134_tree_32 ^ (a_in[1] ^ b_in[1]))) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule