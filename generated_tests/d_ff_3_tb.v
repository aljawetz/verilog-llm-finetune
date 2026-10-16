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
        rst = 1; // Activate reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        rst = 0; // Deactivate reset
        #10; // Wait for a clock edge

        // Test 2: Check D flip-flop functionality
        in = 1; // Set input to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to 1");
            $finish;
        end

        in = 0; // Change input to 0
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q did not update to 0");
            $finish;
        end

        // Test 3: Check reset during operation
        in = 1; // Set input to 1
        #10; // Wait for a clock edge
        rst = 1; // Activate reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 during operation");
            $finish;
        end

        // Finalize the test
        $display("PASS");
        $finish;
    end

endmodule