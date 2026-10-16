`timescale 1ns/1ps

module tb_b2bcd;

    reg [3:0] inp;
    wire [4:0] outp;

    // Instantiate the module under test
    b2bcd uut (
        .inp(inp),
        .outp(outp)
    );

    initial begin
        // Test cases for inputs 0 to 9
        inp = 4'b0000; #10; if (outp !== 5'b00000) $display("FAIL: Expected 00000 for input 0");
        inp = 4'b0001; #10; if (outp !== 5'b00001) $display("FAIL: Expected 00001 for input 1");
        inp = 4'b0010; #10; if (outp !== 5'b00010) $display("FAIL: Expected 00010 for input 2");
        inp = 4'b0011; #10; if (outp !== 5'b00011) $display("FAIL: Expected 00011 for input 3");
        inp = 4'b0100; #10; if (outp !== 5'b00100) $display("FAIL: Expected 00100 for input 4");
        inp = 4'b0101; #10; if (outp !== 5'b00101) $display("FAIL: Expected 00101 for input 5");
        inp = 4'b0110; #10; if (outp !== 5'b00110) $display("FAIL: Expected 00110 for input 6");
        inp = 4'b0111; #10; if (outp !== 5'b00111) $display("FAIL: Expected 00111 for input 7");
        inp = 4'b1000; #10; if (outp !== 5'b01000) $display("FAIL: Expected 01000 for input 8");
        inp = 4'b1001; #10; if (outp !== 5'b01001) $display("FAIL: Expected 01001 for input 9");

        // Test cases for inputs 10 to 15
        inp = 4'b1010; #10; if (outp !== 5'b10000) $display("FAIL: Expected 10000 for input 10");
        inp = 4'b1011; #10; if (outp !== 5'b10001) $display("FAIL: Expected 10001 for input 11");
        inp = 4'b1100; #10; if (outp !== 5'b10010) $display("FAIL: Expected 10010 for input 12");
        inp = 4'b1101; #10; if (outp !== 5'b10011) $display("FAIL: Expected 10011 for input 13");
        inp = 4'b1110; #10; if (outp !== 5'b10100) $display("FAIL: Expected 10100 for input 14");
        inp = 4'b1111; #10; if (outp !== 5'b10101) $display("FAIL: Expected 10101 for input 15");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule