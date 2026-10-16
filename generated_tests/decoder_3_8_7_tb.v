`timescale 1ns/1ps

module tb_decoder_3_8;

    reg [2:0] in;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    decoder_3_8 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        // Test input 3'b000
        in = 3'b000; #10;
        if (out !== 8'b00000001) begin
            $display("FAIL: Test case 3'b000 failed");
            $finish;
        end

        // Test input 3'b001
        in = 3'b001; #10;
        if (out !== 8'b00000010) begin
            $display("FAIL: Test case 3'b001 failed");
            $finish;
        end

        // Test input 3'b010
        in = 3'b010; #10;
        if (out !== 8'b00000100) begin
            $display("FAIL: Test case 3'b010 failed");
            $finish;
        end

        // Test input 3'b011
        in = 3'b011; #10;
        if (out !== 8'b00001000) begin
            $display("FAIL: Test case 3'b011 failed");
            $finish;
        end

        // Test input 3'b100
        in = 3'b100; #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Test case 3'b100 failed");
            $finish;
        end

        // Test input 3'b101
        in = 3'b101; #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Test case 3'b101 failed");
            $finish;
        end

        // Test input 3'b110
        in = 3'b110; #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Test case 3'b110 failed");
            $finish;
        end

        // Test input 3'b111
        in = 3'b111; #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Test case 3'b111 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule