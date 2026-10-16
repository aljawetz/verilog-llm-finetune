`timescale 1ns/1ps

module tb_synchronous_asynchronous_reset;

    reg clk;
    reg rst;
    reg in;
    wire out_async;
    wire out_sync;

    // Instantiate the module under test (uut)
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

        // Test 1: Check synchronous reset
        rst = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        if (out_sync !== 1'b0) begin
            $display("FAIL: Synchronous reset failed");
            $finish;
        end
        
        // Test 2: Check asynchronous reset
        rst = 0; // Deassert reset
        in = 1; // Set input
        #10; // Wait for 1 clock cycle
        if (out_sync !== 1'b1) begin
            $display("FAIL: Synchronous output not as expected after reset deassertion");
            $finish;
        end
        
        rst = 1; // Assert reset again
        #10; // Wait for 1 clock cycle
        if (out_async !== 1'b0) begin
            $display("FAIL: Asynchronous reset failed");
            $finish;
        end
        
        // Test 3: Check output after asynchronous reset
        rst = 0; // Deassert reset
        in = 1; // Set input
        #10; // Wait for 1 clock cycle
        if (out_async !== 1'b1) begin
            $display("FAIL: Asynchronous output not as expected after reset deassertion");
            $finish;
        end
        
        // Test 4: Check output after synchronous reset
        rst = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        if (out_sync !== 1'b0) begin
            $display("FAIL: Synchronous output not as expected after reset");
            $finish;
        end
        
        // Test 5: Check both outputs with input changes
        rst = 0; // Deassert reset
        in = 0; // Change input
        #10; // Wait for 1 clock cycle
        if (out_sync !== 1'b0 || out_async !== 1'b0) begin
            $display("FAIL: Outputs not as expected with input 0");
            $finish;
        end
        
        in = 1; // Change input
        #10; // Wait for 1 clock cycle
        if (out_sync !== 1'b1 || out_async !== 1'b1) begin
            $display("FAIL: Outputs not as expected with input 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule