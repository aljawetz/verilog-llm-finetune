`timescale 1ns/1ps

module tb_half_sub;

reg a;
reg b;
wire diff;
wire brow;

// Instantiate the half_sub module
half_sub uut (
    .a(a),
    .b(b),
    .diff(diff),
    .brow(brow)
);

initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (diff !== 0 || brow !== 0) begin
        $display("FAIL: Test case 1 failed (a=0, b=0)");
        $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (diff !== 1 || brow !== 1) begin
        $display("FAIL: Test case 2 failed (a=0, b=1)");
        $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (diff !== 1 || brow !== 0) begin
        $display("FAIL: Test case 3 failed (a=1, b=0)");
        $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (diff !== 0 || brow !== 0) begin
        $display("FAIL: Test case 4 failed (a=1, b=1)");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule