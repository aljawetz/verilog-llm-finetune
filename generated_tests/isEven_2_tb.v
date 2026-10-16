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
        // Test case 1: Test with an even number (0)
        number = 8'b00000000; // 0 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected result 1 for input 0");
            $finish;
        end

        // Test case 2: Test with an odd number (1)
        number = 8'b00000001; // 1 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected result 0 for input 1");
            $finish;
        end

        // Test case 3: Test with an even number (2)
        number = 8'b00000010; // 2 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected result 1 for input 2");
            $finish;
        end

        // Test case 4: Test with an odd number (3)
        number = 8'b00000011; // 3 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 4 failed, expected result 0 for input 3");
            $finish;
        end

        // Test case 5: Test with an even number (4)
        number = 8'b00000100; // 4 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 5 failed, expected result 1 for input 4");
            $finish;
        end

        // Test case 6: Test with an odd number (5)
        number = 8'b00000101; // 5 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 6 failed, expected result 0 for input 5");
            $finish;
        end

        // Test case 7: Test with an even number (255)
        number = 8'b11111111; // 255 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 7 failed, expected result 0 for input 255");
            $finish;
        end

        // Test case 8: Test with an even number (254)
        number = 8'b11111110; // 254 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 8 failed, expected result 1 for input 254");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule