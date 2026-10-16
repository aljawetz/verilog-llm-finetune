`timescale 1ns/1ps

module tb_segment_display;

    reg [31:0] number;
    wire [6:0] disp;

    // Instantiate the module under test (uut)
    segment_display uut (
        .number(number),
        .disp(disp)
    );

    initial begin
        // Test cases
        number = 0; #10;
        if (disp !== 7'b1000000) $display("FAIL: Expected 0 to display 1000000, got %b", disp);

        number = 1; #10;
        if (disp !== 7'b1111001) $display("FAIL: Expected 1 to display 1111001, got %b", disp);

        number = 2; #10;
        if (disp !== 7'b0100100) $display("FAIL: Expected 2 to display 0100100, got %b", disp);

        number = 3; #10;
        if (disp !== 7'b0110000) $display("FAIL: Expected 3 to display 0110000, got %b", disp);

        number = 4; #10;
        if (disp !== 7'b0011001) $display("FAIL: Expected 4 to display 0011001, got %b", disp);

        number = 5; #10;
        if (disp !== 7'b0010010) $display("FAIL: Expected 5 to display 0010010, got %b", disp);

        number = 6; #10;
        if (disp !== 7'b0000010) $display("FAIL: Expected 6 to display 0000010, got %b", disp);

        number = 7; #10;
        if (disp !== 7'b1111000) $display("FAIL: Expected 7 to display 1111000, got %b", disp);

        number = 8; #10;
        if (disp !== 7'b0000000) $display("FAIL: Expected 8 to display 0000000, got %b", disp);

        number = 9; #10;
        if (disp !== 7'b0010000) $display("FAIL: Expected 9 to display 0010000, got %b", disp);

        number = 10; #10;
        if (disp !== 7'b0001000) $display("FAIL: Expected 10 to display 0001000, got %b", disp);

        number = 11; #10;
        if (disp !== 7'b0000011) $display("FAIL: Expected 11 to display 0000011, got %b", disp);

        number = 12; #10;
        if (disp !== 7'b1000110) $display("FAIL: Expected 12 to display 1000110, got %b", disp);

        number = 13; #10;
        if (disp !== 7'b0100001) $display("FAIL: Expected 13 to display 0100001, got %b", disp);

        number = 14; #10;
        if (disp !== 7'b0000110) $display("FAIL: Expected 14 to display 0000110, got %b", disp);

        number = 15; #10;
        if (disp !== 7'b0001110) $display("FAIL: Expected 15 to display 0001110, got %b", disp);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule