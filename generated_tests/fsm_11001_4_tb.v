`timescale 1ns/1ps

module tb_fsm_11001;

reg din;
reg clk;
reg rst;
wire y;

// Instantiate the module under test
fsm_11001 uut (
    .din(din),
    .clk(clk),
    .rst(rst),
    .y(y)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    din = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test sequence to check state transitions and output
    // State S0
    #10; din = 1; // Transition to S1
    #10; din = 1; // Transition to S2
    #10; din = 0; // Transition to S3
    #10; din = 0; // Transition to S4
    #10; din = 1; // Output should be 1, transition to S0
    #10; if (y !== 1'b1) $display("FAIL: Expected y=1 at S4, got y=%b", y);

    // Reset and test again
    rst = 1; #10; rst = 0;

    // Test sequence to ensure it stays in S0
    #10; din = 0; // Stay in S0
    #10; if (y !== 1'b0) $display("FAIL: Expected y=0 at S0, got y=%b", y);

    // Test S1 transition
    #10; din = 1; // Transition to S1
    #10; din = 0; // Back to S0
    #10; if (y !== 1'b0) $display("FAIL: Expected y=0 at S1, got y=%b", y);

    // Test S2 transition
    #10; din = 1; // Transition to S1
    #10; din = 1; // Transition to S2
    #10; din = 0; // Transition to S3
    #10; if (y !== 1'b0) $display("FAIL: Expected y=0 at S2, got y=%b", y);

    // Test S3 transition
    #10; din = 0; // Transition to S4
    #10; if (y !== 1'b0) $display("FAIL: Expected y=0 at S3, got y=%b", y);

    // Test S4 transition
    #10; din = 1; // Output should be 1, transition to S0
    #10; if (y !== 1'b1) $display("FAIL: Expected y=1 at S4, got y=%b", y);

    // End of tests
    $display("PASS");
    $finish;
end

endmodule