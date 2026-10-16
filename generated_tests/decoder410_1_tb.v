`timescale 1ns/1ps

module tb_decoder410;

    reg [3:0] in;
    wire [9:0] out;

    // Instantiate the module under test (uut)
    decoder410 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        // Test for input 0
        in = 4'd0; #10;
        if (out !== 10'd1) begin
            $display("FAIL: Expected out for input 0 is 1, got %d", out);
            $finish;
        end

        // Test for input 1
        in = 4'd1; #10;
        if (out !== 10'd2) begin
            $display("FAIL: Expected out for input 1 is 2, got %d", out);
            $finish;
        end

        // Test for input 2
        in = 4'd2; #10;
        if (out !== 10'd4) begin
            $display("FAIL: Expected out for input 2 is 4, got %d", out);
            $finish;
        end

        // Test for input 3
        in = 4'd3; #10;
        if (out !== 10'd8) begin
            $display("FAIL: Expected out for input 3 is 8, got %d", out);
            $finish;
        end

        // Test for input 4
        in = 4'd4; #10;
        if (out !== 10'd16) begin
            $display("FAIL: Expected out for input 4 is 16, got %d", out);
            $finish;
        end

        // Test for input 5
        in = 4'd5; #10;
        if (out !== 10'd32) begin
            $display("FAIL: Expected out for input 5 is 32, got %d", out);
            $finish;
        end

        // Test for input 6
        in = 4'd6; #10;
        if (out !== 10'd64) begin
            $display("FAIL: Expected out for input 6 is 64, got %d", out);
            $finish;
        end

        // Test for input 7
        in = 4'd7; #10;
        if (out !== 10'd128) begin
            $display("FAIL: Expected out for input 7 is 128, got %d", out);
            $finish;
        end

        // Test for input 8
        in = 4'd8; #10;
        if (out !== 10'd256) begin
            $display("FAIL: Expected out for input 8 is 256, got %d", out);
            $finish;
        end

        // Test for input 9
        in = 4'd9; #10;
        if (out !== 10'd512) begin
            $display("FAIL: Expected out for input 9 is 512, got %d", out);
            $finish;
        end

        // Test for input 10 (out of range)
        in = 4'd10; #10;
        if (out !== 10'd0) begin
            $display("FAIL: Expected out for input 10 is 0, got %d", out);
            $finish;
        end

        // Test for input 15 (out of range)
        in = 4'd15; #10;
        if (out !== 10'd0) begin
            $display("FAIL: Expected out for input 15 is 0, got %d", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule