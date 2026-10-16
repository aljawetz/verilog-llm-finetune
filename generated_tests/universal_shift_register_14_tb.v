`timescale 1ns/1ps

module tb_universal_shift_register;

reg clk;
reg rst;
reg sin;
reg [1:0] mode;
reg [3:0] data_in;
wire [3:0] out;

// Instantiate the module under test (uut)
universal_shift_register uut (
    .clk(clk),
    .rst(rst),
    .sin(sin),
    .mode(mode),
    .data_in(data_in),
    .out(out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1;
    sin = 0;
    mode = 2'b00;
    data_in = 4'b0000;

    // Release reset
    #10 rst = 0;

    // Test case 1: Hold mode (mode = 00)
    #10;
    if (out !== 4'b0000) begin
        $display("FAIL: Test case 1 failed, expected out = 0000, got out = %b", out);
        $finish;
    end

    // Test case 2: Shift in from left (mode = 01)
    mode = 2'b01; sin = 1; // Shift in 1
    #10;
    if (out !== 4'b1000) begin
        $display("FAIL: Test case 2 failed, expected out = 1000, got out = %b", out);
        $finish;
    end

    // Test case 3: Shift in from right (mode = 10)
    mode = 2'b10; sin = 0; // Shift in 0
    #10;
    if (out !== 4'b0000) begin
        $display("FAIL: Test case 3 failed, expected out = 0000, got out = %b", out);
        $finish;
    end

    // Test case 4: Load data (mode = 11)
    mode = 2'b11; data_in = 4'b1010; // Load 1010
    #10;
    if (out !== 4'b1010) begin
        $display("FAIL: Test case 4 failed, expected out = 1010, got out = %b", out);
        $finish;
    end

    // Test case 5: Shift in from left again (mode = 01)
    mode = 2'b01; sin = 1; // Shift in 1
    #10;
    if (out !== 4'b1101) begin
        $display("FAIL: Test case 5 failed, expected out = 1101, got out = %b", out);
        $finish;
    end

    // Test case 6: Shift in from right again (mode = 10)
    mode = 2'b10; sin = 0; // Shift in 0
    #10;
    if (out !== 4'b1010) begin
        $display("FAIL: Test case 6 failed, expected out = 1010, got out = %b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule