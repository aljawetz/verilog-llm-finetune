`timescale 1ns/1ps

module tb_counter;

reg clk;
reg reset;
reg begin_count;
wire [3:0] count;

// Instantiate the counter module
counter uut (
    .clk(clk),
    .reset(reset),
    .begin_count(begin_count),
    .count(count)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 0;
    begin_count = 0;

    // Apply reset
    #10;
    reset = 1; // Release reset
    #10;

    // Start counting
    begin_count = 1;

    // Wait for a few clock cycles and check count
    #50;
    if (count !== 4'd5) begin
        $display("FAIL: Expected count to be 5 after 5 clock cycles");
        $finish;
    end

    // Continue counting
    #50;
    if (count !== 4'd10) begin
        $display("FAIL: Expected count to be 10 after 10 clock cycles");
        $finish;
    end

    // Count to maximum
    #50;
    if (count !== 4'd15) begin
        $display("FAIL: Expected count to be 15 after 15 clock cycles");
        $finish;
    end

    // Check wrap around
    #10;
    if (count !== 4'd0) begin
        $display("FAIL: Expected count to be 0 after wrap around");
        $finish;
    end

    // Stop counting
    begin_count = 0;
    #20;
    if (count !== 4'd0) begin
        $display("FAIL: Expected count to remain 0 when counting is stopped");
        $finish;
    end

    // Release reset and check count
    reset = 0;
    #10;
    reset = 1; // Release reset again
    #10;

    // Start counting again
    begin_count = 1;
    #50;
    if (count !== 4'd5) begin
        $display("FAIL: Expected count to be 5 after 5 clock cycles post reset");
        $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
end

endmodule