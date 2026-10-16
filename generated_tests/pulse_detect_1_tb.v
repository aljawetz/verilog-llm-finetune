`timescale 1ns/1ps

module tb_pulse_detect;

reg clk;
reg rst_n;
reg data_in;
wire data_out;

// Instantiate the module under test (uut)
pulse_detect uut (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(data_in),
    .data_out(data_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst_n = 0;
    data_in = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test case 1: Valid pulse sequence
    // Expected: data_out should be high after the sequence is detected
    #10 data_in = 1; // Start pulse
    #10 data_in = 0; // End pulse
    #10 data_in = 1; // Start pulse
    #10 data_in = 0; // End pulse
    #10 data_in = 1; // Start pulse
    #10 data_in = 0; // End pulse
    #10 data_in = 1; // Start pulse
    #10 data_in = 0; // End pulse
    #10 data_in = 1; // Start pulse
    #10 data_in = 0; // End pulse
    #10 data_in = 1; // Start pulse
    #10 data_in = 0; // End pulse
    #10 data_in = 1; // Start pulse
    #10 data_in = 0; // End pulse

    // Check output
    if (data_out !== 1'b1) begin
        $display("FAIL: Expected data_out to be high after valid pulse sequence");
        $finish;
    end

    // Test case 2: Invalid pulse sequence
    // Expected: data_out should remain low
    #10 data_in = 1; // Start pulse
    #10 data_in = 1; // Invalid pulse (should be 0)
    #10 data_in = 0; // End pulse

    // Check output
    if (data_out !== 1'b0) begin
        $display("FAIL: Expected data_out to be low after invalid pulse sequence");
        $finish;
    end

    // Test case 3: Reset functionality
    #10 rst_n = 0; // Assert reset
    #10 rst_n = 1; // Deassert reset

    // Check output after reset
    if (data_out !== 1'b0) begin
        $display("FAIL: Expected data_out to be low after reset");
        $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
end

endmodule