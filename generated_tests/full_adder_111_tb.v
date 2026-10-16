`timescale 1ns/1ps

module tb_full_adder;

    // Inputs
    reg a_in;
    reg b_in;
    reg c_in;

    // Outputs
    wire sum_out;
    wire carry_out;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .sum_out(sum_out),
        .carry_out(carry_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, carry = 0
        a_in = 0; b_in = 0; c_in = 0;
        #10;
        if (sum_out !== 0 || carry_out !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 0 + 0 + 1 = 1, carry = 0
        a_in = 0; b_in = 0; c_in = 1;
        #10;
        if (sum_out !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 0 + 1 + 0 = 1, carry = 0
        a_in = 0; b_in = 1; c_in = 0;
        #10;
        if (sum_out !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 1 + 0 + 0 = 1, carry = 0
        a_in = 1; b_in = 0; c_in = 0;
        #10;
        if (sum_out !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 1 + 1 + 0 = 0, carry = 1
        a_in = 1; b_in = 1; c_in = 0;
        #10;
        if (sum_out !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 1 + 0 + 1 = 0, carry = 1
        a_in = 1; b_in = 0; c_in = 1;
        #10;
        if (sum_out !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 0 + 1 + 1 = 0, carry = 1
        a_in = 0; b_in = 1; c_in = 1;
        #10;
        if (sum_out !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 1 + 1 + 1 = 1, carry = 1
        a_in = 1; b_in = 1; c_in = 1;
        #10;
        if (sum_out !== 1 || carry_out !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule