`timescale 1ns/1ps

module tb_Encoder_8x3_bh;

    reg [7:0] i;
    wire [2:0] b;

    // Instantiate the module under test
    Encoder_8x3_bh uut (
        .i(i),
        .b(b)
    );

    initial begin
        // Test case 1: Input is 0000_0001, expected output is 000
        i = 8'b0000_0001;
        #10;
        if (b !== 3'b000) begin
            $display("FAIL: Expected 000 for input 0000_0001, got %b", b);
            $finish;
        end

        // Test case 2: Input is 0000_0010, expected output is 001
        i = 8'b0000_0010;
        #10;
        if (b !== 3'b001) begin
            $display("FAIL: Expected 001 for input 0000_0010, got %b", b);
            $finish;
        end

        // Test case 3: Input is 0000_0100, expected output is 010
        i = 8'b0000_0100;
        #10;
        if (b !== 3'b010) begin
            $display("FAIL: Expected 010 for input 0000_0100, got %b", b);
            $finish;
        end

        // Test case 4: Input is 0000_1000, expected output is 011
        i = 8'b0000_1000;
        #10;
        if (b !== 3'b011) begin
            $display("FAIL: Expected 011 for input 0000_1000, got %b", b);
            $finish;
        end

        // Test case 5: Input is 0001_0000, expected output is 100
        i = 8'b0001_0000;
        #10;
        if (b !== 3'b100) begin
            $display("FAIL: Expected 100 for input 0001_0000, got %b", b);
            $finish;
        end

        // Test case 6: Input is 0010_0000, expected output is 101
        i = 8'b0010_0000;
        #10;
        if (b !== 3'b101) begin
            $display("FAIL: Expected 101 for input 0010_0000, got %b", b);
            $finish;
        end

        // Test case 7: Input is 0100_0000, expected output is 110
        i = 8'b0100_0000;
        #10;
        if (b !== 3'b110) begin
            $display("FAIL: Expected 110 for input 0100_0000, got %b", b);
            $finish;
        end

        // Test case 8: Input is 1000_0000, expected output is 111
        i = 8'b1000_0000;
        #10;
        if (b !== 3'b111) begin
            $display("FAIL: Expected 111 for input 1000_0000, got %b", b);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule