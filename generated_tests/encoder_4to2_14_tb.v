`timescale 1ns/1ps

module tb_encoder_4to2;
    reg [3:0] a;
    wire [1:0] y;

    // Instantiate the module under test (uut)
    encoder_4to2 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: a = 4'b0000
        a = 4'b0000; #10;
        if (y !== 2'b00) $display("FAIL: Test case 1 failed, expected y = 00, got y = %b", y);

        // Test case 2: a = 4'b0001
        a = 4'b0001; #10;
        if (y !== 2'b00) $display("FAIL: Test case 2 failed, expected y = 00, got y = %b", y);

        // Test case 3: a = 4'b0010
        a = 4'b0010; #10;
        if (y !== 2'b00) $display("FAIL: Test case 3 failed, expected y = 00, got y = %b", y);

        // Test case 4: a = 4'b0011
        a = 4'b0011; #10;
        if (y !== 2'b01) $display("FAIL: Test case 4 failed, expected y = 01, got y = %b", y);

        // Test case 5: a = 4'b0100
        a = 4'b0100; #10;
        if (y !== 2'b00) $display("FAIL: Test case 5 failed, expected y = 00, got y = %b", y);

        // Test case 6: a = 4'b0110
        a = 4'b0110; #10;
        if (y !== 2'b01) $display("FAIL: Test case 6 failed, expected y = 01, got y = %b", y);

        // Test case 7: a = 4'b1000
        a = 4'b1000; #10;
        if (y !== 2'b01) $display("FAIL: Test case 7 failed, expected y = 01, got y = %b", y);

        // Test case 8: a = 4'b1100
        a = 4'b1100; #10;
        if (y !== 2'b01) $display("FAIL: Test case 8 failed, expected y = 01, got y = %b", y);

        // Test case 9: a = 4'b1110
        a = 4'b1110; #10;
        if (y !== 2'b11) $display("FAIL: Test case 9 failed, expected y = 11, got y = %b", y);

        // Test case 10: a = 4'b1111
        a = 4'b1111; #10;
        if (y !== 2'b11) $display("FAIL: Test case 10 failed, expected y = 11, got y = %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule