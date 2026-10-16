`timescale 1ns/1ps

module tb_fsm1001_nov1;

reg clk;
reg rst;
reg in;
wire out;

// Instantiate the module under test
fsm1001_nov1 uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
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
    in = 0;
    #10; // Wait for a clock cycle

    // Release reset
    rst = 0;
    #10;

    // Test sequence
    // State S0
    if (out !== 0) begin
        $display("FAIL: Expected out = 0 in state S0");
        $finish;
    end

    // Transition to S1
    in = 1; #10;
    if (uut.state !== uut.S1) begin
        $display("FAIL: Expected state S1 after input 1 from S0");
        $finish;
    end

    // State S1
    if (out !== 0) begin
        $display("FAIL: Expected out = 0 in state S1");
        $finish;
    end

    // Transition to S2
    in = 0; #10;
    if (uut.state !== uut.S2) begin
        $display("FAIL: Expected state S2 after input 0 from S1");
        $finish;
    end

    // State S2
    if (out !== 0) begin
        $display("FAIL: Expected out = 0 in state S2");
        $finish;
    end

    // Transition to S3
    in = 0; #10;
    if (uut.state !== uut.S3) begin
        $display("FAIL: Expected state S3 after input 0 from S2");
        $finish;
    end

    // State S3
    if (out !== 0) begin
        $display("FAIL: Expected out = 0 in state S3");
        $finish;
    end

    // Transition to S4
    in = 1; #10;
    if (uut.state !== uut.S4) begin
        $display("FAIL: Expected state S4 after input 1 from S3");
        $finish;
    end

    // State S4
    if (out !== 1) begin
        $display("FAIL: Expected out = 1 in state S4");
        $finish;
    end

    // Transition back to S0
    in = 0; #10;
    if (uut.state !== uut.S0) begin
        $display("FAIL: Expected state S0 after input 0 from S4");
        $finish;
    end

    // State S0 again
    if (out !== 0) begin
        $display("FAIL: Expected out = 0 in state S0");
        $finish;
    end

    // Test reset functionality
    rst = 1; #10;
    rst = 0; #10;
    if (uut.state !== uut.S0) begin
        $display("FAIL: Expected state S0 after reset");
        $finish;
    end

    // Final check
    if (out !== 0) begin
        $display("FAIL: Expected out = 0 after reset in state S0");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule