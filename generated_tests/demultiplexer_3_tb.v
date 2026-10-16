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
    // Test case 1: Check d0
    in = 1; y0 = 0; y1 = 0; #10;
    if (d0 !== 1 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Check d1
    in = 1; y0 = 1; y1 = 0; #10;
    if (d0 !== 0 || d1 !== 1 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Check d2
    in = 1; y0 = 0; y1 = 1; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 1 || d3 !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Check d3
    in = 1; y0 = 1; y1 = 1; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Check all outputs when in is 0
    in = 0; y0 = 0; y1 = 0; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Final output if all tests pass
    $display("PASS");
    $finish;
end

endmodule