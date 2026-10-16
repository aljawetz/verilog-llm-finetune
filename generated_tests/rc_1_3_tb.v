`timescale 1ns/1ps

module tb_rc_1;

reg clk;
reg rst;
wire [3:0] cnt;

// Instantiate the module under test
rc_1 uut (
    .clk(clk),
    .rst(rst),
    .cnt(cnt)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Check initial value after reset
    if (cnt !== 4'b0001) begin
        $display("FAIL: Initial value after reset is incorrect, got %b", cnt);
        $finish;
    end

    // Perform a few clock cycles and check the output
    #10; // Wait for 1 clock cycle
    if (cnt !== 4'b1000) begin
        $display("FAIL: After 1 clock cycle, expected 1000, got %b", cnt);
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'b0100) begin
        $display("FAIL: After 2 clock cycles, expected 0100, got %b", cnt);
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'b0010) begin
        $display("FAIL: After 3 clock cycles, expected 0010, got %b", cnt);
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'b0001) begin
        $display("FAIL: After 4 clock cycles, expected 0001, got %b", cnt);
        $finish;
    end

    // Test reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Check value after reset again
    if (cnt !== 4'b0001) begin
        $display("FAIL: Value after reset is incorrect, got %b", cnt);
        $finish;
    end

    // Continue testing the rotation
    #10; // Wait for 1 clock cycle
    if (cnt !== 4'b1000) begin
        $display("FAIL: After 1 clock cycle, expected 1000, got %b", cnt);
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'b0100) begin
        $display("FAIL: After 2 clock cycles, expected 0100, got %b", cnt);
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'b0010) begin
        $display("FAIL: After 3 clock cycles, expected 0010, got %b", cnt);
        $finish;
    end

    #10; // Wait for 1 clock cycle
    if (cnt !== 4'b0001) begin
        $display("FAIL: After 4 clock cycles, expected 0001, got %b", cnt);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule