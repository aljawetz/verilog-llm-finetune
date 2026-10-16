`timescale 1ns/1ps

module tb_dff_const2;

reg clk;
reg reset;
wire q;

// Instantiate the module under test (uut)
dff_const2 uut (
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
    reset = 0; // Release reset

    // Check initial condition after reset
    if (q !== 1'b1) begin
        $display("FAIL: Initial output q is not 1 after reset");
        $finish;
    end

    // Wait for one clock cycle
    #10;

    // Check output after one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after one clock cycle");
        $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check output after two clock cycles
    if (q !== 1'b1) begin
        $display("FAIL: Output q is not 1 after two clock cycles");
        $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
end

endmodule