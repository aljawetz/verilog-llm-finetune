`timescale 1ns/1ps

module tb_decoder24;

reg a, b, en;
wire i0, i1, i2, i3;

// Instantiate the module under test
decoder24 uut (
    .a(a),
    .b(b),
    .en(en),
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3)
);

initial begin
    // Test case 1: en = 0, should output all 0s
    en = 0; a = 0; b = 0; #10;
    if (i0 !== 0 || i1 !== 0 || i2 !== 0 || i3 !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: en = 1, a = 0, b = 0, should output i0 = 1
    en = 1; a = 0; b = 0; #10;
    if (i0 !== 1 || i1 !== 0 || i2 !== 0 || i3 !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: en = 1, a = 0, b = 1, should output i1 = 1
    en = 1; a = 0; b = 1; #10;
    if (i0 !== 0 || i1 !== 1 || i2 !== 0 || i3 !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: en = 1, a = 1, b = 0, should output i2 = 1
    en = 1; a = 1; b = 0; #10;
    if (i0 !== 0 || i1 !== 0 || i2 !== 1 || i3 !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: en = 1, a = 1, b = 1, should output i3 = 1
    en = 1; a = 1; b = 1; #10;
    if (i0 !== 0 || i1 !== 0 || i2 !== 0 || i3 !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule