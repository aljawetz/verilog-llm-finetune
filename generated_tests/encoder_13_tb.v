`timescale 1ns/1ps

module tb_encoder;
    reg en;
    reg [7:0] din;
    wire [2:0] dout;

    // Instantiate the encoder module
    encoder uut (
        .en(en),
        .din(din),
        .dout(dout)
    );

    initial begin
        // Test case 1: Disabled encoder
        en = 0; din = 8'b00000000; #10;
        if (dout !== 3'b000) begin
            $display("FAIL: Expected dout = 000 when en = 0");
            $finish;
        end

        // Test case 2: Valid input 1
        en = 1; din = 8'b00000001; #10;
        if (dout !== 3'b000) begin
            $display("FAIL: Expected dout = 000 for din = 00000001");
            $finish;
        end

        // Test case 3: Valid input 2
        din = 8'b00000010; #10;
        if (dout !== 3'b001) begin
            $display("FAIL: Expected dout = 001 for din = 00000010");
            $finish;
        end

        // Test case 4: Valid input 4
        din = 8'b00000100; #10;
        if (dout !== 3'b010) begin
            $display("FAIL: Expected dout = 010 for din = 00000100");
            $finish;
        end

        // Test case 5: Valid input 8
        din = 8'b00001000; #10;
        if (dout !== 3'b011) begin
            $display("FAIL: Expected dout = 011 for din = 00001000");
            $finish;
        end

        // Test case 6: Valid input 16
        din = 8'b00010000; #10;
        if (dout !== 3'b100) begin
            $display("FAIL: Expected dout = 100 for din = 00010000");
            $finish;
        end

        // Test case 7: Valid input 32
        din = 8'b00100000; #10;
        if (dout !== 3'b101) begin
            $display("FAIL: Expected dout = 101 for din = 00100000");
            $finish;
        end

        // Test case 8: Valid input 64
        din = 8'b01000000; #10;
        if (dout !== 3'b110) begin
            $display("FAIL: Expected dout = 110 for din = 01000000");
            $finish;
        end

        // Test case 9: Valid input 128
        din = 8'b10000000; #10;
        if (dout !== 3'b111) begin
            $display("FAIL: Expected dout = 111 for din = 10000000");
            $finish;
        end

        // Test case 10: Invalid input
        din = 8'b00000000; #10;
        if (dout !== 3'b000) begin
            $display("FAIL: Expected dout = 000 for invalid input");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end
endmodule