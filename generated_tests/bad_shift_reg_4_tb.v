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
    // Initialize inputs
    reset = 1;
    d = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test 1: Check output after setting d
    d = 1; 
    #10; // Wait for one clock cycle
    if (dout !== 1'b1) begin
        $display("FAIL: Expected dout to be 1 after d is set to 1");
        $finish;
    end

    // Test 2: Check output after another clock cycle
    #10; // Wait for another clock cycle
    if (dout !== 1'b1) begin
        $display("FAIL: Expected dout to remain 1 after another clock cycle");
        $finish;
    end

    // Test 3: Change d to 0
    d = 0; 
    #10; // Wait for one clock cycle
    if (dout !== 1'b0) begin
        $display("FAIL: Expected dout to be 0 after d is set to 0");
        $finish;
    end

    // Test 4: Reset the shift register
    reset = 1; 
    #10; // Wait for reset to take effect
    if (dout !== 1'b0) begin
        $display("FAIL: Expected dout to be 0 after reset");
        $finish;
    end

    // Test 5: Check output after reset and d is set to 1
    reset = 0; 
    d = 1; 
    #10; // Wait for one clock cycle
    if (dout !== 1'b1) begin
        $display("FAIL: Expected dout to be 1 after d is set to 1 post-reset");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule