`timescale 1ns/1ps

module tb_d_ff_async_reset;

reg clk;
reg rst_n;
reg d;
wire q;

// Instantiate the module under test (uut)
d_ff_async_reset uut (
    .clk(clk),
    .rst_n(rst_n),
    .d(d),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst_n = 0;
    d = 0;

    // Apply reset
    #10;
    rst_n = 1; // Release reset

    // Test case 1: Check reset functionality
    #10;
    if (q !== 0) begin
        $display("FAIL: q should be 0 after reset");
        $finish;
    end

    // Test case 2: Check D flip-flop functionality
    d = 1; // Set D to 1
    #10; // Wait for clock edge
    if (q !== 1) begin
        $display("FAIL: q should be 1 after clock edge with d = 1");
        $finish;
    end

    // Test case 3: Change D to 0
    d = 0; 
    #10; // Wait for clock edge
    if (q !== 0) begin
        $display("FAIL: q should be 0 after clock edge with d = 0");
        $finish;
    end

    // Test case 4: Check asynchronous reset
    #5;
    rst_n = 0; // Assert reset
    #10;
    if (q !== 0) begin
        $display("FAIL: q should be 0 after asserting reset");
        $finish;
    end

    // Test case 5: Release reset and check D input
    rst_n = 1; // Release reset
    d = 1; 
    #10; // Wait for clock edge
    if (q !== 1) begin
        $display("FAIL: q should be 1 after clock edge with d = 1");
        $finish;
    end

    // Test case 6: Final check with D = 0
    d = 0; 
    #10; // Wait for clock edge
    if (q !== 0) begin
        $display("FAIL: q should be 0 after clock edge with d = 0");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule