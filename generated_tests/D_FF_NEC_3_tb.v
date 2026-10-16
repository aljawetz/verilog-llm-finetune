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
    // Initialize D
    D = 0;

    // Wait for the first falling edge
    #7;
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after first falling edge");
        $finish;
    end

    // Set D to 1
    D = 1;
    #10; // Wait for the next falling edge
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 after second falling edge");
        $finish;
    end

    // Set D to 0
    D = 0;
    #10; // Wait for the next falling edge
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after third falling edge");
        $finish;
    end

    // Set D to 1 again
    D = 1;
    #10; // Wait for the next falling edge
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 after fourth falling edge");
        $finish;
    end

    // Final check
    #5; // Wait a bit before finishing
    $display("PASS");
    $finish;
end

endmodule