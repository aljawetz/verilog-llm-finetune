`timescale 1ns/1ps

module tb_is_div_3;

    reg [7:0] digit;
    wire OUT;

    // Instantiate the module under test
    is_div_3 uut (
        .digit(digit),
        .OUT(OUT)
    );

    initial begin
        // Test cases
        // Test case 1: 8'b00000000 (0)
        digit = 8'b00000000; #10;
        if (OUT !== 1'b1) $display("FAIL: Test case 1 failed for input %b", digit);

        // Test case 2: 8'b00000011 (3)
        digit = 8'b00000011; #10;
        if (OUT !== 1'b1) $display("FAIL: Test case 2 failed for input %b", digit);

        // Test case 3: 8'b00000101 (5)
        digit = 8'b00000101; #10;
        if (OUT !== 1'b1) $display("FAIL: Test case 3 failed for input %b", digit);

        // Test case 4: 8'b00000110 (6)
        digit = 8'b00000110; #10;
        if (OUT !== 1'b1) $display("FAIL: Test case 4 failed for input %b", digit);

        // Test case 5: 8'b00000111 (7)
        digit = 8'b00000111; #10;
        if (OUT !== 1'b1) $display("FAIL: Test case 5 failed for input %b", digit);

        // Test case 6: 8'b00001000 (8)
        digit = 8'b00001000; #10;
        if (OUT !== 1'b0) $display("FAIL: Test case 6 failed for input %b", digit);

        // Test case 7: 8'b00001001 (9)
        digit = 8'b00001001; #10;
        if (OUT !== 1'b1) $display("FAIL: Test case 7 failed for input %b", digit);

        // Test case 8: 8'b00001010 (10)
        digit = 8'b00001010; #10;
        if (OUT !== 1'b0) $display("FAIL: Test case 8 failed for input %b", digit);

        // Test case 9: 8'b00001111 (15)
        digit = 8'b00001111; #10;
        if (OUT !== 1'b1) $display("FAIL: Test case 9 failed for input %b", digit);

        // Test case 10: 8'b00010000 (16)
        digit = 8'b00010000; #10;
        if (OUT !== 1'b0) $display("FAIL: Test case 10 failed for input %b", digit);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule