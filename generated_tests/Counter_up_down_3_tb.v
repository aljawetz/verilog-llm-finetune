`timescale 1ns/1ps

module tb_Counter_up_down;

reg ud;
reg reset;
reg clk;
wire [7:0] count;

// Instantiate the Counter_up_down module
Counter_up_down uut (
    .ud(ud),
    .reset(reset),
    .clk(clk),
    .count(count)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    ud = 0;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Test counting up
    ud = 1; // Set to count up
    #10; // Wait for 10ns
    if (count !== 8'd10) $display("FAIL: Expected count 10, got %d", count);

    // Test counting down
    #10; // Wait for 10ns
    ud = 0; // Set to count down
    #10; // Wait for 10ns
    if (count !== 8'd0) $display("FAIL: Expected count 0, got %d", count);

    // Test reset functionality
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    reset = 0; // Release reset
    if (count !== 8'd0) $display("FAIL: Expected count 0 after reset, got %d", count);

    // Test counting up to maximum
    ud = 1; // Set to count up
    repeat (255) @(posedge clk); // Count up to 255
    if (count !== 8'd255) $display("FAIL: Expected count 255, got %d", count);

    // Test counting down to minimum
    ud = 0; // Set to count down
    repeat (255) @(posedge clk); // Count down to 0
    if (count !== 8'd0) $display("FAIL: Expected count 0, got %d", count);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule