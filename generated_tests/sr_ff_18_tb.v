`timescale 1ns/1ps

module tb_sr_ff;

reg s, r, clk;
wire q, qbar;

// Instantiate the SR flip-flop
sr_ff uut (
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
    s = 0; r = 0;
    #10; // Wait for 10ns

    // Test case 1: Set the flip-flop
    s = 1; r = 0; 
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Reset the flip-flop
    s = 0; r = 1; 
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Hold state when both inputs are low
    s = 0; r = 0; 
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Set again
    s = 1; r = 0; 
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Reset again
    s = 0; r = 1; 
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Final state check
    s = 0; r = 0; 
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Final state check failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule