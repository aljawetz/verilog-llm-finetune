`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg in;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .in(in),
        .out(out)
    );

    // Clock and Reset
    initial begin
        // Initialize inputs
        in = 0;

        // Test sequence
        #10; // Wait for 10 time units
        in = 1; // Test case: input = 1
        #10; // Wait for 10 time units
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got out = %b", out);
            $finish;
        end

        #10; // Wait for 10 time units
        in = 0; // Test case: input = 0
        #10; // Wait for 10 time units
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got out = %b", out);
            $finish;
        end

        #10; // Wait for 10 time units
        in = 1; // Test case: input = 1 again
        #10; // Wait for 10 time units
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got out = %b", out);
            $finish;
        end

        // Final check
        #10; // Wait for 10 time units
        in = 0; // Test case: input = 0 again
        #10; // Wait for 10 time units
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule