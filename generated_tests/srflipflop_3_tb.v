`timescale 1ns/1ps

module tb_srflipflop;

reg s;
reg r;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the SR Flip-Flop
srflipflop uut (
    .s(s),
    .r(r),
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
    // Initialize inputs
    rst = 1; s = 0; r = 0;
    #10; // Wait for clock edge

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Set condition
    s = 1; r = 0; 
    #10;
    if (q !== 1) begin
        $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);
        $finish;
    end

    // Test case 2: Reset condition
    s = 0; r = 1; 
    #10;
    if (q !== 0) begin
        $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 3: Hold state
    s = 0; r = 0; 
    #10;
    if (q !== 0) begin
        $display("FAIL: Test case 3 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 4: Set again
    s = 1; r = 0; 
    #10;
    if (q !== 1) begin
        $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);
        $finish;
    end

    // Test case 5: Invalid condition
    s = 1; r = 1; 
    #10;
    if (q !== 1'bx) begin
        $display("FAIL: Test case 5 failed, expected q=x, got q=%b", q);
        $finish;
    end

    // Test case 6: Reset again
    s = 0; r = 1; 
    #10;
    if (q !== 0) begin
        $display("FAIL: Test case 6 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule