`timescale 1ns/1ps

module tb_full_adder_dataflow;

    // Inputs
    reg a;
    reg b;
    reg carry_in;

    // Outputs
    wire sum;
    wire carry_out;

    // Instantiate the Unit Under Test (UUT)
    full_adder_dataflow uut (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, carry_out = 0
        a = 0; b = 0; carry_in = 0;
        #10;
        if (sum !== 0 || carry_out !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 0 + 0 + 1 = 1, carry_out = 0
        a = 0; b = 0; carry_in = 1;
        #10;
        if (sum !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 0 + 1 + 0 = 1, carry_out = 0
        a = 0; b = 1; carry_in = 0;
        #10;
        if (sum !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 0 + 1 + 1 = 0, carry_out = 1
        a = 0; b = 1; carry_in = 1;
        #10;
        if (sum !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 1 + 0 + 0 = 1, carry_out = 0
        a = 1; b = 0; carry_in = 0;
        #10;
        if (sum !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 1 + 0 + 1 = 0, carry_out = 1
        a = 1; b = 0; carry_in = 1;
        #10;
        if (sum !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 1 + 1 + 0 = 0, carry_out = 1
        a = 1; b = 1; carry_in = 0;
        #10;
        if (sum !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 1 + 1 + 1 = 1, carry_out = 1
        a = 1; b = 1; carry_in = 1;
        #10;
        if (sum !== 1 || carry_out !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule