`timescale 1ns/1ps

module tb_srff;

reg s, r, clk, rst;
wire q;

// Instantiate the SR flip-flop
srff uut (
    .s(s),
    .r(r),
    .clk(clk),
    .rst(rst),
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
    rst = 1; s = 0; r = 0;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test case 1: Set q to 1
    s = 1; r = 0; #10;
    if (q !== 1'b1) begin
        $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);
        $finish;
    end

    // Test case 2: Reset q to 0
    s = 0; r = 1; #10;
    if (q !== 1'b0) begin
        $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 3: Hold q at 0
    s = 0; r = 0; #10;
    if (q !== 1'b0) begin
        $display("FAIL: Test case 3 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 4: Set q to 1 again
    s = 1; r = 0; #10;
    if (q !== 1'b1) begin
        $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);
        $finish;
    end

    // Test case 5: Both set and reset (undefined state)
    s = 1; r = 1; #10;
    if (q !== 1'bx) begin
        $display("FAIL: Test case 5 failed, expected q=x, got q=%b", q);
        $finish;
    end

    // Test case 6: Reset q to 0 after undefined state
    s = 0; r = 1; #10;
    if (q !== 1'b0) begin
        $display("FAIL: Test case 6 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 7: Hold q at 0
    s = 0; r = 0; #10;
    if (q !== 1'b0) begin
        $display("FAIL: Test case 7 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule