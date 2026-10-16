`timescale 1ns/1ps

module tb_decoder_2_4;

    reg a, b, e;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    decoder_2_4 uut (
        .a(a),
        .b(b),
        .e(e),
        .y(y)
    );

    initial begin
        // Test case 1: Enable low, all outputs should be low
        e = 0; a = 0; b = 0; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", y);

        // Test case 2: Enable high, a=0, b=0, output y[0] should be high
        e = 1; a = 0; b = 0; #10;
        if (y !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", y);

        // Test case 3: Enable high, a=0, b=1, output y[1] should be high
        a = 0; b = 1; #10;
        if (y !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", y);

        // Test case 4: Enable high, a=1, b=0, output y[2] should be high
        a = 1; b = 0; #10;
        if (y !== 4'b0100) $display("FAIL: Test case 4 failed, expected 0100, got %b", y);

        // Test case 5: Enable high, a=1, b=1, output y[3] should be high
        a = 1; b = 1; #10;
        if (y !== 4'b1000) $display("FAIL: Test case 5 failed, expected 1000, got %b", y);

        // Test case 6: Enable low again, all outputs should be low
        e = 0; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 6 failed, expected 0000, got %b", y);

        $display("PASS");
        $finish;
    end

endmodule