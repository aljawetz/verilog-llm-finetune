`timescale 1ns/1ps

module tb_FS_BL;

reg a, b, c;
wire ba, d;

// Instantiate the module under test
FS_BL uut (
    .a(a),
    .b(b),
    .c(c),
    .ba(ba),
    .d(d)
);

initial begin
    // Test sequence
    // Test case 1: a=0, b=0, c=0
    a = 0; b = 0; c = 0; #10;
    if (ba !== 0 || d !== 0) begin
        $display("FAIL: Test case 1 failed (a=0, b=0, c=0)");
        $finish;
    end

    // Test case 2: a=0, b=0, c=1
    a = 0; b = 0; c = 1; #10;
    if (ba !== 1 || d !== 1) begin
        $display("FAIL: Test case 2 failed (a=0, b=0, c=1)");
        $finish;
    end

    // Test case 3: a=0, b=1, c=0
    a = 0; b = 1; c = 0; #10;
    if (ba !== 1 || d !== 1) begin
        $display("FAIL: Test case 3 failed (a=0, b=1, c=0)");
        $finish;
    end

    // Test case 4: a=0, b=1, c=1
    a = 0; b = 1; c = 1; #10;
    if (ba !== 1 || d !== 0) begin
        $display("FAIL: Test case 4 failed (a=0, b=1, c=1)");
        $finish;
    end

    // Test case 5: a=1, b=0, c=0
    a = 1; b = 0; c = 0; #10;
    if (ba !== 0 || d !== 1) begin
        $display("FAIL: Test case 5 failed (a=1, b=0, c=0)");
        $finish;
    end

    // Test case 6: a=1, b=0, c=1
    a = 1; b = 0; c = 1; #10;
    if (ba !== 0 || d !== 0) begin
        $display("FAIL: Test case 6 failed (a=1, b=0, c=1)");
        $finish;
    end

    // Test case 7: a=1, b=1, c=0
    a = 1; b = 1; c = 0; #10;
    if (ba !== 0 || d !== 0) begin
        $display("FAIL: Test case 7 failed (a=1, b=1, c=0)");
        $finish;
    end

    // Test case 8: a=1, b=1, c=1
    a = 1; b = 1; c = 1; #10;
    if (ba !== 1 || d !== 1) begin
        $display("FAIL: Test case 8 failed (a=1, b=1, c=1)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule