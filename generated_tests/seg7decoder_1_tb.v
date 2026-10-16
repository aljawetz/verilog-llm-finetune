`timescale 1ns/1ps

module tb_seg7decoder;

    reg [3:0] counter;
    wire [6:0] segments;

    // Instantiate the module under test
    seg7decoder uut (
        .counter(counter),
        .segments(segments)
    );

    initial begin
        // Test all hexadecimal values from 0 to F
        counter = 4'h0; #10;
        if (segments !== 7'b0111111) $display("FAIL: Test case 0 failed");

        counter = 4'h1; #10;
        if (segments !== 7'b0000110) $display("FAIL: Test case 1 failed");

        counter = 4'h2; #10;
        if (segments !== 7'b1011011) $display("FAIL: Test case 2 failed");

        counter = 4'h3; #10;
        if (segments !== 7'b1001111) $display("FAIL: Test case 3 failed");

        counter = 4'h4; #10;
        if (segments !== 7'b1100110) $display("FAIL: Test case 4 failed");

        counter = 4'h5; #10;
        if (segments !== 7'b1101101) $display("FAIL: Test case 5 failed");

        counter = 4'h6; #10;
        if (segments !== 7'b1111101) $display("FAIL: Test case 6 failed");

        counter = 4'h7; #10;
        if (segments !== 7'b0000111) $display("FAIL: Test case 7 failed");

        counter = 4'h8; #10;
        if (segments !== 7'b1111111) $display("FAIL: Test case 8 failed");

        counter = 4'h9; #10;
        if (segments !== 7'b1100111) $display("FAIL: Test case 9 failed");

        counter = 4'hA; #10;
        if (segments !== 7'b1110111) $display("FAIL: Test case A failed");

        counter = 4'hB; #10;
        if (segments !== 7'b1111100) $display("FAIL: Test case B failed");

        counter = 4'hC; #10;
        if (segments !== 7'b0111001) $display("FAIL: Test case C failed");

        counter = 4'hD; #10;
        if (segments !== 7'b1011110) $display("FAIL: Test case D failed");

        counter = 4'hE; #10;
        if (segments !== 7'b1111001) $display("FAIL: Test case E failed");

        counter = 4'hF; #10;
        if (segments !== 7'b1110001) $display("FAIL: Test case F failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule