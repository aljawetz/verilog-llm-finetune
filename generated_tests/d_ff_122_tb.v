`timescale 1ns/1ps

module tb_d_ff;

    // Inputs
    reg in;
    reg clk;
    reg rst;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    d_ff uut (
        .in(in),
        .clk(clk),
        .rst(rst),
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
        in = 0;
        rst = 0;

        // Test 1: Reset functionality
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: D flip-flop functionality
        rst = 0; // Deassert reset
        in = 1;  // Set input to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to input value 1");
            $finish;
        end

        // Test 3: Change input while clock is low
        in = 0;  // Change input to 0
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q did not update to input value 0");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test 5: Check for stable state
        rst = 0; // Deassert reset
        in = 1;  // Set input to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not remain at input value 1");
            $finish;
        end

        // Test 6: Final reset check
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Final reset did not set q to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule