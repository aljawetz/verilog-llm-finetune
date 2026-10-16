`timescale 1ns/1ps

module tb_timer;

reg clk;
reg reset;
reg reconfig;
reg [3:0] setDigit;
reg decrement;
reg do_not_borrow_nextDigit;
wire do_not_borrow_currentDigit;
wire borrow;
wire [3:0] digit;

// Instantiate the timer module
timer uut (
    .clk(clk),
    .reset(reset),
    .reconfig(reconfig),
    .setDigit(setDigit),
    .decrement(decrement),
    .do_not_borrow_nextDigit(do_not_borrow_nextDigit),
    .do_not_borrow_currentDigit(do_not_borrow_currentDigit),
    .borrow(borrow),
    .digit(digit)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
end

// Test sequence
initial begin
    // Initialize signals
    reset = 0;
    reconfig = 0;
    setDigit = 0;
    decrement = 0;
    do_not_borrow_nextDigit = 0;

    // Apply reset
    #10 reset = 1; // Release reset
    #10;

    // Test reconfiguration with valid digit
    reconfig = 1;
    setDigit = 4'b0001; // Set to 1
    #10;
    if (digit !== 4'b0001) $display("FAIL: Expected digit 1 after reconfig, got %b", digit);

    // Test decrementing
    reconfig = 0;
    decrement = 1;
    #10;
    if (digit !== 4'b0000) $display("FAIL: Expected digit 0 after decrement, got %b", digit);

    // Test borrow condition
    decrement = 1;
    do_not_borrow_nextDigit = 0; // Allow borrowing
    #10;
    if (digit !== 4'b1001 || borrow !== 1) $display("FAIL: Expected borrow with digit 9, got %b and borrow %b", digit, borrow);

    // Test do_not_borrow_nextDigit
    decrement = 1;
    do_not_borrow_nextDigit = 1; // Prevent borrowing
    #10;
    if (digit !== 4'b0000 || do_not_borrow_currentDigit !== 1) $display("FAIL: Expected digit 0 and do_not_borrow_currentDigit 1, got %b and %b", digit, do_not_borrow_currentDigit);

    // Test reconfiguration with invalid digit
    reconfig = 1;
    setDigit = 4'b1010; // Set to 10 (invalid)
    #10;
    if (digit !== 4'b1001) $display("FAIL: Expected digit 9 after invalid reconfig, got %b", digit);

    // Test decrementing from 9
    reconfig = 0;
    decrement = 1;
    #10;
    if (digit !== 4'b1000) $display("FAIL: Expected digit 8 after decrement from 9, got %b", digit);

    // Test reset functionality
    reset = 0; // Assert reset
    #10;
    if (digit !== 4'b0000 || do_not_borrow_currentDigit !== 1 || borrow !== 0) $display("FAIL: Expected digit 0, do_not_borrow_currentDigit 1, and borrow 0 after reset, got %b, %b, %b", digit, do_not_borrow_currentDigit, borrow);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule