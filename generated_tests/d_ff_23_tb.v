`timescale 1ns/1ps

module tb_d_ff;

reg clk;
reg rst;
reg din;
wire dout;

// Instantiate the D flip-flop
d_ff uut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(dout)
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
    din = 0;

    // Wait for a clock cycle
    #10;

    // Test reset functionality
    rst = 1; // Assert reset
    #10;
    if (dout !== 0) begin
        $display("FAIL: dout should be 0 when rst is high");
        $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test capturing din value
    din = 1; // Set din to 1
    #10; // Wait for clock edge
    if (dout !== 1) begin
        $display("FAIL: dout should be 1 after capturing din = 1");
        $finish;
    end

    din = 0; // Change din to 0
    #10; // Wait for clock edge
    if (dout !== 0) begin
        $display("FAIL: dout should be 0 after capturing din = 0");
        $finish;
    end

    // Test reset functionality again
    rst = 1; // Assert reset
    #10;
    if (dout !== 0) begin
        $display("FAIL: dout should be 0 when rst is high");
        $finish;
    end

    // Release reset and test with multiple clock cycles
    rst = 0;
    din = 1; // Set din to 1
    #10; // Wait for clock edge
    if (dout !== 1) begin
        $display("FAIL: dout should be 1 after capturing din = 1");
        $finish;
    end

    din = 1; // Keep din as 1
    #10; // Wait for clock edge
    if (dout !== 1) begin
        $display("FAIL: dout should remain 1 when din is still 1");
        $finish;
    end

    din = 0; // Change din to 0
    #10; // Wait for clock edge
    if (dout !== 0) begin
        $display("FAIL: dout should be 0 after capturing din = 0");
        $finish;
    end

    // Final reset
    rst = 1; // Assert reset
    #10;
    if (dout !== 0) begin
        $display("FAIL: dout should be 0 when rst is high");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule