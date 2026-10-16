`timescale 1ns/1ps

module tb_Enco8x3;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the module under test
    Enco8x3 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Valid one-hot input
        in = 8'b00000001; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected 3'b000 for input 8'b00000001, got %b", out);
            $finish;
        end

        // Test case 2: Valid one-hot input
        in = 8'b00000010; #10;
        if (out !== 3'b001) begin
            $display("FAIL: Expected 3'b001 for input 8'b00000010, got %b", out);
            $finish;
        end

        // Test case 3: Valid one-hot input
        in = 8'b00000100; #10;
        if (out !== 3'b010) begin
            $display("FAIL: Expected 3'b010 for input 8'b00000100, got %b", out);
            $finish;
        end

        // Test case 4: Valid one-hot input
        in = 8'b00001000; #10;
        if (out !== 3'b011) begin
            $display("FAIL: Expected 3'b011 for input 8'b00001000, got %b", out);
            $finish;
        end

        // Test case 5: Valid one-hot input
        in = 8'b00010000; #10;
        if (out !== 3'b100) begin
            $display("FAIL: Expected 3'b100 for input 8'b00010000, got %b", out);
            $finish;
        end

        // Test case 6: Valid one-hot input
        in = 8'b00100000; #10;
        if (out !== 3'b101) begin
            $display("FAIL: Expected 3'b101 for input 8'b00100000, got %b", out);
            $finish;
        end

        // Test case 7: Valid one-hot input
        in = 8'b01000000; #10;
        if (out !== 3'b110) begin
            $display("FAIL: Expected 3'b110 for input 8'b01000000, got %b", out);
            $finish;
        end

        // Test case 8: Valid one-hot input
        in = 8'b10000000; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Expected 3'b111 for input 8'b10000000, got %b", out);
            $finish;
        end

        // Test case 9: Invalid input (no high bit)
        in = 8'b00000000; #10;
        if (out !== 3'bzzz) begin
            $display("FAIL: Expected 3'bzzz for input 8'b00000000, got %b", out);
            $finish;
        end

        // Test case 10: Invalid input (multiple high bits)
        in = 8'b00000011; #10;
        if (out !== 3'bzzz) begin
            $display("FAIL: Expected 3'bzzz for input 8'b00000011, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule