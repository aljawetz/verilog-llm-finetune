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
        // Test case 1: Input 0000
        a = 4'b0000; #10;
        if (y !== 2'b00) $display("FAIL: Test case 1 failed, expected 00, got %b", y);

        // Test case 2: Input 0001
        a = 4'b0001; #10;
        if (y !== 2'b00) $display("FAIL: Test case 2 failed, expected 00, got %b", y);

        // Test case 3: Input 0010
        a = 4'b0010; #10;
        if (y !== 2'b00) $display("FAIL: Test case 3 failed, expected 00, got %b", y);

        // Test case 4: Input 0100
        a = 4'b0100; #10;
        if (y !== 2'b01) $display("FAIL: Test case 4 failed, expected 01, got %b", y);

        // Test case 5: Input 1000
        a = 4'b1000; #10;
        if (y !== 2'b01) $display("FAIL: Test case 5 failed, expected 01, got %b", y);

        // Test case 6: Input 0011
        a = 4'b0011; #10;
        if (y !== 2'b00) $display("FAIL: Test case 6 failed, expected 00, got %b", y);

        // Test case 7: Input 0110
        a = 4'b0110; #10;
        if (y !== 2'b01) $display("FAIL: Test case 7 failed, expected 01, got %b", y);

        // Test case 8: Input 1100
        a = 4'b1100; #10;
        if (y !== 2'b11) $display("FAIL: Test case 8 failed, expected 11, got %b", y);

        // Test case 9: Input 1110
        a = 4'b1110; #10;
        if (y !== 2'b11) $display("FAIL: Test case 9 failed, expected 11, got %b", y);

        // Test case 10: Input 1111
        a = 4'b1111; #10;
        if (y !== 2'b11) $display("FAIL: Test case 10 failed, expected 11, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule