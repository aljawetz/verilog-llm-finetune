`timescale 1ns/1ps

module tb_dff_const4;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
dff_const4 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial condition
    if (q !== 1'b1) begin
        $display("FAIL: Initial output q is not 1 after reset");
        $finish;
    end

    // Wait for a clock cycle
    #10;

    // Check output after first clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after first clock cycle");
        $finish;
    end

    // Apply reset again
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check output after reset
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after reset again");
        $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check output after second clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after second clock cycle");
        $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
end

endmodule