`timescale 1ns/1ps

module tb_demux_1_4;

reg din;
reg [1:0] sel;
wire [3:0] y;

// Instantiate the module under test (uut)
demux_1_4 uut (
    .din(din),
    .sel(sel),
    .y(y)
);

// Test sequence
initial begin
    // Test case 1: sel = 00, din = 1
    din = 1;
    sel = 2'b00;
    #10;
    if (y !== 4'b0001) $display("FAIL: Test case 1 failed, expected y = 0001, got y = %b", y);

    // Test case 2: sel = 01, din = 1
    din = 1;
    sel = 2'b01;
    #10;
    if (y !== 4'b0010) $display("FAIL: Test case 2 failed, expected y = 0010, got y = %b", y);

    // Test case 3: sel = 10, din = 1
    din = 1;
    sel = 2'b10;
    #10;
    if (y !== 4'b0100) $display("FAIL: Test case 3 failed, expected y = 0100, got y = %b", y);

    // Test case 4: sel = 11, din = 1
    din = 1;
    sel = 2'b11;
    #10;
    if (y !== 4'b1000) $display("FAIL: Test case 4 failed, expected y = 1000, got y = %b", y);

    // Test case 5: sel = 00, din = 0
    din = 0;
    sel = 2'b00;
    #10;
    if (y !== 4'b0000) $display("FAIL: Test case 5 failed, expected y = 0000, got y = %b", y);

    // Test case 6: sel = 01, din = 0
    din = 0;
    sel = 2'b01;
    #10;
    if (y !== 4'b0000) $display("FAIL: Test case 6 failed, expected y = 0000, got y = %b", y);

    // Test case 7: sel = 10, din = 0
    din = 0;
    sel = 2'b10;
    #10;
    if (y !== 4'b0000) $display("FAIL: Test case 7 failed, expected y = 0000, got y = %b", y);

    // Test case 8: sel = 11, din = 0
    din = 0;
    sel = 2'b11;
    #10;
    if (y !== 4'b0000) $display("FAIL: Test case 8 failed, expected y = 0000, got y = %b", y);

    $display("PASS");
    $finish;
end

endmodule