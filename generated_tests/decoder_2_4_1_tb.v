`timescale 1ns/1ps

module tb_decoder_2_4;

    reg a;
    reg b;
    reg en;
    wire y0;
    wire y1;
    wire y2;
    wire y3;

    // Instantiate the module under test (uut)
    decoder_2_4 uut (
        .a(a),
        .b(b),
        .en(en),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    initial begin
        // Initialize inputs
        a = 0;
        b = 0;
        en = 0;

        // Test case 1: Enable = 0, all outputs should be 0
        #10;
        en = 0; a = 0; b = 0; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Enable = 1, input = 00
        en = 1; a = 0; b = 0; #10;
        if (y0 !== 1 || y1 !== 0 || y2 !== 0 || y3 !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Enable = 1, input = 01
        a = 0; b = 1; #10;
        if (y0 !== 0 || y1 !== 1 || y2 !== 0 || y3 !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Enable = 1, input = 10
        a = 1; b = 0; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 1 || y3 !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Enable = 1, input = 11
        a = 1; b = 1; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Enable = 0, input = 11
        en = 0; a = 1; b = 1; #10;
        if (y0 !== 0 || y1 !== 0 || y2 !== 0 || y3 !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule