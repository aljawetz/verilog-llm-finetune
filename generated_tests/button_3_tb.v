`timescale 1ns/1ps

module tb_button;

reg clk;
reg signal;
wire state;

// Instantiate the module under test
button uut (
    .clk(clk),
    .signal(signal),
    .state(state)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    signal = 1'b1;

    // Wait for a few clock cycles
    #10;

    // Test falling edge detection
    signal = 1'b0; // Falling edge
    #10;
    if (state !== 1'b1) begin
        $display("FAIL: Falling edge not detected");
        $finish;
    end

    // Wait for one clock cycle
    #10;
    if (state !== 1'b0) begin
        $display("FAIL: State should be low after pulse");
        $finish;
    end

    // Test stable high
    signal = 1'b1; // No edge
    #10;
    if (state !== 1'b0) begin
        $display("FAIL: State should remain low with no edge");
        $finish;
    end

    // Test another falling edge
    signal = 1'b0; // Falling edge
    #10;
    if (state !== 1'b1) begin
        $display("FAIL: Second falling edge not detected");
        $finish;
    end

    // Wait for one clock cycle
    #10;
    if (state !== 1'b0) begin
        $display("FAIL: State should be low after second pulse");
        $finish;
    end

    // Test stable low
    signal = 1'b0; // No edge
    #10;
    if (state !== 1'b0) begin
        $display("FAIL: State should remain low with no edge");
        $finish;
    end

    // Test rising edge
    signal = 1'b1; // Rising edge
    #10;
    if (state !== 1'b0) begin
        $display("FAIL: State should remain low on rising edge");
        $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
end

endmodule