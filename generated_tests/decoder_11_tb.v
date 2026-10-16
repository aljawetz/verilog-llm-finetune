`timescale 1ns/1ps

module tb_decoder;

reg a, b, e;
wire d0, d1, d2, d3;

// Instantiate the module under test (uut)
decoder uut (
    .a(a),
    .b(b),
    .e(e),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
);

initial begin
    // Initialize inputs
    a = 0; b = 0; e = 0;

    // Test case 1: Enable low, all outputs should be low
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Enable high, a=0, b=0 -> d0 should be high
    e = 1; a = 0; b = 0;
    #10;
    if (d0 !== 1 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Enable high, a=0, b=1 -> d1 should be high
    a = 0; b = 1;
    #10;
    if (d0 !== 0 || d1 !== 1 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Enable high, a=1, b=0 -> d2 should be high
    a = 1; b = 0;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 1 || d3 !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Enable high, a=1, b=1 -> d3 should be high
    a = 1; b = 1;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Enable low again, all outputs should be low
    e = 0; a = 0; b = 0;
    #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule