`timescale 1ns/1ps

module tb_counter;

reg clk;
reg rst;
reg load;
reg [3:0] dn;
wire [3:0] q;

// Instantiate the counter module
counter uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .dn(dn),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1;
    load = 0;
    dn = 4'b0000;

    // Release reset
    #10;
    rst = 0;

    // Test counting up to 10
    #10;
    if (q !== 4'b0000) $display("FAIL: Counter should be 0 after reset");

    // Count up to 10
    repeat (10) @(posedge clk);
    if (q !== 4'b1010) $display("FAIL: Counter should be 10 after counting up");

    // Test reset to 0 after reaching 11
    @(posedge clk);
    if (q !== 4'b0000) $display("FAIL: Counter should reset to 0 after reaching 11");

    // Load a value
    dn = 4'b0101; // Load 5
    load = 1;
    @(posedge clk);
    load = 0;
    if (q !== 4'b0101) $display("FAIL: Counter should load 5");

    // Count up to 10 again
    repeat (5) @(posedge clk);
    if (q !== 4'b1010) $display("FAIL: Counter should be 10 after counting up from 5");

    // Test reset to 0 after reaching 11 again
    @(posedge clk);
    if (q !== 4'b0000) $display("FAIL: Counter should reset to 0 after reaching 11 again");

    // Finish simulation
    $display("PASS");
    $finish;
end

endmodule