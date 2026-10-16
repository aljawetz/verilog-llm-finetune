`timescale 1ns/1ps

module tb_Bcd_to_Dec;

    reg [3:0] a;
    wire [9:0] y;

    // Instantiate the module under test
    Bcd_to_Dec uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test cases for BCD inputs
        // Expected outputs are one-hot encoded values corresponding to the BCD input
        // BCD 0 -> 0000000001
        a = 4'b0000; #10;
        if (y !== 10'b0000000001) begin
            $display("FAIL: Expected 0000000001 for input 0000, got %b", y);
            $finish;
        end

        // BCD 1 -> 0000000010
        a = 4'b0001; #10;
        if (y !== 10'b0000000010) begin
            $display("FAIL: Expected 0000000010 for input 0001, got %b", y);
            $finish;
        end

        // BCD 2 -> 0000000100
        a = 4'b0010; #10;
        if (y !== 10'b0000000100) begin
            $display("FAIL: Expected 0000000100 for input 0010, got %b", y);
            $finish;
        end

        // BCD 3 -> 0000001000
        a = 4'b0011; #10;
        if (y !== 10'b0000001000) begin
            $display("FAIL: Expected 0000001000 for input 0011, got %b", y);
            $finish;
        end

        // BCD 4 -> 0000010000
        a = 4'b0100; #10;
        if (y !== 10'b0000010000) begin
            $display("FAIL: Expected 0000010000 for input 0100, got %b", y);
            $finish;
        end

        // BCD 5 -> 0000100000
        a = 4'b0101; #10;
        if (y !== 10'b0000100000) begin
            $display("FAIL: Expected 0000100000 for input 0101, got %b", y);
            $finish;
        end

        // BCD 6 -> 0001000000
        a = 4'b0110; #10;
        if (y !== 10'b0001000000) begin
            $display("FAIL: Expected 0001000000 for input 0110, got %b", y);
            $finish;
        end

        // BCD 7 -> 0010000000
        a = 4'b0111; #10;
        if (y !== 10'b0010000000) begin
            $display("FAIL: Expected 0010000000 for input 0111, got %b", y);
            $finish;
        end

        // BCD 8 -> 0100000000
        a = 4'b1000; #10;
        if (y !== 10'b0100000000) begin
            $display("FAIL: Expected 0100000000 for input 1000, got %b", y);
            $finish;
        end

        // BCD 9 -> 1000000000
        a = 4'b1001; #10;
        if (y !== 10'b1000000000) begin
            $display("FAIL: Expected 1000000000 for input 1001, got %b", y);
            $finish;
        end

        // Invalid BCD input (10) -> should not activate any output
        a = 4'b1010; #10;
        if (y !== 10'b0000000000) begin
            $display("FAIL: Expected 0000000000 for input 1010, got %b", y);
            $finish;
        end

        // Complete all tests
        $display("PASS");
        $finish;
    end

endmodule