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
        // Test case 1: Input 0000, expected output 0000
        in = 4'b0000; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 1 failed. Expected 0000, got %b", out);
            $finish;
        end

        // Test case 2: Input 0001, expected output 1000
        in = 4'b0001; #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 2 failed. Expected 1000, got %b", out);
            $finish;
        end

        // Test case 3: Input 0010, expected output 0100
        in = 4'b0010; #10;
        if (out !== 4'b0100) begin
            $display("FAIL: Test case 3 failed. Expected 0100, got %b", out);
            $finish;
        end

        // Test case 4: Input 0100, expected output 0010
        in = 4'b0100; #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 4 failed. Expected 0010, got %b", out);
            $finish;
        end

        // Test case 5: Input 1000, expected output 0001
        in = 4'b1000; #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 5 failed. Expected 0001, got %b", out);
            $finish;
        end

        // Test case 6: Input 1111, expected output 1111
        in = 4'b1111; #10;
        if (out !== 4'b1111) begin
            $display("FAIL: Test case 6 failed. Expected 1111, got %b", out);
            $finish;
        end

        // Test case 7: Input 1010, expected output 0101
        in = 4'b1010; #10;
        if (out !== 4'b0101) begin
            $display("FAIL: Test case 7 failed. Expected 0101, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule