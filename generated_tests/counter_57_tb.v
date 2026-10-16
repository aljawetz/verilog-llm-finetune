`timescale 1ns/1ps

module tb_counter;

reg mode;
reg clr;
reg load;
reg [7:0] d_in;
reg clk;
wire [7:0] count;

// Instantiate the counter module
counter uut (
    .mode(mode),
    .clr(clr),
    .load(load),
    .d_in(d_in),
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
    mode = 0;
    clr = 0;
    load = 0;
    d_in = 8'h00;

    // Test 1: Load a value
    load = 1; d_in = 8'hA5; #10; // Load 0xA5
    load = 0; #10;
    if (count !== 8'hA5) $display("FAIL: Expected count to be 0xA5 after load, got %h", count);

    // Test 2: Increment mode
    mode = 1; #10; // Increment
    if (count !== 8'hA6) $display("FAIL: Expected count to be 0xA6 after increment, got %h", count);
    #10; // Increment again
    if (count !== 8'hA7) $display("FAIL: Expected count to be 0xA7 after increment, got %h", count);

    // Test 3: Decrement mode
    mode = 0; #10; // Decrement
    if (count !== 8'hA6) $display("FAIL: Expected count to be 0xA6 after decrement, got %h", count);
    #10; // Decrement again
    if (count !== 8'hA5) $display("FAIL: Expected count to be 0xA5 after decrement, got %h", count);

    // Test 4: Clear the counter
    clr = 1; #10; // Clear
    if (count !== 8'h00) $display("FAIL: Expected count to be 0x00 after clear, got %h", count);
    clr = 0; #10;

    // Test 5: Load another value
    load = 1; d_in = 8'hFF; #10; // Load 0xFF
    load = 0; #10;
    if (count !== 8'hFF) $display("FAIL: Expected count to be 0xFF after load, got %h", count);

    // Test 6: Increment to overflow
    mode = 1; #10; // Increment
    if (count !== 8'h00) $display("FAIL: Expected count to be 0x00 after incrementing 0xFF, got %h", count);

    // End of tests
    $display("PASS");
    $finish;
end

endmodule