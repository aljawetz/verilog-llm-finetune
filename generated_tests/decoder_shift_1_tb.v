`timescale 1ns/1ps

module tb_decoder_shift;

    reg [2:0] digit;
    wire [7:0] vector;

    // Instantiate the module under test (uut)
    decoder_shift uut (
        .digit(digit),
        .vector(vector)
    );

    initial begin
        // Test case 1: digit = 0
        digit = 3'b000; #10;
        if (vector !== 8'b00000001) begin
            $display("FAIL: Expected 8'b00000001 for digit 0, got %b", vector);
            $finish;
        end

        // Test case 2: digit = 1
        digit = 3'b001; #10;
        if (vector !== 8'b00000010) begin
            $display("FAIL: Expected 8'b00000010 for digit 1, got %b", vector);
            $finish;
        end

        // Test case 3: digit = 2
        digit = 3'b010; #10;
        if (vector !== 8'b00000100) begin
            $display("FAIL: Expected 8'b00000100 for digit 2, got %b", vector);
            $finish;
        end

        // Test case 4: digit = 3
        digit = 3'b011; #10;
        if (vector !== 8'b00001000) begin
            $display("FAIL: Expected 8'b00001000 for digit 3, got %b", vector);
            $finish;
        end

        // Test case 5: digit = 4
        digit = 3'b100; #10;
        if (vector !== 8'b00010000) begin
            $display("FAIL: Expected 8'b00010000 for digit 4, got %b", vector);
            $finish;
        end

        // Test case 6: digit = 5
        digit = 3'b101; #10;
        if (vector !== 8'b00100000) begin
            $display("FAIL: Expected 8'b00100000 for digit 5, got %b", vector);
            $finish;
        end

        // Test case 7: digit = 6
        digit = 3'b110; #10;
        if (vector !== 8'b01000000) begin
            $display("FAIL: Expected 8'b01000000 for digit 6, got %b", vector);
            $finish;
        end

        // Test case 8: digit = 7
        digit = 3'b111; #10;
        if (vector !== 8'b10000000) begin
            $display("FAIL: Expected 8'b10000000 for digit 7, got %b", vector);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule