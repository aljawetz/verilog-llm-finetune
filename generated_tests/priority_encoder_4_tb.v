`timescale 1ns/1ps

module tb_priority_encoder;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    priority_encoder uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: No inputs active
        in = 8'b00000000; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected 000 for input 00000000, got %b", out);
            $finish;
        end

        // Test case 2: Only bit 1 active
        in = 8'b00000010; #10;
        if (out !== 3'b001) begin
            $display("FAIL: Expected 001 for input 00000010, got %b", out);
            $finish;
        end

        // Test case 3: Only bit 3 active
        in = 8'b00001000; #10;
        if (out !== 3'b011) begin
            $display("FAIL: Expected 011 for input 00001000, got %b", out);
            $finish;
        end

        // Test case 4: Only bit 5 active
        in = 8'b00100000; #10;
        if (out !== 3'b101) begin
            $display("FAIL: Expected 101 for input 00100000, got %b", out);
            $finish;
        end

        // Test case 5: Only bit 7 active
        in = 8'b10000000; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Expected 111 for input 10000000, got %b", out);
            $finish;
        end

        // Test case 6: Multiple bits active (bit 5 and bit 1)
        in = 8'b00100010; #10;
        if (out !== 3'b101) begin
            $display("FAIL: Expected 101 for input 00100010, got %b", out);
            $finish;
        end

        // Test case 7: Multiple bits active (bit 7 and bit 3)
        in = 8'b10001000; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Expected 111 for input 10001000, got %b", out);
            $finish;
        end

        // Test case 8: All bits active
        in = 8'b11111111; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Expected 111 for input 11111111, got %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule