`timescale 1ns/1ps

module tb_sr3;

reg clk;
reg reset;
reg s;
reg r;
wire q;

// Instantiate the module under test
sr3 uut (
    .clk(clk),
    .reset(reset),
    .s(s),
    .r(r),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    s = 0;
    r = 0;
    #10; // Wait for a clock edge

    // Release reset
    reset = 0;
    #10; // Wait for a clock edge

    // Test case 1: Set q to 1 (s=1, r=0)
    s = 1; r = 0;
    #10; // Wait for a clock edge
    if (q !== 1) begin
        $display("FAIL: Expected q=1, got q=%b", q);
        $finish;
    end

    // Test case 2: Set q to 0 (s=0, r=1)
    s = 0; r = 1;
    #10; // Wait for a clock edge
    if (q !== 0) begin
        $display("FAIL: Expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 3: Retain state (s=0, r=0)
    s = 0; r = 0;
    #10; // Wait for a clock edge
    if (q !== 0) begin
        $display("FAIL: Expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 4: Set q to high-impedance (s=0, r=0)
    s = 1; r = 1;
    #10; // Wait for a clock edge
    if (q !== 1'bz) begin
        $display("FAIL: Expected q=Z, got q=%b", q);
        $finish;
    end

    // Test case 5: Reset q to 0 (reset=1)
    reset = 1;
    #10; // Wait for a clock edge
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after reset, got q=%b", q);
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule