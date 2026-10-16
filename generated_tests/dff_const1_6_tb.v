`timescale 1ns/1ps

module tb_dff_const1;

reg clk;
reg reset;
wire q;

// Instantiate the module under test (uut)
dff_const1 uut (
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

    // Check initial state after reset
    if (q !== 1'b0) begin
        $display("FAIL: Initial state after reset is not 0");
        $finish;
    end

    // Apply clock and check output
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output is not 1 after first clock edge");
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output is not 1 after second clock edge");
        $finish;
    end

    // Apply reset again
    reset = 1;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
        $display("FAIL: Output is not 0 after reset");
        $finish;
    end

    reset = 0; // Release reset
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output is not 1 after clock edge following reset");
        $finish;
    end

    // Final check
    #10; // Wait for 1 clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output is not 1 after additional clock edge");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule