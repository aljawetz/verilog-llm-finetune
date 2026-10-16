`timescale 1ns/1ps

module tb_bad_shift_reg;

reg clk;
reg reset;
reg d;
wire dout;

// Instantiate the module under test
bad_shift_reg uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .dout(dout)
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
    d = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10; // Wait for 10ns

    // Test case 1: Check output after setting d
    d = 1;
    #10; // Wait for 10ns
    if (dout !== 1'b1) begin
        $display("FAIL: Expected dout = 1, got dout = %b", dout);
        $finish;
    end

    // Test case 2: Shift with d = 0
    d = 0;
    #10; // Wait for 10ns
    if (dout !== 1'b0) begin
        $display("FAIL: Expected dout = 0, got dout = %b", dout);
        $finish;
    end

    // Test case 3: Reset functionality
    reset = 1;
    #10; // Wait for 10ns
    if (dout !== 1'b0) begin
        $display("FAIL: Expected dout = 0 after reset, got dout = %b", dout);
        $finish;
    end

    // Test case 4: Check output after reset and set d again
    reset = 0;
    d = 1;
    #10; // Wait for 10ns
    if (dout !== 1'b1) begin
        $display("FAIL: Expected dout = 1, got dout = %b", dout);
        $finish;
    end

    // Test case 5: Final reset check
    reset = 1;
    #10; // Wait for 10ns
    if (dout !== 1'b0) begin
        $display("FAIL: Expected dout = 0 after final reset, got dout = %b", dout);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule