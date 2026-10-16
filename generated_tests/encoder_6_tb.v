`timescale 1ns/1ps

module tb_encoder;

reg clk;
reg rst;
reg [7:0] a;
wire full;
wire half;
wire empty;

// Instantiate the module under test (uut)
encoder uut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .full(full),
    .half(half),
    .empty(empty)
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
    a = 8'b00000000;
    #10; // Wait for a clock cycle
    rst = 0;

    // Test case 1: Check full status
    a = 8'b10000000; // Tank full
    #10;
    if (full !== 1'b1 || half !== 1'b0 || empty !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Check half status
    a = 8'b00010000; // Tank half
    #10;
    if (full !== 1'b0 || half !== 1'b1 || empty !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Check empty status
    a = 8'b00000001; // Tank empty
    #10;
    if (full !== 1'b0 || half !== 1'b0 || empty !== 1'b1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Check reset functionality
    rst = 1;
    #10;
    if (full !== 1'b0 || half !== 1'b0 || empty !== 1'b0) begin
        $display("FAIL: Reset failed");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule