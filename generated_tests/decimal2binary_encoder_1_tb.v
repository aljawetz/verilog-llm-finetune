`timescale 1ns/1ps

module tb_decimal2binary_encoder;

    reg [9:0] Decimal;
    wire [3:0] Binary;

    // Instantiate the module under test (uut)
    decimal2binary_encoder uut (
        .Decimal(Decimal),
        .Binary(Binary)
    );

    initial begin
        // Test cases
        Decimal = 10'b0000000001; #10; // Expect Binary = 4'b0000
        if (Binary !== 4'b0000) begin
            $display("FAIL: Expected 4'b0000 for Decimal = 10'b0000000001, got %b", Binary);
            $finish;
        end

        Decimal = 10'b0000000010; #10; // Expect Binary = 4'b0001
        if (Binary !== 4'b0001) begin
            $display("FAIL: Expected 4'b0001 for Decimal = 10'b0000000010, got %b", Binary);
            $finish;
        end

        Decimal = 10'b0000000100; #10; // Expect Binary = 4'b0010
        if (Binary !== 4'b0010) begin
            $display("FAIL: Expected 4'b0010 for Decimal = 10'b0000000100, got %b", Binary);
            $finish;
        end

        Decimal = 10'b0000001000; #10; // Expect Binary = 4'b0011
        if (Binary !== 4'b0011) begin
            $display("FAIL: Expected 4'b0011 for Decimal = 10'b0000001000, got %b", Binary);
            $finish;
        end

        Decimal = 10'b0000010000; #10; // Expect Binary = 4'b0100
        if (Binary !== 4'b0100) begin
            $display("FAIL: Expected 4'b0100 for Decimal = 10'b0000010000, got %b", Binary);
            $finish;
        end

        Decimal = 10'b0000100000; #10; // Expect Binary = 4'b0101
        if (Binary !== 4'b0101) begin
            $display("FAIL: Expected 4'b0101 for Decimal = 10'b0000100000, got %b", Binary);
            $finish;
        end

        Decimal = 10'b0001000000; #10; // Expect Binary = 4'b0110
        if (Binary !== 4'b0110) begin
            $display("FAIL: Expected 4'b0110 for Decimal = 10'b0001000000, got %b", Binary);
            $finish;
        end

        Decimal = 10'b0010000000; #10; // Expect Binary = 4'b0111
        if (Binary !== 4'b0111) begin
            $display("FAIL: Expected 4'b0111 for Decimal = 10'b0010000000, got %b", Binary);
            $finish;
        end

        Decimal = 10'b0100000000; #10; // Expect Binary = 4'b1000
        if (Binary !== 4'b1000) begin
            $display("FAIL: Expected 4'b1000 for Decimal = 10'b0100000000, got %b", Binary);
            $finish;
        end

        Decimal = 10'b1000000000; #10; // Expect Binary = 4'b1001
        if (Binary !== 4'b1001) begin
            $display("FAIL: Expected 4'b1001 for Decimal = 10'b1000000000, got %b", Binary);
            $finish;
        end

        // Test default case
        Decimal = 10'b0000000000; #10; // Expect Binary = 4'b0000 (default case)
        if (Binary !== 4'b0000) begin
            $display("FAIL: Expected 4'b0000 for Decimal = 10'b0000000000, got %b", Binary);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule