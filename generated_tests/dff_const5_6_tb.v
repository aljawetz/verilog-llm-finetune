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

    // Wait for one clock cycle
    #10;

    // Check output after reset is released
    if (q !== 1'b0) begin
        $display("FAIL: Output should be 0 after reset is released");
        $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check output after one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: Output should be 1 after one clock cycle");
        $finish;
    end

    // Wait for additional clock cycles to ensure output remains high
    #20;

    // Final check to ensure output remains high
    if (q !== 1'b1) begin
        $display("FAIL: Output should remain 1");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule