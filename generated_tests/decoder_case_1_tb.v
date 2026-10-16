`timescale 1ns/1ps

module tb_decoder_case;

    reg [2:0] digit;
    wire [7:0] vector;

    // Instantiate the module under test (uut)
    decoder_case uut (
        .digit(digit),
        .vector(vector)
    );

    initial begin
        // Test cases
        digit = 3'd0; #10;
        if (vector !== 8'b00000001) begin
            $display("FAIL: Expected 8'b00000001 for digit 0, got %b", vector);
            $finish;
        end

        digit = 3'd1; #10;
        if (vector !== 8'b00000010) begin
            $display("FAIL: Expected 8'b00000010 for digit 1, got %b", vector);
            $finish;
        end

        digit = 3'd2; #10;
        if (vector !== 8'b00000100) begin
            $display("FAIL: Expected 8'b00000100 for digit 2, got %b", vector);
            $finish;
        end

        digit = 3'd3; #10;
        if (vector !== 8'b00001000) begin
            $display("FAIL: Expected 8'b00001000 for digit 3, got %b", vector);
            $finish;
        end

        digit = 3'd4; #10;
        if (vector !== 8'b00010000) begin
            $display("FAIL: Expected 8'b00010000 for digit 4, got %b", vector);
            $finish;
        end

        digit = 3'd5; #10;
        if (vector !== 8'b00100000) begin
            $display("FAIL: Expected 8'b00100000 for digit 5, got %b", vector);
            $finish;
        end

        digit = 3'd6; #10;
        if (vector !== 8'b01000000) begin
            $display("FAIL: Expected 8'b01000000 for digit 6, got %b", vector);
            $finish;
        end

        digit = 3'd7; #10;
        if (vector !== 8'b10000000) begin
            $display("FAIL: Expected 8'b10000000 for digit 7, got %b", vector);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule