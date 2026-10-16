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
    #10;

    // Release reset
    rst = 0;
    #10;

    // Test sequence
    // State S0
    if (out !== 0) begin
        $display("FAIL: Expected out=0 in state S0");
        $finish;
    end

    // Transition to S1
    in = 1; #10;
    if (uut.state !== 4'b0001) begin
        $display("FAIL: Expected state S1");
        $finish;
    end
    if (out !== 0) begin
        $display("FAIL: Expected out=0 in state S1");
        $finish;
    end

    // Transition to S2
    in = 0; #10;
    if (uut.state !== 4'b0010) begin
        $display("FAIL: Expected state S2");
        $finish;
    end
    if (out !== 0) begin
        $display("FAIL: Expected out=0 in state S2");
        $finish;
    end

    // Transition to S3
    in = 0; #10;
    if (uut.state !== 4'b0011) begin
        $display("FAIL: Expected state S3");
        $finish;
    end
    if (out !== 0) begin
        $display("FAIL: Expected out=0 in state S3");
        $finish;
    end

    // Transition to S4
    in = 1; #10;
    if (uut.state !== 4'b0100) begin
        $display("FAIL: Expected state S4");
        $finish;
    end
    if (out !== 1) begin
        $display("FAIL: Expected out=1 in state S4");
        $finish;
    end

    // Transition back to S0
    in = 0; #10;
    if (uut.state !== 4'b0000) begin
        $display("FAIL: Expected state S0 after transition from S4");
        $finish;
    end
    if (out !== 0) begin
        $display("FAIL: Expected out=0 in state S0 after transition from S4");
        $finish;
    end

    // Assert reset
    rst = 1; #10;
    if (uut.state !== 4'b0000) begin
        $display("FAIL: Expected state S0 after reset");
        $finish;
    end
    if (out !== 0) begin
        $display("FAIL: Expected out=0 after reset");
        $finish;
    end

    // End of test
    $display("PASS");
    $finish;
end

endmodule