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
            $display("FAIL: Test case 1 failed, expected 000, got %b", out);
            $finish;
        end

        // Test case 2: Only the highest bit is high
        in = 8'b10000000; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Test case 2 failed, expected 111, got %b", out);
            $finish;
        end

        // Test case 3: Middle bit high
        in = 8'b00100000; #10;
        if (out !== 3'b101) begin
            $display("FAIL: Test case 3 failed, expected 101, got %b", out);
            $finish;
        end

        // Test case 4: Lower bit high
        in = 8'b00000010; #10;
        if (out !== 3'b001) begin
            $display("FAIL: Test case 4 failed, expected 001, got %b", out);
            $finish;
        end

        // Test case 5: Multiple bits high, highest should be taken
        in = 8'b01100000; #10;
        if (out !== 3'b110) begin
            $display("FAIL: Test case 5 failed, expected 110, got %b", out);
            $finish;
        end

        // Test case 6: Another multiple bits high
        in = 8'b00001111; #10;
        if (out !== 3'b011) begin
            $display("FAIL: Test case 6 failed, expected 011, got %b", out);
            $finish;
        end

        // Test case 7: Highest bit among multiple high
        in = 8'b11111111; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Test case 7 failed, expected 111, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule