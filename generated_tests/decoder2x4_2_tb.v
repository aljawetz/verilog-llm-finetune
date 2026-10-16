`timescale 1ns/1ps

module tb_decoder2x4;

    reg [1:0] in;
    reg enable;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    decoder2x4 uut (
        .in(in),
        .enable(enable),
        .out(out)
    );

    initial begin
        // Initialize inputs
        in = 2'b00;
        enable = 0;

        // Test case 1: Enable is low, all outputs should be low
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 2: Enable is high, in = 00, out should be 0001
        enable = 1;
        in = 2'b00;
        #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected 0001, got %b", out);
            $finish;
        end

        // Test case 3: Enable is high, in = 01, out should be 0010
        in = 2'b01;
        #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 3 failed, expected 0010, got %b", out);
            $finish;
        end

        // Test case 4: Enable is high, in = 10, out should be 0100
        in = 2'b10;
        #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 4 failed, expected 0100, got %b", out);
            $finish;
        end

        // Test case 5: Enable is high, in = 11, out should be 1000
        in = 2'b11;
        #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 5 failed, expected 1000, got %b", out);
            $finish;
        end

        // Test case 6: Enable is low again, all outputs should be low
        enable = 0;
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected 0000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule