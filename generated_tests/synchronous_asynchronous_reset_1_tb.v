`timescale 1ns/1ps

module tb_synchronous_asynchronous_reset;

    reg clk;
    reg rst;
    reg in;
    wire async_out;
    wire sync_out;

    // Instantiate the module under test (uut)
    synchronous_asynchronous_reset uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .async_out(async_out),
        .sync_out(sync_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;
        in = 0;

        // Test 1: Check synchronous reset
        rst = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (sync_out !== 1'b0) begin
            $display("FAIL: sync_out should be 0 during synchronous reset");
            $finish;
        end

        // Deactivate reset
        rst = 0;
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (sync_out !== 1'b1) begin
            $display("FAIL: sync_out should be 1 after reset is deactivated");
            $finish;
        end

        // Test 2: Check asynchronous reset
        in = 0; // Change input to 0
        #10; // Wait for one clock cycle
        if (async_out !== 1'b0) begin
            $display("FAIL: async_out should be 0 after input is set to 0");
            $finish;
        end

        // Activate asynchronous reset
        rst = 1; 
        #10; // Wait for one clock cycle
        if (async_out !== 1'b0) begin
            $display("FAIL: async_out should be 0 during asynchronous reset");
            $finish;
        end

        // Deactivate reset
        rst = 0;
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (async_out !== 1'b1) begin
            $display("FAIL: async_out should be 1 after reset is deactivated");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule