`timescale 1ns/1ps

module tb_sync_async_reset;

    reg clk;
    reg rst;
    reg A;
    wire async;
    wire sync;

    // Instantiate the module under test (uut)
    sync_async_reset uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .async(async),
        .sync(sync)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; // Assert reset
        A = 0;
        #10; // Wait for 10ns
        
        // Check async reset
        if (async !== 1'b0 || sync !== 1'b0) begin
            $display("FAIL: Reset did not clear outputs");
            $finish;
        end
        
        // Release reset
        rst = 0;
        #10; // Wait for 10ns
        
        // Apply input A
        A = 1;
        #10; // Wait for 10ns
        
        // Check outputs after A is applied
        if (async !== 1'b1 || sync !== 1'b1) begin
            $display("FAIL: Outputs did not match expected values after A is set");
            $finish;
        end
        
        // Apply reset again
        rst = 1;
        #10; // Wait for 10ns
        
        // Check async reset again
        if (async !== 1'b0 || sync !== 1'b0) begin
            $display("FAIL: Reset did not clear outputs after A was set");
            $finish;
        end
        
        // Release reset
        rst = 0;
        #10; // Wait for 10ns
        
        // Change A to 0
        A = 0;
        #10; // Wait for 10ns
        
        // Check outputs after A is changed
        if (async !== 1'b0 || sync !== 1'b0) begin
            $display("FAIL: Outputs did not match expected values after A is cleared");
            $finish;
        end
        
        // Apply synchronous reset
        rst = 1;
        #10; // Wait for 10ns
        
        // Check outputs after synchronous reset
        if (async !== 1'b0 || sync !== 1'b0) begin
            $display("FAIL: Reset did not clear outputs after synchronous reset");
            $finish;
        end
        
        // End of test
        $display("PASS");
        $finish;
    end

endmodule