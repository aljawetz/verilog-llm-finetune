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
        // Test case 1: en = 0, should output 0000
        en = 0; a = 0; b = 0; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 2: en = 1, a = 0, b = 0, should output 0001
        en = 1; a = 0; b = 0; #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected 0001, got %b", out);
            $finish;
        end

        // Test case 3: en = 1, a = 0, b = 1, should output 0010
        en = 1; a = 0; b = 1; #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 3 failed, expected 0010, got %b", out);
            $finish;
        end

        // Test case 4: en = 1, a = 1, b = 0, should output 0100
        en = 1; a = 1; b = 0; #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 4 failed, expected 0100, got %b", out);
            $finish;
        end

        // Test case 5: en = 1, a = 1, b = 1, should output 1000
        en = 1; a = 1; b = 1; #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 5 failed, expected 1000, got %b", out);
            $finish;
        end

        // Test case 6: en = 0, a = 1, b = 1, should output 0000
        en = 0; a = 1; b = 1; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected 0000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule