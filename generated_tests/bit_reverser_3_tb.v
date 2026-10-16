`timescale 1ns/1ps

module tb_bit_reverser;

    reg [3:0] in;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    bit_reverser #(.WIDTH(4)) uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Input 0000 should output 0000
        in = 4'b0000; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 2: Input 0001 should output 1000
        in = 4'b0001; #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 2 failed, expected 1000, got %b", out);
            $finish;
        end

        // Test case 3: Input 0010 should output 0100
        in = 4'b0010; #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected 0100, got %b", out);
            $finish;
        end

        // Test case 4: Input 0011 should output 1100
        in = 4'b0011; #10;
        if (out !== 4'b1100) begin
            $display("FAIL: Test case 4 failed, expected 1100, got %b", out);
            $finish;
        end

        // Test case 5: Input 0101 should output 1010
        in = 4'b0101; #10;
        if (out !== 4'b1010) begin
            $display("FAIL: Test case 5 failed, expected 1010, got %b", out);
            $finish;
        end

        // Test case 6: Input 1111 should output 1111
        in = 4'b1111; #10;
        if (out !== 4'b1111) begin
            $display("FAIL: Test case 6 failed, expected 1111, got %b", out);
            $finish;
        end

        // Test case 7: Input 1000 should output 0001
        in = 4'b1000; #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 7 failed, expected 0001, got %b", out);
            $finish;
        end

        // Test case 8: Input 1100 should output 0011
        in = 4'b1100; #10;
        if (out !== 4'b0011) begin
            $display("FAIL: Test case 8 failed, expected 0011, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule