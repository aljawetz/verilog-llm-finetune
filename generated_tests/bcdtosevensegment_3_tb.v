`timescale 1ns/1ps

module tb_bcdtosevensegment;

    reg [3:0] a;
    wire [6:0] y;

    // Instantiate the module under test (uut)
    bcdtosevensegment uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test cases for valid BCD inputs
        a = 4'b0000; #10; if (y !== 7'b1111110) $display("FAIL: Input 0 expected output 1111110, got %b", y);
        a = 4'b0001; #10; if (y !== 7'b0110000) $display("FAIL: Input 1 expected output 0110000, got %b", y);
        a = 4'b0010; #10; if (y !== 7'b1101101) $display("FAIL: Input 2 expected output 1101101, got %b", y);
        a = 4'b0011; #10; if (y !== 7'b1111001) $display("FAIL: Input 3 expected output 1111001, got %b", y);
        a = 4'b0100; #10; if (y !== 7'b0110011) $display("FAIL: Input 4 expected output 0110011, got %b", y);
        a = 4'b0101; #10; if (y !== 7'b1011011) $display("FAIL: Input 5 expected output 1011011, got %b", y);
        a = 4'b0110; #10; if (y !== 7'b1011111) $display("FAIL: Input 6 expected output 1011111, got %b", y);
        a = 4'b0111; #10; if (y !== 7'b1110000) $display("FAIL: Input 7 expected output 1110000, got %b", y);
        a = 4'b1000; #10; if (y !== 7'b1111111) $display("FAIL: Input 8 expected output 1111111, got %b", y);
        a = 4'b1001; #10; if (y !== 7'b1111011) $display("FAIL: Input 9 expected output 1111011, got %b", y);

        // Test case for invalid BCD input
        a = 4'b1010; #10; if (y !== 7'b0000000) $display("FAIL: Input 10 expected output 0000000, got %b", y);
        a = 4'b1111; #10; if (y !== 7'b0000000) $display("FAIL: Input 15 expected output 0000000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule