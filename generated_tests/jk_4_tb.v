`timescale 1ns/1ps

module tb_jk;

reg j, k, clk, rst;
wire q;

// Instantiate the jk module
jk uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    j = 0;
    k = 0;

    // Apply reset
    rst = 1;
    #10;
    rst = 0;

    // Test sequence
    // Test 1: Check reset functionality
    #10;
    if (q !== 0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Set q to 1
    j = 1; k = 0; // Set
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected q to be 1 when j=1, k=0");
        $finish;
    end

    // Test 3: Reset q to 0
    j = 0; k = 1; // Reset
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q to be 0 when j=0, k=1");
        $finish;
    end

    // Test 4: Toggle q
    j = 1; k = 1; // Toggle
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected q to be 1 after toggle when j=1, k=1");
        $finish;
    end

    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q to be 0 after toggle when j=1, k=1");
        $finish;
    end

    // Test 5: Hold state
    j = 0; k = 0; // Hold
    #10;
    if (q !== 0) begin
        $display("FAIL: Expected q to hold at 0 when j=0, k=0");
        $finish;
    end

    // Test 6: Set q to 1 again
    j = 1; k = 0; // Set
    #10;
    if (q !== 1) begin
        $display("FAIL: Expected q to be 1 when j=1, k=0");
        $finish;
    end

    // Final check
    $display("PASS");
    $finish;
end

endmodule