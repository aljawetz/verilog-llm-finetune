`timescale 1ns/1ps

module tb_sr_ff;

reg S;
reg R;
reg clk;
wire Q;
wire Qbar;

// Instantiate the SR flip-flop
sr_ff uut (
    .S(S),
    .R(R),
    .clk(clk),
    .Q(Q),
    .Qbar(Qbar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    S = 0; R = 0;
    #10; // Wait for clock edge

    // Test case 1: Hold state (S=0, R=0)
    S = 0; R = 0; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 2: Set state (S=1, R=0)
    S = 1; R = 0; #10;
    if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

    // Test case 3: Reset state (S=0, R=1)
    S = 0; R = 1; #10;
    if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

    // Test case 4: Indeterminate state (S=1, R=1)
    S = 1; R = 1; #10;
    if (Q !== 1'bx) $display("FAIL: Expected Q=x, got Q=%b", Q);

    // Test case 5: Check Qbar
    S = 0; R = 0; #10; // Hold state
    if (Qbar !== 1) $display("FAIL: Expected Qbar=1, got Qbar=%b", Qbar);

    // Final state check
    S = 1; R = 0; #10; // Set state
    if (Qbar !== 0) $display("FAIL: Expected Qbar=0, got Qbar=%b", Qbar);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule