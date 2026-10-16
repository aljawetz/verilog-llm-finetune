`timescale 1ns/1ps

module tb_encoder;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the encoder module
    encoder uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: No inputs high
        in = 8'b00000000; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected 000 for input 00000000, got %b", out);
            $finish;
        end

        // Test case 2: Only the highest bit is high
        in = 8'b10000000; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Expected 111 for input 10000000, got %b", out);
            $finish;
        end

        // Test case 3: Middle bit is high
        in = 8'b00100000; #10;
        if (out !== 3'b101) begin
            $display("FAIL: Expected 101 for input 00100000, got %b", out);
            $finish;
        end

        // Test case 4: Lower bit is high
        in = 8'b00000010; #10;
        if (out !== 3'b001) begin
            $display("FAIL: Expected 001 for input 00000010, got %b", out);
            $finish;
        end

        // Test case 5: Multiple bits high, highest should be selected
        in = 8'b01100000; #10;
        if (out !== 3'b110) begin
            $display("FAIL: Expected 110 for input 01100000, got %b", out);
            $finish;
        end

        // Test case 6: Another multiple bits high
        in = 8'b00001111; #10;
        if (out !== 3'b011) begin
            $display("FAIL: Expected 011 for input 00001111, got %b", out);
            $finish;
        end

        // Test case 7: All bits high
        in = 8'b11111111; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Expected 111 for input 11111111, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule