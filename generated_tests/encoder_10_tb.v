`timescale 1ns/1ps

module tb_encoder;

    reg [7:0] i;
    wire [2:0] y;

    // Instantiate the encoder module
    encoder uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: First high bit at position 0
        i = 8'b00000001; #10;
        if (y !== 3'b000) begin
            $display("FAIL: Expected 000 for input 00000001, got %b", y);
            $finish;
        end

        // Test case 2: First high bit at position 1
        i = 8'b00000010; #10;
        if (y !== 3'b001) begin
            $display("FAIL: Expected 001 for input 00000010, got %b", y);
            $finish;
        end

        // Test case 3: First high bit at position 3
        i = 8'b00001000; #10;
        if (y !== 3'b011) begin
            $display("FAIL: Expected 011 for input 00001000, got %b", y);
            $finish;
        end

        // Test case 4: First high bit at position 5
        i = 8'b00100000; #10;
        if (y !== 3'b101) begin
            $display("FAIL: Expected 101 for input 00100000, got %b", y);
            $finish;
        end

        // Test case 5: No high bits
        i = 8'b00000000; #10;
        if (y !== 3'b111) begin
            $display("FAIL: Expected 111 for input 00000000, got %b", y);
            $finish;
        end

        // Test case 6: First high bit at position 6
        i = 8'b01000000; #10;
        if (y !== 3'b110) begin
            $display("FAIL: Expected 110 for input 01000000, got %b", y);
            $finish;
        end

        // Test case 7: First high bit at position 4
        i = 8'b00010000; #10;
        if (y !== 3'b100) begin
            $display("FAIL: Expected 100 for input 00010000, got %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule