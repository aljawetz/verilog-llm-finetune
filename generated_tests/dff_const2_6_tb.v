`timescale 1ns/1ps

module tb_dff_const2;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
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
    reset = 0;
    #10; // Wait for 10ns

    // Check the output after reset
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 after reset");
        $finish;
    end

    // Apply clock cycles and check output
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 at clock cycle 1");
        $finish;
    end

    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 at clock cycle 2");
        $finish;
    end

    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 at clock cycle 3");
        $finish;
    end

    // Reset again
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;
    #10; // Wait for 10ns

    // Check the output after reset again
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 after reset");
        $finish;
    end

    // Final check
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Output q should be 1 at final check");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule