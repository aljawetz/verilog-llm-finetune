`timescale 1ns/1ps

module tb_dff;

reg clk;
reg rst;
reg d;
wire q;

// Instantiate the D flip-flop
dff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1;
    d = 0;

    // Wait for a clock edge
    #10;

    // Test reset functionality
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test setting d
    d = 1;
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow d when rst is low");
        $finish;
    end

    // Change d
    d = 0;
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: q did not follow d after change");
        $finish;
    end

    // Test reset again
    rst = 1;
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0 again");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule