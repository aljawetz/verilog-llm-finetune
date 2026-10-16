`timescale 1ns/1ps

module tb_bit_reverser;

    reg [3:0] in;
    wire [3:0] out;

    // Instantiate the module under test
    bit_reverser uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Reverse 0000
        in = 4'b0000; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 2: Reverse 0001
        in = 4'b0001; #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 2 failed, expected 1000, got %b", out);
            $finish;
        end

        // Test case 3: Reverse 0010
        in = 4'b0010; #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected 0100, got %b", out);
            $finish;
        end

        // Test case 4: Reverse 0100
        in = 4'b0100; #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 4 failed, expected 0010, got %b", out);
            $finish;
        end

        // Test case 5: Reverse 1000
        in = 4'b1000; #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 5 failed, expected 0001, got %b", out);
            $finish;
        end

        // Test case 6: Reverse 1111
        in = 4'b1111; #10;
        if (out !== 4'b1111) begin
            $display("FAIL: Test case 6 failed, expected 1111, got %b", out);
            $finish;
        end

        // Test case 7: Reverse 1010
        in = 4'b1010; #10;
        if (out !== 4'b0101) begin
            $display("FAIL: Test case 7 failed, expected 0101, got %b", out);
            $finish;
        end

        // Test case 8: Reverse 1100
        in = 4'b1100; #10;
        if (out !== 4'b0011) begin
            $display("FAIL: Test case 8 failed, expected 0011, got %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule