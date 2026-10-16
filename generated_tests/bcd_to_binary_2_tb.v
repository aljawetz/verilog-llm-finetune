`timescale 1ns/1ps

module tb_bcd_to_binary;

    reg [7:0] in;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    bcd_to_binary uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        // Test case 1: BCD 0000 0000 (0 in binary)
        in = 8'b00000000; #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected 0000, got %b", out);
            $finish;
        end

        // Test case 2: BCD 0000 0001 (1 in binary)
        in = 8'b00000001; #10;
        if (out !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected 0001, got %b", out);
            $finish;
        end

        // Test case 3: BCD 0000 0010 (2 in binary)
        in = 8'b00000010; #10;
        if (out !== 4'b0010) begin
            $display("FAIL: Test case 3 failed, expected 0010, got %b", out);
            $finish;
        end

        // Test case 4: BCD 0000 1000 (8 in binary)
        in = 8'b00001000; #10;
        if (out !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected 1000, got %b", out);
            $finish;
        end

        // Test case 5: BCD 0000 1001 (9 in binary)
        in = 8'b00001001; #10;
        if (out !== 4'b1001) begin
            $display("FAIL: Test case 5 failed, expected 1001, got %b", out);
            $finish;
        end

        // Test case 6: BCD 0000 1010 (10 in binary, should be invalid)
        in = 8'b00001010; #10;
        if (out !== 4'b1010) begin
            $display("FAIL: Test case 6 failed, expected 1010, got %b", out);
            $finish;
        end

        // Test case 7: BCD 0000 1111 (15 in binary, should be invalid)
        in = 8'b00001111; #10;
        if (out !== 4'b1111) begin
            $display("FAIL: Test case 7 failed, expected 1111, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule