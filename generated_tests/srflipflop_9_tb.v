`timescale 1ns/1ps

module tb_srflipflop;

reg s, r, clk, rst;
wire q, qbar;

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
    s = 0; r = 0; rst = 1; // Reset state
    #10;
    
    // Release reset
    rst = 0;
    #10;

    // Test case 1: Set condition
    s = 1; r = 0; 
    #10;
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 1 failed (Set condition)");
        $finish;
    end

    // Test case 2: Reset condition
    s = 0; r = 1; 
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 2 failed (Reset condition)");
        $finish;
    end

    // Test case 3: Hold state
    s = 0; r = 0; 
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 3 failed (Hold state after reset)");
        $finish;
    end

    // Test case 4: Set again
    s = 1; r = 0; 
    #10;
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 4 failed (Set again)");
        $finish;
    end

    // Test case 5: Reset while set
    s = 0; r = 1; 
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 5 failed (Reset while set)");
        $finish;
    end

    // Test case 6: Hold state after reset
    s = 0; r = 0; 
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 6 failed (Hold state after reset)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule