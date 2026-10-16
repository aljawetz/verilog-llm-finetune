`timescale 1ns/1ps

module tb_decoder;

reg a;
reg b;
wire d0;
wire d1;
wire d2;
wire d3;

// Instantiate the decoder module
decoder uut (
    .a(a),
    .b(b),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
);

initial begin
    // Test case 1: a=0, b=0
    a = 0; b = 0; #10;
    if (d0 !== 1 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 1 failed (a=0, b=0)");
        $finish;
    end

    // Test case 2: a=0, b=1
    a = 0; b = 1; #10;
    if (d0 !== 0 || d1 !== 1 || d2 !== 0 || d3 !== 0) begin
        $display("FAIL: Test case 2 failed (a=0, b=1)");
        $finish;
    end

    // Test case 3: a=1, b=0
    a = 1; b = 0; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 1 || d3 !== 0) begin
        $display("FAIL: Test case 3 failed (a=1, b=0)");
        $finish;
    end

    // Test case 4: a=1, b=1
    a = 1; b = 1; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 1) begin
        $display("FAIL: Test case 4 failed (a=1, b=1)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule