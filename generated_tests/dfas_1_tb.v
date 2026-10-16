`timescale 1ns/1ps

module tb_dfas;

reg clk;
reg rest;
reg d;
wire q;

// Instantiate the module under test
dfas uut (
    .clk(clk),
    .rest(rest),
    .d(d),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rest = 0;
    d = 0;

    // Test 1: Asynchronous reset
    rest = 1; // Activate reset
    #10;
    if (q !== 0) begin
        $display("FAIL: Reset did not clear output");
        $finish;
    end

    // Test 2: Check D flip-flop behavior
    rest = 0; // Deactivate reset
    d = 1;    // Set D to 1
    #10;      // Wait for falling edge of clock
    if (q !== 1) begin
        $display("FAIL: Output not set to D on falling edge (D=1)");
        $finish;
    end

    d = 0;    // Set D to 0
    #10;      // Wait for falling edge of clock
    if (q !== 0) begin
        $display("FAIL: Output not set to D on falling edge (D=0)");
        $finish;
    end

    // Test 3: Check reset during operation
    d = 1;    // Set D to 1
    #10;      // Wait for falling edge of clock
    if (q !== 1) begin
        $display("FAIL: Output not set to D on falling edge (D=1)");
        $finish;
    end

    rest = 1; // Activate reset
    #10;
    if (q !== 0) begin
        $display("FAIL: Reset did not clear output during operation");
        $finish;
    end

    // Test 4: Check D flip-flop behavior again after reset
    rest = 0; // Deactivate reset
    d = 1;    // Set D to 1
    #10;      // Wait for falling edge of clock
    if (q !== 1) begin
        $display("FAIL: Output not set to D on falling edge (D=1) after reset");
        $finish;
    end

    d = 0;    // Set D to 0
    #10;      // Wait for falling edge of clock
    if (q !== 0) begin
        $display("FAIL: Output not set to D on falling edge (D=0) after reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule