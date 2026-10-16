`timescale 1ns/1ps

module tb_bcdtodec;

    reg [3:0] a;
    wire [9:0] y;

    // Instantiate the module under test
    bcdtodec uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test all BCD inputs from 0 to 9
        a = 4'b0000; #10; // BCD 0
        if (y !== 10'b0000000000) $display("FAIL: Expected 0000000000 for BCD 0, got %b", y);

        a = 4'b0001; #10; // BCD 1
        if (y !== 10'b0000000001) $display("FAIL: Expected 0000000001 for BCD 1, got %b", y);

        a = 4'b0010; #10; // BCD 2
        if (y !== 10'b0000000010) $display("FAIL: Expected 0000000010 for BCD 2, got %b", y);

        a = 4'b0011; #10; // BCD 3
        if (y !== 10'b0000000100) $display("FAIL: Expected 0000000100 for BCD 3, got %b", y);

        a = 4'b0100; #10; // BCD 4
        if (y !== 10'b0000001000) $display("FAIL: Expected 0000001000 for BCD 4, got %b", y);

        a = 4'b0101; #10; // BCD 5
        if (y !== 10'b0000010000) $display("FAIL: Expected 0000010000 for BCD 5, got %b", y);

        a = 4'b0110; #10; // BCD 6
        if (y !== 10'b0000100000) $display("FAIL: Expected 0000100000 for BCD 6, got %b", y);

        a = 4'b0111; #10; // BCD 7
        if (y !== 10'b0001000000) $display("FAIL: Expected 0001000000 for BCD 7, got %b", y);

        a = 4'b1000; #10; // BCD 8
        if (y !== 10'b0010000000) $display("FAIL: Expected 0010000000 for BCD 8, got %b", y);

        a = 4'b1001; #10; // BCD 9
        if (y !== 10'b0100000000) $display("FAIL: Expected 0100000000 for BCD 9, got %b", y);

        // Test invalid BCD input (10)
        a = 4'b1010; #10; // Invalid BCD
        if (y !== 10'b0000000000) $display("FAIL: Expected 0000000000 for invalid BCD 10, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule