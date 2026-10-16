`timescale 1ns/1ps

module tb_decoder_2to4;

    reg a;
    reg b;
    reg en;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    decoder_2to4 uut (
        .a(a),
        .b(b),
        .en(en),
        .out(out)
    );

    initial begin
        // Test case 1: Enable low, all outputs should be 0
        en = 0; a = 0; b = 0; #10;
        if (out !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", out);

        // Test case 2: en = 1, a = 0, b = 0, output should be 0001
        en = 1; a = 0; b = 0; #10;
        if (out !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", out);

        // Test case 3: en = 1, a = 0, b = 1, output should be 0010
        a = 0; b = 1; #10;
        if (out !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", out);

        // Test case 4: en = 1, a = 1, b = 0, output should be 0100
        a = 1; b = 0; #10;
        if (out !== 4'b0100) $display("FAIL: Test case 4 failed, expected 0100, got %b", out);

        // Test case 5: en = 1, a = 1, b = 1, output should be 1000
        a = 1; b = 1; #10;
        if (out !== 4'b1000) $display("FAIL: Test case 5 failed, expected 1000, got %b", out);

        // Test case 6: Enable low again, all outputs should be 0
        en = 0; a = 1; b = 1; #10;
        if (out !== 4'b0000) $display("FAIL: Test case 6 failed, expected 0000, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule