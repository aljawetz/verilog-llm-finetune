`timescale 1ns/1ps

module tb_dff_const1;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
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
    if (q !== 1'b0) begin
        $display("FAIL: Output q should be 0 when reset is high");
        $finish;
    end

    // Release reset
    reset = 0;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 after first clock edge when reset is low");
        $finish;
    end

    // Check output after several clock cycles
    #10; // Wait for next clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Output q should remain 1 after second clock edge");
        $finish;
    end

    #10; // Wait for next clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Output q should remain 1 after third clock edge");
        $finish;
    end

    // Assert reset again
    reset = 1;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
        $display("FAIL: Output q should be 0 when reset is high again");
        $finish;
    end

    // Release reset and check output
    reset = 0;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 after clock edge when reset is released");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule