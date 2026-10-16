`timescale 1ns/1ps

module tb_demux_1_8;

reg din;
reg [2:0] sel;
wire [7:0] y;

// Instantiate the module under test
demux_1_8 uut (
    .din(din),
    .sel(sel),
    .y(y)
);

// Test procedure
initial begin
    // Initialize inputs
    din = 0;
    sel = 3'b000;

    // Test all selections
    din = 1; // Set input high

    // Test case for sel = 000
    sel = 3'b000; #10;
    if (y !== 8'b00000001) begin
        $display("FAIL: sel=000, expected y=00000001, got y=%b", y);
        $finish;
    end

    // Test case for sel = 001
    sel = 3'b001; #10;
    if (y !== 8'b00000010) begin
        $display("FAIL: sel=001, expected y=00000010, got y=%b", y);
        $finish;
    end

    // Test case for sel = 010
    sel = 3'b010; #10;
    if (y !== 8'b00000100) begin
        $display("FAIL: sel=010, expected y=00000100, got y=%b", y);
        $finish;
    end

    // Test case for sel = 011
    sel = 3'b011; #10;
    if (y !== 8'b00001000) begin
        $display("FAIL: sel=011, expected y=00001000, got y=%b", y);
        $finish;
    end

    // Test case for sel = 100
    sel = 3'b100; #10;
    if (y !== 8'b00010000) begin
        $display("FAIL: sel=100, expected y=00010000, got y=%b", y);
        $finish;
    end

    // Test case for sel = 101
    sel = 3'b101; #10;
    if (y !== 8'b00100000) begin
        $display("FAIL: sel=101, expected y=00100000, got y=%b", y);
        $finish;
    end

    // Test case for sel = 110
    sel = 3'b110; #10;
    if (y !== 8'b01000000) begin
        $display("FAIL: sel=110, expected y=01000000, got y=%b", y);
        $finish;
    end

    // Test case for sel = 111
    sel = 3'b111; #10;
    if (y !== 8'b10000000) begin
        $display("FAIL: sel=111, expected y=10000000, got y=%b", y);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule