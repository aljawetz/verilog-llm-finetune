`timescale 1ns/1ps

module tb_dff_const5;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
dff_const5 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;

    // Apply reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;
    #10; // Wait for 10ns

    // Check initial condition after reset
    if (q !== 1'b0) begin
        $display("FAIL: Initial output q should be 0 after reset");
        $finish;
    end

    // Apply clock and check behavior
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 after one clock cycle");
        $finish;
    end

    // Check behavior after another clock cycle
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Output q should remain 1 after second clock cycle");
        $finish;
    end

    // Apply reset again
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;
    #10; // Wait for 10ns

    // Check output after reset
    if (q !== 1'b0) begin
        $display("FAIL: Output q should be 0 after reset");
        $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
end

endmodule