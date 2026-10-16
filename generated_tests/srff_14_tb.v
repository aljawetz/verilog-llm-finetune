`timescale 1ns/1ps

module tb_srff;

reg s;
reg r;
reg clk;
wire q;
wire qbar;

// Instantiate the SR Flip-Flop
srff uut (
    .s(s),
    .r(r),
    .clk(clk),
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
    s = 0;
    r = 0;
    
    // Wait for the first clock edge
    #10;
    
    // Test case 1: Set condition (s=1, r=0)
    s = 1; r = 0;
    #10;
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: Test case 1 failed (Set condition)");
        $finish;
    end
    
    // Test case 2: Reset condition (s=0, r=1)
    s = 0; r = 1;
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: Test case 2 failed (Reset condition)");
        $finish;
    end
    
    // Test case 3: No change condition (s=0, r=0)
    s = 0; r = 0;
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: Test case 3 failed (No change condition)");
        $finish;
    end
    
    // Test case 4: Invalid condition (s=1, r=1)
    s = 1; r = 1;
    #10;
    if (q !== 1'bx || qbar !== 1'bx) begin
        $display("FAIL: Test case 4 failed (Invalid condition)");
        $finish;
    end
    
    // Test case 5: Back to Set condition (s=1, r=0)
    s = 1; r = 0;
    #10;
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: Test case 5 failed (Set condition again)");
        $finish;
    end
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule