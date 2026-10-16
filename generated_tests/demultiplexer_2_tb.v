`timescale 1ns/1ps

module tb_demultiplexer;

reg in;
reg y0;
reg y1;
wire d0;
wire d1;
wire d2;
wire d3;

// Instantiate the demultiplexer module
demultiplexer uut (
    .in(in),
    .y0(y0),
    .y1(y1),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
);

initial begin
    // Initialize inputs
    in = 0;
    y0 = 0;
    y1 = 0;

    // Test case 1: in=1, y0=0, y1=0 -> d0 should be 1
    in = 1; y0 = 0; y1 = 0; #10;
    if (d0 !== 1'b1 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: in=1, y0=1, y1=0 -> d1 should be 1
    in = 1; y0 = 1; y1 = 0; #10;
    if (d0 !== 1'b0 || d1 !== 1'b1 || d2 !== 1'b0 || d3 !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: in=1, y0=0, y1=1 -> d2 should be 1
    in = 1; y0 = 0; y1 = 1; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b1 || d3 !== 1'b0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: in=1, y0=1, y1=1 -> d3 should be 1
    in = 1; y0 = 1; y1 = 1; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: in=0, y0=0, y1=0 -> all outputs should be 0
    in = 0; y0 = 0; y1 = 0; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: in=0, y0=1, y1=0 -> all outputs should be 0
    in = 0; y0 = 1; y1 = 0; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: in=0, y0=0, y1=1 -> all outputs should be 0
    in = 0; y0 = 0; y1 = 1; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: in=0, y0=1, y1=1 -> all outputs should be 0
    in = 0; y0 = 1; y1 = 1; #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule