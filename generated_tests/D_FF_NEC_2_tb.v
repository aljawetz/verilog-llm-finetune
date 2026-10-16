`timescale 1ns/1ps

module tb_D_FF_NEC;

reg D;
reg clk;
wire Q;

// Instantiate the D flip-flop
D_FF_NEC uut (
    .D(D),
    .clk(clk),
    .Q(Q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize
    D = 0;

    // Wait for the first falling edge
    #7; // Wait for a bit before the first clock edge
    if (Q !== 0) begin
        $display("FAIL: Initial Q is not 0");
        $finish;
    end

    // Test case 1: Set D to 1
    D = 1;
    #10; // Wait for the next falling edge
    if (Q !== 1) begin
        $display("FAIL: Q did not update to 1 when D was set to 1");
        $finish;
    end

    // Test case 2: Set D to 0
    D = 0;
    #10; // Wait for the next falling edge
    if (Q !== 0) begin
        $display("FAIL: Q did not update to 0 when D was set to 0");
        $finish;
    end

    // Test case 3: Hold D at 0
    #10; // Wait for the next falling edge
    if (Q !== 0) begin
        $display("FAIL: Q did not remain 0 when D was held at 0");
        $finish;
    end

    // Test case 4: Set D to 1 again
    D = 1;
    #10; // Wait for the next falling edge
    if (Q !== 1) begin
        $display("FAIL: Q did not update to 1 when D was set to 1 again");
        $finish;
    end

    // Test case 5: Hold D at 1
    #10; // Wait for the next falling edge
    if (Q !== 1) begin
        $display("FAIL: Q did not remain 1 when D was held at 1");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule