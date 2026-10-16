`timescale 1ns/1ps

module tb_decoder2to4;

    reg [1:0] a;
    reg e;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    decoder2to4 uut (
        .a(a),
        .e(e),
        .y(y)
    );

    initial begin
        // Test case 1: Enable = 0, all outputs should be 0
        e = 0; a = 2'b00; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", y);

        // Test case 2: Enable = 1, a = 00, output should be 0001
        e = 1; a = 2'b00; #10;
        if (y !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", y);

        // Test case 3: Enable = 1, a = 01, output should be 0010
        e = 1; a = 2'b01; #10;
        if (y !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", y);

        // Test case 4: Enable = 1, a = 10, output should be 0100
        e = 1; a = 2'b10; #10;
        if (y !== 4'b0100) $display("FAIL: Test case 4 failed, expected 0100, got %b", y);

        // Test case 5: Enable = 1, a = 11, output should be 1000
        e = 1; a = 2'b11; #10;
        if (y !== 4'b1000) $display("FAIL: Test case 5 failed, expected 1000, got %b", y);

        // Test case 6: Enable = 0, a = 11, all outputs should be 0
        e = 0; a = 2'b11; #10;
        if (y !== 4'b0000) $display("FAIL: Test case 6 failed, expected 0000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule