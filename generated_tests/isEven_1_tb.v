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
        // Test case 1: Check even number
        number = 8'b00000000; // 0 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 1 failed for number = %d", number);
            $finish;
        end

        // Test case 2: Check odd number
        number = 8'b00000001; // 1 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 2 failed for number = %d", number);
            $finish;
        end

        // Test case 3: Check even number
        number = 8'b00000010; // 2 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 3 failed for number = %d", number);
            $finish;
        end

        // Test case 4: Check odd number
        number = 8'b00000011; // 3 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 4 failed for number = %d", number);
            $finish;
        end

        // Test case 5: Check even number
        number = 8'b00000100; // 4 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 5 failed for number = %d", number);
            $finish;
        end

        // Test case 6: Check odd number
        number = 8'b00000101; // 5 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 6 failed for number = %d", number);
            $finish;
        end

        // Test case 7: Check even number
        number = 8'b00000110; // 6 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 7 failed for number = %d", number);
            $finish;
        end

        // Test case 8: Check odd number
        number = 8'b00000111; // 7 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 8 failed for number = %d", number);
            $finish;
        end

        // Test case 9: Check even number
        number = 8'b00001000; // 8 is even
        #10;
        if (result !== 1'b1) begin
            $display("FAIL: Test case 9 failed for number = %d", number);
            $finish;
        end

        // Test case 10: Check odd number
        number = 8'b00001001; // 9 is odd
        #10;
        if (result !== 1'b0) begin
            $display("FAIL: Test case 10 failed for number = %d", number);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule