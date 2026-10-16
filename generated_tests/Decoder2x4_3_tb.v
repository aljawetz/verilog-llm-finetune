`timescale 1ns/1ps

module tb_Decoder2x4;

reg a, b, en;
wire d1, d2, d3, d4;

// Instantiate the Decoder2x4 module
Decoder2x4 uut (
    .a(a),
    .b(b),
    .en(en),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4)
);

initial begin
    // Initialize inputs
    a = 0; b = 0; en = 0;

    // Test case 1: Enable low, all outputs should be low
    #10;
    en = 0; a = 0; b = 0; #10;
    if (d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Enable high, a=0, b=0, d4 should be high
    #10;
    en = 1; a = 0; b = 0; #10;
    if (d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Enable high, a=0, b=1, d3 should be high
    #10;
    a = 0; b = 1; #10;
    if (d1 !== 0 || d2 !== 0 || d3 !== 1 || d4 !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Enable high, a=1, b=0, d2 should be high
    #10;
    a = 1; b = 0; #10;
    if (d1 !== 0 || d2 !== 1 || d3 !== 0 || d4 !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Enable high, a=1, b=1, d1 should be high
    #10;
    a = 1; b = 1; #10;
    if (d1 !== 1 || d2 !== 0 || d3 !== 0 || d4 !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Enable low again, all outputs should be low
    #10;
    en = 0; a = 1; b = 1; #10;
    if (d1 !== 0 || d2 !== 0 || d3 !== 0 || d4 !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule