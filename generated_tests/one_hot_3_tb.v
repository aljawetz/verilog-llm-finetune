`timescale 1ns/1ps

module tb_one_hot;

    reg [3:0] in;
    wire [15:0] out;
    
    // Instantiate the module under test
    one_hot uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Input 0
        in = 4'b0000; #10;
        if (out !== 16'b0000000000000001) begin
            $display("FAIL: Test case 1 failed, expected 0000000000000001, got %b", out);
            $finish;
        end

        // Test case 2: Input 1
        in = 4'b0001; #10;
        if (out !== 16'b0000000000000010) begin
            $display("FAIL: Test case 2 failed, expected 0000000000000010, got %b", out);
            $finish;
        end

        // Test case 3: Input 2
        in = 4'b0010; #10;
        if (out !== 16'b0000000000000100) begin
            $display("FAIL: Test case 3 failed, expected 0000000000000100, got %b", out);
            $finish;
        end

        // Test case 4: Input 3
        in = 4'b0011; #10;
        if (out !== 16'b0000000000001000) begin
            $display("FAIL: Test case 4 failed, expected 0000000000001000, got %b", out);
            $finish;
        end

        // Test case 5: Input 4
        in = 4'b0100; #10;
        if (out !== 16'b0000000000010000) begin
            $display("FAIL: Test case 5 failed, expected 0000000000010000, got %b", out);
            $finish;
        end

        // Test case 6: Input 5
        in = 4'b0101; #10;
        if (out !== 16'b0000000000100000) begin
            $display("FAIL: Test case 6 failed, expected 0000000000100000, got %b", out);
            $finish;
        end

        // Test case 7: Input 6
        in = 4'b0110; #10;
        if (out !== 16'b0000000001000000) begin
            $display("FAIL: Test case 7 failed, expected 0000000001000000, got %b", out);
            $finish;
        end

        // Test case 8: Input 7
        in = 4'b0111; #10;
        if (out !== 16'b0000000010000000) begin
            $display("FAIL: Test case 8 failed, expected 0000000010000000, got %b", out);
            $finish;
        end

        // Test case 9: Input 8
        in = 4'b1000; #10;
        if (out !== 16'b0000000100000000) begin
            $display("FAIL: Test case 9 failed, expected 0000000100000000, got %b", out);
            $finish;
        end

        // Test case 10: Input 9
        in = 4'b1001; #10;
        if (out !== 16'b0000001000000000) begin
            $display("FAIL: Test case 10 failed, expected 0000001000000000, got %b", out);
            $finish;
        end

        // Test case 11: Input 10
        in = 4'b1010; #10;
        if (out !== 16'b0000010000000000) begin
            $display("FAIL: Test case 11 failed, expected 0000010000000000, got %b", out);
            $finish;
        end

        // Test case 12: Input 11
        in = 4'b1011; #10;
        if (out !== 16'b0000100000000000) begin
            $display("FAIL: Test case 12 failed, expected 0000100000000000, got %b", out);
            $finish;
        end

        // Test case 13: Input 12
        in = 4'b1100; #10;
        if (out !== 16'b0001000000000000) begin
            $display("FAIL: Test case 13 failed, expected 0001000000000000, got %b", out);
            $finish;
        end

        // Test case 14: Input 13
        in = 4'b1101; #10;
        if (out !== 16'b0010000000000000) begin
            $display("FAIL: Test case 14 failed, expected 0010000000000000, got %b", out);
            $finish;
        end

        // Test case 15: Input 14
        in = 4'b1110; #10;
        if (out !== 16'b0100000000000000) begin
            $display("FAIL: Test case 15 failed, expected 0100000000000000, got %b", out);
            $finish;
        end

        // Test case 16: Input 15
        in = 4'b1111; #10;
        if (out !== 16'b1000000000000000) begin
            $display("FAIL: Test case 16 failed, expected 1000000000000000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule