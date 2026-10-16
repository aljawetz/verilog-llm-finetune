`timescale 1ns/1ps

module tb_good_latch;

    // Inputs
    reg clk;
    reg reset;
    reg d;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    good_latch uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 0;
        d = 0;

        // Test 1: Reset the latch
        reset = 1; #10; // Assert reset
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear q to 0");
            $finish;
        end

        // Test 2: Set d to 1 and clock high
        reset = 0; d = 1; #10; // Clock high
        if (q !== 1'b1) begin
            $display("FAIL: q did not update to d when clk is high");
            $finish;
        end

        // Test 3: Change d to 0 while clk is high
        d = 0; #10; // Clock high
        if (q !== 1'b0) begin
            $display("FAIL: q did not update to d when clk is high");
            $finish;
        end

        // Test 4: Assert reset again
        reset = 1; #10; // Assert reset
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear q to 0");
            $finish;
        end

        // Test 5: Check behavior with no reset and d changes
        reset = 0; d = 1; #10; // Clock high
        if (q !== 1'b1) begin
            $display("FAIL: q did not update to d when clk is high");
            $finish;
        end
        d = 0; #10; // Clock high
        if (q !== 1'b0) begin
            $display("FAIL: q did not update to d when clk is high");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule