`timescale 1ns/1ps

module tb_mealy_overlap;

    reg clk;
    reg arstn;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    mealy_overlap uut (
        .clk(clk),
        .arstn(arstn),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Reset and test sequence
    initial begin
        arstn = 0; // Assert reset
        #10;
        arstn = 1; // Deassert reset
        #10;

        // Test sequence
        // Test case 1: Initial state
        in = 0; #10;
        if (out !== 1'b0) $display("FAIL: Initial state output is incorrect");

        // Test case 2: Transition from s0 to s1
        in = 1; #10;
        if (out !== 1'b0) $display("FAIL: Output should be 0 when transitioning to s1");

        // Test case 3: Transition from s1 to s2
        in = 0; #10;
        if (out !== 1'b0) $display("FAIL: Output should be 0 when transitioning to s2");

        // Test case 4: Transition from s2 to s1
        in = 1; #10;
        if (out !== 1'b1) $display("FAIL: Output should be 1 when transitioning back to s1");

        // Test case 5: Transition from s2 to s0
        in = 0; #10;
        if (out !== 1'b0) $display("FAIL: Output should be 0 when transitioning to s0");

        // Test case 6: Check output remains 0 in s0
        in = 0; #10;
        if (out !== 1'b0) $display("FAIL: Output should remain 0 in s0");

        // Test case 7: Check output remains 0 in s1
        in = 1; #10;
        in = 0; #10;
        if (out !== 1'b0) $display("FAIL: Output should remain 0 in s1 after transition");

        // Test case 8: Check output in s2 with in = 1
        in = 1; #10;
        if (out !== 1'b1) $display("FAIL: Output should be 1 in s2 with in = 1");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule