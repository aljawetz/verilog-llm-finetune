`timescale 1ns/1ps

module tb_decoder_4to16;

    reg [3:0] a;
    wire [15:0] y;

    // Instantiate the Unit Under Test (UUT)
    decoder_4to16 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test all possible inputs
        a = 4'b0000; #10;
        if (y !== 16'b0000000000000001) begin
            $display("FAIL: Input 0000 expected output 0000000000000001 but got %b", y);
            $finish;
        end

        a = 4'b0001; #10;
        if (y !== 16'b0000000000000010) begin
            $display("FAIL: Input 0001 expected output 0000000000000010 but got %b", y);
            $finish;
        end

        a = 4'b0010; #10;
        if (y !== 16'b0000000000000100) begin
            $display("FAIL: Input 0010 expected output 0000000000000100 but got %b", y);
            $finish;
        end

        a = 4'b0011; #10;
        if (y !== 16'b0000000000001000) begin
            $display("FAIL: Input 0011 expected output 0000000000001000 but got %b", y);
            $finish;
        end

        a = 4'b0100; #10;
        if (y !== 16'b0000000000010000) begin
            $display("FAIL: Input 0100 expected output 0000000000010000 but got %b", y);
            $finish;
        end

        a = 4'b0101; #10;
        if (y !== 16'b0000000000100000) begin
            $display("FAIL: Input 0101 expected output 0000000000100000 but got %b", y);
            $finish;
        end

        a = 4'b0110; #10;
        if (y !== 16'b0000000001000000) begin
            $display("FAIL: Input 0110 expected output 0000000001000000 but got %b", y);
            $finish;
        end

        a = 4'b0111; #10;
        if (y !== 16'b0000000010000000) begin
            $display("FAIL: Input 0111 expected output 0000000010000000 but got %b", y);
            $finish;
        end

        a = 4'b1000; #10;
        if (y !== 16'b0000000100000000) begin
            $display("FAIL: Input 1000 expected output 0000000100000000 but got %b", y);
            $finish;
        end

        a = 4'b1001; #10;
        if (y !== 16'b0000001000000000) begin
            $display("FAIL: Input 1001 expected output 0000001000000000 but got %b", y);
            $finish;
        end

        a = 4'b1010; #10;
        if (y !== 16'b0000010000000000) begin
            $display("FAIL: Input 1010 expected output 0000010000000000 but got %b", y);
            $finish;
        end

        a = 4'b1011; #10;
        if (y !== 16'b0000100000000000) begin
            $display("FAIL: Input 1011 expected output 0000100000000000 but got %b", y);
            $finish;
        end

        a = 4'b1100; #10;
        if (y !== 16'b0001000000000000) begin
            $display("FAIL: Input 1100 expected output 0001000000000000 but got %b", y);
            $finish;
        end

        a = 4'b1101; #10;
        if (y !== 16'b0010000000000000) begin
            $display("FAIL: Input 1101 expected output 0010000000000000 but got %b", y);
            $finish;
        end

        a = 4'b1110; #10;
        if (y !== 16'b0100000000000000) begin
            $display("FAIL: Input 1110 expected output 0100000000000000 but got %b", y);
            $finish;
        end

        a = 4'b1111; #10;
        if (y !== 16'b1000000000000000) begin
            $display("FAIL: Input 1111 expected output 1000000000000000 but got %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule