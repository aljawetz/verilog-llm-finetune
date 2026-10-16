`timescale 1ns/1ps

module tb_encoder_8to3;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    encoder_8to3 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        // Test case 1: Input is 0000_0001
        in = 8'b0000_0001; #10;
        if (out !== 3'b000) $display("FAIL: Expected 000 for input 0000_0001, got %b", out);

        // Test case 2: Input is 0000_0010
        in = 8'b0000_0010; #10;
        if (out !== 3'b001) $display("FAIL: Expected 001 for input 0000_0010, got %b", out);

        // Test case 3: Input is 0000_0100
        in = 8'b0000_0100; #10;
        if (out !== 3'b010) $display("FAIL: Expected 010 for input 0000_0100, got %b", out);

        // Test case 4: Input is 0000_1000
        in = 8'b0000_1000; #10;
        if (out !== 3'b011) $display("FAIL: Expected 011 for input 0000_1000, got %b", out);

        // Test case 5: Input is 0001_0000
        in = 8'b0001_0000; #10;
        if (out !== 3'b100) $display("FAIL: Expected 100 for input 0001_0000, got %b", out);

        // Test case 6: Input is 0010_0000
        in = 8'b0010_0000; #10;
        if (out !== 3'b101) $display("FAIL: Expected 101 for input 0010_0000, got %b", out);

        // Test case 7: Input is 0100_0000
        in = 8'b0100_0000; #10;
        if (out !== 3'b110) $display("FAIL: Expected 110 for input 0100_0000, got %b", out);

        // Test case 8: Input is 1000_0000
        in = 8'b1000_0000; #10;
        if (out !== 3'b111) $display("FAIL: Expected 111 for input 1000_0000, got %b", out);

        // Test case 9: Input is 0000_0000 (default case)
        in = 8'b0000_0000; #10;
        if (out !== 3'bxxx) $display("FAIL: Expected xxx for input 0000_0000, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule