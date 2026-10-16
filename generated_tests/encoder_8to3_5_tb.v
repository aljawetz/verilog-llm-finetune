`timescale 1ns/1ps

module tb_encoder_8to3;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the encoder module
    encoder_8to3 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Only the highest bit is active
        in = 8'b10000000; // Expected output: 3'b111
        #10;
        if (out !== 3'b111) begin
            $display("FAIL: Test case 1 failed, expected 3'b111 but got %b", out);
            $finish;
        end

        // Test case 2: Second highest bit is active
        in = 8'b01000000; // Expected output: 3'b110
        #10;
        if (out !== 3'b110) begin
            $display("FAIL: Test case 2 failed, expected 3'b110 but got %b", out);
            $finish;
        end

        // Test case 3: Middle bit is active
        in = 8'b00100000; // Expected output: 3'b101
        #10;
        if (out !== 3'b101) begin
            $display("FAIL: Test case 3 failed, expected 3'b101 but got %b", out);
            $finish;
        end

        // Test case 4: Lower bit is active
        in = 8'b00000001; // Expected output: 3'b000
        #10;
        if (out !== 3'b000) begin
            $display("FAIL: Test case 4 failed, expected 3'b000 but got %b", out);
            $finish;
        end

        // Test case 5: Multiple bits active, highest should take precedence
        in = 8'b01100000; // Expected output: 3'b110
        #10;
        if (out !== 3'b110) begin
            $display("FAIL: Test case 5 failed, expected 3'b110 but got %b", out);
            $finish;
        end

        // Test case 6: No bits active
        in = 8'b00000000; // Expected output: 3'bxxx
        #10;
        if (out !== 3'bxxx) begin
            $display("FAIL: Test case 6 failed, expected 3'bxxx but got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule