`timescale 1ns/1ps

module tb_adder_tree_0;

    // Inputs
    reg a_in;
    reg b_in;

    // Outputs
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    adder_tree_0 uut (
        .a_in(a_in),
        .b_in(b_in),
        .sum(sum)
    );

    initial begin
        // Test case 1: a_in = 0, b_in = 0
        a_in = 0; b_in = 0;
        #10;
        if (sum !== 0) begin
            $display("FAIL: Test case 1 failed (0 XOR 0)");
            $finish;
        end

        // Test case 2: a_in = 0, b_in = 1
        a_in = 0; b_in = 1;
        #10;
        if (sum !== 1) begin
            $display("FAIL: Test case 2 failed (0 XOR 1)");
            $finish;
        end

        // Test case 3: a_in = 1, b_in = 0
        a_in = 1; b_in = 0;
        #10;
        if (sum !== 1) begin
            $display("FAIL: Test case 3 failed (1 XOR 0)");
            $finish;
        end

        // Test case 4: a_in = 1, b_in = 1
        a_in = 1; b_in = 1;
        #10;
        if (sum !== 0) begin
            $display("FAIL: Test case 4 failed (1 XOR 1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule