`timescale 1ns/1ps

module tb_isEven;

    reg [7:0] number;
    wire result;

    // Instantiate the module under test (uut)
    isEven uut (
        .number(number),
        .result(result)
    );

    initial begin
        // Test case 1: Check even number 0
        number = 8'b00000000; // 0 is even
        #10;
        if (result !== 1'b1) $display("FAIL: Test case 1 failed, expected result 1 for input 0");

        // Test case 2: Check odd number 1
        number = 8'b00000001; // 1 is odd
        #10;
        if (result !== 1'b0) $display("FAIL: Test case 2 failed, expected result 0 for input 1");

        // Test case 3: Check even number 2
        number = 8'b00000010; // 2 is even
        #10;
        if (result !== 1'b1) $display("FAIL: Test case 3 failed, expected result 1 for input 2");

        // Test case 4: Check odd number 3
        number = 8'b00000011; // 3 is odd
        #10;
        if (result !== 1'b0) $display("FAIL: Test case 4 failed, expected result 0 for input 3");

        // Test case 5: Check even number 4
        number = 8'b00000100; // 4 is even
        #10;
        if (result !== 1'b1) $display("FAIL: Test case 5 failed, expected result 1 for input 4");

        // Test case 6: Check odd number 5
        number = 8'b00000101; // 5 is odd
        #10;
        if (result !== 1'b0) $display("FAIL: Test case 6 failed, expected result 0 for input 5");

        // Test case 7: Check even number 6
        number = 8'b00000110; // 6 is even
        #10;
        if (result !== 1'b1) $display("FAIL: Test case 7 failed, expected result 1 for input 6");

        // Test case 8: Check odd number 7
        number = 8'b00000111; // 7 is odd
        #10;
        if (result !== 1'b0) $display("FAIL: Test case 8 failed, expected result 0 for input 7");

        // Test case 9: Check even number 8
        number = 8'b00001000; // 8 is even
        #10;
        if (result !== 1'b1) $display("FAIL: Test case 9 failed, expected result 1 for input 8");

        // Test case 10: Check odd number 9
        number = 8'b00001001; // 9 is odd
        #10;
        if (result !== 1'b0) $display("FAIL: Test case 10 failed, expected result 0 for input 9");

        // Test case 11: Check even number 255
        number = 8'b11111111; // 255 is odd
        #10;
        if (result !== 1'b0) $display("FAIL: Test case 11 failed, expected result 0 for input 255");

        // Test case 12: Check even number 254
        number = 8'b11111110; // 254 is even
        #10;
        if (result !== 1'b1) $display("FAIL: Test case 12 failed, expected result 1 for input 254");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule