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
    reset = 1;
    begin_count = 0;

    // Wait for a few clock cycles
    #10;

    // Test reset functionality
    reset = 0; // Assert reset
    #10;
    if (count !== 4'b0000) begin
        $display("FAIL: Count should be 0 after reset");
        $finish;
    end

    reset = 1; // Deassert reset
    #10;

    // Start counting
    begin_count = 1;
    #10;

    // Check count increments
    if (count !== 4'b0001) begin
        $display("FAIL: Count should be 1");
        $finish;
    end
    #10;

    if (count !== 4'b0010) begin
        $display("FAIL: Count should be 2");
        $finish;
    end
    #10;

    if (count !== 4'b0011) begin
        $display("FAIL: Count should be 3");
        $finish;
    end
    #10;

    // Count up to 15
    repeat (12) @(posedge clk);
    if (count !== 4'b1111) begin
        $display("FAIL: Count should be 15");
        $finish;
    end
    #10;

    // Check reset on reaching 15
    @(posedge clk);
    if (count !== 4'b0000) begin
        $display("FAIL: Count should reset to 0 after reaching 15");
        $finish;
    end

    // Test counting after reset
    begin_count = 1;
    #10;

    if (count !== 4'b0001) begin
        $display("FAIL: Count should be 1 after reset");
        $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
end

endmodule