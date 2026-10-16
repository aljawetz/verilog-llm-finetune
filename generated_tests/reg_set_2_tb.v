`timescale 1ns/1ps

module tb_reg_set;

reg [7:0] D1, D2;
reg clk, rst;
wire [7:0] Q1, Q2;

// Instantiate the module under test (uut)
reg_set uut (
    .Q1(Q1),
    .Q2(Q2),
    .D1(D1),
    .D2(D2),
    .clk(clk),
    .rst(rst)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1; // Assert reset
    D1 = 8'h00;
    D2 = 8'h00;
    #10; // Wait for 10ns

    // Deassert reset
    rst = 0;
    #10;

    // Test case 1: Load values into registers
    D1 = 8'hAA; // 10101010
    D2 = 8'h55; // 01010101
    #10; // Wait for clock edge
    if (Q1 !== 8'hAA || Q2 !== 8'h55) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Change values
    D1 = 8'hFF; // 11111111
    D2 = 8'h00; // 00000000
    #10; // Wait for clock edge
    if (Q1 !== 8'hFF || Q2 !== 8'h00) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Assert reset
    rst = 1; // Assert reset
    #10; // Wait for clock edge
    if (Q1 !== 8'h00 || Q2 !== 8'h00) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Load new values after reset
    rst = 0; // Deassert reset
    D1 = 8'h12; // 00010010
    D2 = 8'h34; // 00110100
    #10; // Wait for clock edge
    if (Q1 !== 8'h12 || Q2 !== 8'h34) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
end

endmodule