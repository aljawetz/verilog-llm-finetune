`timescale 1ns/1ps

module tb_priority_encoder;

    reg [7:0] vector;
    wire [2:0] num;

    // Instantiate the module under test
    priority_encoder uut (
        .vector(vector),
        .num(num)
    );

    initial begin
        // Test case 1: Only the highest bit is set
        vector = 8'b10000000; // Expect num = 3'd7
        #10;
        if (num !== 3'd7) $display("FAIL: Test case 1 failed, expected 7 but got %d", num);

        // Test case 2: Middle bit is set
        vector = 8'b00100000; // Expect num = 3'd5
        #10;
        if (num !== 3'd5) $display("FAIL: Test case 2 failed, expected 5 but got %d", num);

        // Test case 3: Lower bit is set
        vector = 8'b00000001; // Expect num = 3'd0
        #10;
        if (num !== 3'd0) $display("FAIL: Test case 3 failed, expected 0 but got %d", num);

        // Test case 4: Multiple bits set, highest priority should be taken
        vector = 8'b01100000; // Expect num = 3'd6
        #10;
        if (num !== 3'd6) $display("FAIL: Test case 4 failed, expected 6 but got %d", num);

        // Test case 5: All bits are zero
        vector = 8'b00000000; // Expect num = 3'd0
        #10;
        if (num !== 3'd0) $display("FAIL: Test case 5 failed, expected 0 but got %d", num);

        // Test case 6: Second highest bit is set
        vector = 8'b01000000; // Expect num = 3'd6
        #10;
        if (num !== 3'd6) $display("FAIL: Test case 6 failed, expected 6 but got %d", num);

        // Test case 7: Highest and lowest bits set
        vector = 8'b10000001; // Expect num = 3'd7
        #10;
        if (num !== 3'd7) $display("FAIL: Test case 7 failed, expected 7 but got %d", num);

        // Test case 8: Random bits set
        vector = 8'b11010010; // Expect num = 3'd7
        #10;
        if (num !== 3'd7) $display("FAIL: Test case 8 failed, expected 7 but got %d", num);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule