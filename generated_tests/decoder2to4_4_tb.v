`timescale 1ns/1ps

module tb_decoder2to4;

    reg [1:0] a;
    reg e;
    wire [3:0] y;

    // Instantiate the module under test
    decoder2to4 uut (
        .a(a),
        .e(e),
        .y(y)
    );

    initial begin
        // Test case 1: Enable low, all outputs should be low
        e = 0; a = 2'b00; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", y);

        // Test case 2: Enable high, input 00, output y0 should be high
        e = 1; a = 2'b00; #10;
        if (y !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", y);

        // Test case 3: Enable high, input 01, output y1 should be high
        a = 2'b01; #10;
        if (y !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", y);

        // Test case 4: Enable high, input 10, output y2 should be high
        a = 2'b10; #10;
        if (y !== 4'b0100) $display("FAIL: Test case 4 failed, expected 0100, got %b", y);

        // Test case 5: Enable high, input 11, output y3 should be high
        a = 2'b11; #10;
        if (y !== 4'b1000) $display("FAIL: Test case 5 failed, expected 1000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule