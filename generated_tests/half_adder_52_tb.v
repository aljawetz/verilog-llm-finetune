`timescale 1ns/1ps

module tb_half_adder;

    // Inputs
    reg a_in;
    reg b_in;

    // Outputs
    wire sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    half_adder uut (
        .a_in(a_in),
        .b_in(b_in),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test case 1: a_in = 0, b_in = 0
        a_in = 0; b_in = 0;
        #10;
        if (sum !== 0 || carry !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a_in = 0, b_in = 1
        a_in = 0; b_in = 1;
        #10;
        if (sum !== 1 || carry !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a_in = 1, b_in = 0
        a_in = 1; b_in = 0;
        #10;
        if (sum !== 1 || carry !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a_in = 1, b_in = 1
        a_in = 1; b_in = 1;
        #10;
        if (sum !== 0 || carry !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule