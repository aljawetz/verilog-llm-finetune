`timescale 1ns/1ps

module tb_dff_const3;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
dff_const3 uut (
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

    // Check initial conditions
    if (q !== 1'b1) begin
        $display("FAIL: Initial value of q is not 1 after reset");
        $finish;
    end

    // Wait for one clock cycle
    #10;

    // Check q after first clock edge
    if (q !== 1'b0) begin
        $display("FAIL: Value of q is not 0 after first clock edge");
        $finish;
    end

    // Wait for second clock edge
    #10;

    // Check q after second clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Value of q is not 1 after second clock edge");
        $finish;
    end

    // Wait for third clock edge
    #10;

    // Check q after third clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Value of q is not 1 after third clock edge");
        $finish;
    end

    // Wait for fourth clock edge
    #10;

    // Check q after fourth clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Value of q is not 1 after fourth clock edge");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule