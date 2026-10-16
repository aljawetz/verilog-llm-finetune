`timescale 1ns/1ps

module tb_dff_const4;

reg clk;
reg reset;
wire q;

// Instantiate the module under test (uut)
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
    
    // Check initial state after reset
    if (q !== 1'b1) begin
        $display("FAIL: Initial state of q is not high after reset");
        $finish;
    end

    // Wait for one clock cycle
    #10;
    
    // Check state of q after one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: State of q is not high after first clock cycle");
        $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check state of q after second clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: State of q is not high after second clock cycle");
        $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
end

endmodule