`timescale 1ns/1ps

module tb_sipo_behav;

reg clk;
reg rst;
reg s_in;
wire [3:0] p_out;

// Instantiate the module under test
sipo_behav uut (
    .clk(clk),
    .rst(rst),
    .s_in(s_in),
    .p_out(p_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1;
    s_in = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test shifting in values
    s_in = 1; #10; // Shift in 1
    if (p_out !== 4'b0001) $display("FAIL: Expected p_out = 0001, got %b", p_out);

    s_in = 0; #10; // Shift in 0
    if (p_out !== 4'b0010) $display("FAIL: Expected p_out = 0010, got %b", p_out);

    s_in = 1; #10; // Shift in 1
    if (p_out !== 4'b0100) $display("FAIL: Expected p_out = 0100, got %b", p_out);

    s_in = 1; #10; // Shift in 1
    if (p_out !== 4'b1000) $display("FAIL: Expected p_out = 1000, got %b", p_out);

    // Reset the register
    rst = 1; #10; // Wait for reset
    if (p_out !== 4'b0000) $display("FAIL: Expected p_out = 0000 after reset, got %b", p_out);

    // Release reset and shift in values again
    rst = 0; #10; // Wait for 10ns
    s_in = 1; #10; // Shift in 1
    s_in = 1; #10; // Shift in 1
    s_in = 0; #10; // Shift in 0
    s_in = 1; #10; // Shift in 1
    if (p_out !== 4'b1101) $display("FAIL: Expected p_out = 1101, got %b", p_out);

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule