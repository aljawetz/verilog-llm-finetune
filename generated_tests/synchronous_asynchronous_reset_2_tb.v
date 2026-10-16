`timescale 1ns/1ps

module tb_synchronous_asynchronous_reset;

    // Inputs
    reg clk;
    reg rst;
    reg in;

    // Outputs
    wire out_async;
    wire out_sync;

    // Instantiate the Unit Under Test (UUT)
    synchronous_asynchronous_reset uut (
        .clk(clk), 
        .rst(rst), 
        .in(in), 
        .out_async(out_async), 
        .out_sync(out_sync)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 0;
        in = 0;

        // Wait for global reset
        #10;

        // Test 1: Check outputs after reset
        rst = 1; // Assert reset
        #10;
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Outputs should be 0 after reset");
            $finish;
        end

        // Test 2: Check synchronous reset
        rst = 0; // Deassert reset
        in = 1;  // Set input to 1
        #10;     // Wait for one clock cycle
        if (out_sync !== 1'b1) begin
            $display("FAIL: out_sync should be 1 after input is set to 1");
            $finish;
        end

        // Test 3: Check asynchronous reset
        rst = 1; // Assert reset
        #10;
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Outputs should be 0 after asynchronous reset");
            $finish;
        end

        // Test 4: Check behavior after reset
        rst = 0; // Deassert reset
        in = 1;  // Set input to 1
        #10;     // Wait for one clock cycle
        if (out_sync !== 1'b1) begin
            $display("FAIL: out_sync should be 1 after input is set to 1");
            $finish;
        end
        if (out_async !== 1'b1) begin
            $display("FAIL: out_async should be 1 after input is set to 1");
            $finish;
        end

        // Test 5: Check asynchronous reset during operation
        in = 0;  // Change input to 0
        #10;     // Wait for one clock cycle
        rst = 1; // Assert reset
        #10;
        if (out_async !== 1'b0 || out_sync !== 1'b0) begin
            $display("FAIL: Outputs should be 0 after asynchronous reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule