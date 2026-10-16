`timescale 1ns/1ps

module tb_parity_encoder;

    reg [3:0] in;
    wire [1:0] out;

    // Instantiate the module under test
    parity_encoder uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: in = 4'b1000 (should output 11)
        in = 4'b1000; #10;
        if (out !== 2'b11) begin
            $display("FAIL: Expected 11 for input 1000, got %b", out);
            $finish;
        end

        // Test case 2: in = 4'b0100 (should output 10)
        in = 4'b0100; #10;
        if (out !== 2'b10) begin
            $display("FAIL: Expected 10 for input 0100, got %b", out);
            $finish;
        end

        // Test case 3: in = 4'b0010 (should output 01)
        in = 4'b0010; #10;
        if (out !== 2'b01) begin
            $display("FAIL: Expected 01 for input 0010, got %b", out);
            $finish;
        end

        // Test case 4: in = 4'b0000 (should output 00)
        in = 4'b0000; #10;
        if (out !== 2'b00) begin
            $display("FAIL: Expected 00 for input 0000, got %b", out);
            $finish;
        end

        // Test case 5: in = 4'b0011 (should output 01, highest bit is 1)
        in = 4'b0011; #10;
        if (out !== 2'b01) begin
            $display("FAIL: Expected 01 for input 0011, got %b", out);
            $finish;
        end

        // Test case 6: in = 4'b0111 (should output 10, highest bit is 2)
        in = 4'b0111; #10;
        if (out !== 2'b10) begin
            $display("FAIL: Expected 10 for input 0111, got %b", out);
            $finish;
        end

        // Test case 7: in = 4'b1111 (should output 11, highest bit is 3)
        in = 4'b1111; #10;
        if (out !== 2'b11) begin
            $display("FAIL: Expected 11 for input 1111, got %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule