`timescale 1ns/1ps

module tb_d_flipflop;

reg d;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the D Flip-Flop
d_flipflop uut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    d = 0;
    rst = 0;

    // Test reset functionality
    rst = 1; #10; // Assert reset
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1");
        $finish;
    end

    rst = 0; #10; // Deassert reset

    // Test D flip-flop functionality
    d = 1; #10; // Set d to 1
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: After setting d to 1, q should be 1 and qbar should be 0");
        $finish;
    end

    d = 0; #10; // Set d to 0
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: After setting d to 0, q should be 0 and qbar should be 1");
        $finish;
    end

    // Test multiple clock cycles
    d = 1; #10; // Set d to 1
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: After setting d to 1 again, q should be 1 and qbar should be 0");
        $finish;
    end

    d = 0; #10; // Set d to 0
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: After setting d to 0 again, q should be 0 and qbar should be 1");
        $finish;
    end

    // Final check
    rst = 1; #10; // Assert reset
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Final reset did not set q to 0 and qbar to 1");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule