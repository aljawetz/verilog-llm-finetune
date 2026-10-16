`timescale 1ns/1ps

module tb_power_k_mux;

parameter WIDTH = 16;
parameter ROUN_WIDTH = 0;
parameter LOG2_WIDTH = 4;

reg [WIDTH + ROUN_WIDTH - 1:0] IN;
reg [LOG2_WIDTH - 1:0] K;
wire [2 * WIDTH - 1:0] OUT_2K;

// Instantiate the module under test
power_k_mux #(WIDTH, ROUN_WIDTH, LOG2_WIDTH) uut (
    .IN(IN),
    .K(K),
    .OUT_2K(OUT_2K)
);

// Test procedure
initial begin
    // Test case 1: K = 0
    IN = 16'h0001; K = 4'd0; #10;
    if (OUT_2K !== 16'h0001) $display("FAIL: Test case 1 failed for IN=0x0001, K=0");

    // Test case 2: K = 1
    IN = 16'h0001; K = 4'd1; #10;
    if (OUT_2K !== 16'h0002) $display("FAIL: Test case 2 failed for IN=0x0001, K=1");

    // Test case 3: K = 2
    IN = 16'h0001; K = 4'd2; #10;
    if (OUT_2K !== 16'h0004) $display("FAIL: Test case 3 failed for IN=0x0001, K=2");

    // Test case 4: K = 3
    IN = 16'h0001; K = 4'd3; #10;
    if (OUT_2K !== 16'h0008) $display("FAIL: Test case 4 failed for IN=0x0001, K=3");

    // Test case 5: K = 4
    IN = 16'h0001; K = 4'd4; #10;
    if (OUT_2K !== 16'h0010) $display("FAIL: Test case 5 failed for IN=0x0001, K=4");

    // Test case 6: K = 15 (maximum shift)
    IN = 16'h0001; K = 4'd15; #10;
    if (OUT_2K !== 16'h8000) $display("FAIL: Test case 6 failed for IN=0x0001, K=15");

    // Test case 7: K = 0 with maximum input
    IN = 16'hFFFF; K = 4'd0; #10;
    if (OUT_2K !== 16'hFFFF) $display("FAIL: Test case 7 failed for IN=0xFFFF, K=0");

    // Test case 8: K = 1 with maximum input
    IN = 16'hFFFF; K = 4'd1; #10;
    if (OUT_2K !== 16'hFFFF << 1) $display("FAIL: Test case 8 failed for IN=0xFFFF, K=1");

    // Test case 9: K = 15 with maximum input
    IN = 16'hFFFF; K = 4'd15; #10;
    if (OUT_2K !== 16'hFFFF << 15) $display("FAIL: Test case 9 failed for IN=0xFFFF, K=15");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule