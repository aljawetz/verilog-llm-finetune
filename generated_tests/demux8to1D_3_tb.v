`timescale 1ns/1ps

module tb_demux8to1D;

reg i;
reg [2:0] s;
wire [7:0] y;

// Instantiate the module under test
demux8to1D uut (
    .y(y),
    .s(s),
    .i(i)
);

initial begin
    // Initialize inputs
    i = 0;
    s = 3'b000;

    // Test case 1: Check output when i=1 and s=000
    i = 1;
    s = 3'b000;
    #10;
    if (y !== 8'b00000001) $display("FAIL: Test case 1 failed");

    // Test case 2: Check output when i=1 and s=001
    s = 3'b001;
    #10;
    if (y !== 8'b00000010) $display("FAIL: Test case 2 failed");

    // Test case 3: Check output when i=1 and s=010
    s = 3'b010;
    #10;
    if (y !== 8'b00000100) $display("FAIL: Test case 3 failed");

    // Test case 4: Check output when i=1 and s=011
    s = 3'b011;
    #10;
    if (y !== 8'b00001000) $display("FAIL: Test case 4 failed");

    // Test case 5: Check output when i=1 and s=100
    s = 3'b100;
    #10;
    if (y !== 8'b00010000) $display("FAIL: Test case 5 failed");

    // Test case 6: Check output when i=1 and s=101
    s = 3'b101;
    #10;
    if (y !== 8'b00100000) $display("FAIL: Test case 6 failed");

    // Test case 7: Check output when i=1 and s=110
    s = 3'b110;
    #10;
    if (y !== 8'b01000000) $display("FAIL: Test case 7 failed");

    // Test case 8: Check output when i=1 and s=111
    s = 3'b111;
    #10;
    if (y !== 8'b10000000) $display("FAIL: Test case 8 failed");

    // Test case 9: Check output when i=0 (should be all zeros)
    i = 0;
    s = 3'b000;
    #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 9 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule