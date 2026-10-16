`timescale 1ns/1ps

module tb_decimal2binaryencoder;

    reg [3:0] decimal;
    wire [3:0] binary;

    // Instantiate the module under test (uut)
    decimal2binaryencoder uut (
        .decimal(decimal),
        .binary(binary)
    );

    initial begin
        // Test cases
        decimal = 4'd0; #10;
        if (binary !== 4'b0000) begin
            $display("FAIL: Expected 0000 for input 0, got %b", binary);
            $finish;
        end

        decimal = 4'd1; #10;
        if (binary !== 4'b0001) begin
            $display("FAIL: Expected 0001 for input 1, got %b", binary);
            $finish;
        end

        decimal = 4'd2; #10;
        if (binary !== 4'b0010) begin
            $display("FAIL: Expected 0010 for input 2, got %b", binary);
            $finish;
        end

        decimal = 4'd3; #10;
        if (binary !== 4'b0011) begin
            $display("FAIL: Expected 0011 for input 3, got %b", binary);
            $finish;
        end

        decimal = 4'd4; #10;
        if (binary !== 4'b0100) begin
            $display("FAIL: Expected 0100 for input 4, got %b", binary);
            $finish;
        end

        decimal = 4'd5; #10;
        if (binary !== 4'b0101) begin
            $display("FAIL: Expected 0101 for input 5, got %b", binary);
            $finish;
        end

        decimal = 4'd6; #10;
        if (binary !== 4'b0110) begin
            $display("FAIL: Expected 0110 for input 6, got %b", binary);
            $finish;
        end

        decimal = 4'd7; #10;
        if (binary !== 4'b0111) begin
            $display("FAIL: Expected 0111 for input 7, got %b", binary);
            $finish;
        end

        decimal = 4'd8; #10;
        if (binary !== 4'b1000) begin
            $display("FAIL: Expected 1000 for input 8, got %b", binary);
            $finish;
        end

        decimal = 4'd9; #10;
        if (binary !== 4'b1001) begin
            $display("FAIL: Expected 1001 for input 9, got %b", binary);
            $finish;
        end

        decimal = 4'd10; #10; // Undefined input
        if (binary !== 4'b0000) begin
            $display("FAIL: Expected 0000 for undefined input 10, got %b", binary);
            $finish;
        end

        decimal = 4'd15; #10; // Undefined input
        if (binary !== 4'b0000) begin
            $display("FAIL: Expected 0000 for undefined input 15, got %b", binary);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule