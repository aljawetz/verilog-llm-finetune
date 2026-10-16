`timescale 1ns/1ps

module tb_padder1;

    reg [63:0] in;
    reg [2:0] byte_num;
    wire [63:0] out;

    // Instantiate the module under test (uut)
    padder1 uut (
        .in(in),
        .byte_num(byte_num),
        .out(out)
    );

    initial begin
        // Test case 1: byte_num = 0
        in = 64'h0000000000000000;
        byte_num = 3'b000;
        #10;
        if (out !== 64'h0100000000000000) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: byte_num = 1
        in = 64'h1234567890abcdef;
        byte_num = 3'b001;
        #10;
        if (out !== {8'h12, 56'h01000000000000}) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: byte_num = 2
        in = 64'h1234567890abcdef;
        byte_num = 3'b010;
        #10;
        if (out !== {16'h1234, 48'h010000000000}) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: byte_num = 3
        in = 64'h1234567890abcdef;
        byte_num = 3'b011;
        #10;
        if (out !== {24'h123456, 40'h0100000000}) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: byte_num = 4
        in = 64'h1234567890abcdef;
        byte_num = 3'b100;
        #10;
        if (out !== {32'h12345678, 32'h01000000}) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: byte_num = 5
        in = 64'h1234567890abcdef;
        byte_num = 3'b101;
        #10;
        if (out !== {40'h1234567890, 24'h010000}) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: byte_num = 6
        in = 64'h1234567890abcdef;
        byte_num = 3'b110;
        #10;
        if (out !== {48'h1234567890ab, 16'h0100}) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: byte_num = 7
        in = 64'h1234567890abcdef;
        byte_num = 3'b111;
        #10;
        if (out !== {56'h1234567890abcd, 8'h01}) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule