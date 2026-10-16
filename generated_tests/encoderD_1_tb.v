`timescale 1ns/1ps

module tb_encoderD;

    reg [7:0] i;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    encoderD uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: Only the first input is high
        i = 8'b00000001; // Expected output: 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 3'b000, got %b", y);

        // Test case 2: Second input is high
        i = 8'b00000010; // Expected output: 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 2 failed, expected 3'b000, got %b", y);

        // Test case 3: Third input is high
        i = 8'b00000100; // Expected output: 3'b001
        #10;
        if (y !== 3'b001) $display("FAIL: Test case 3 failed, expected 3'b001, got %b", y);

        // Test case 4: Fourth input is high
        i = 8'b00001000; // Expected output: 3'b001
        #10;
        if (y !== 3'b001) $display("FAIL: Test case 4 failed, expected 3'b001, got %b", y);

        // Test case 5: Fifth input is high
        i = 8'b00010000; // Expected output: 3'b010
        #10;
        if (y !== 3'b010) $display("FAIL: Test case 5 failed, expected 3'b010, got %b", y);

        // Test case 6: Sixth input is high
        i = 8'b00100000; // Expected output: 3'b010
        #10;
        if (y !== 3'b010) $display("FAIL: Test case 6 failed, expected 3'b010, got %b", y);

        // Test case 7: Seventh input is high
        i = 8'b01000000; // Expected output: 3'b011
        #10;
        if (y !== 3'b011) $display("FAIL: Test case 7 failed, expected 3'b011, got %b", y);

        // Test case 8: Eighth input is high
        i = 8'b10000000; // Expected output: 3'b011
        #10;
        if (y !== 3'b011) $display("FAIL: Test case 8 failed, expected 3'b011, got %b", y);

        // Test case 9: Multiple inputs high
        i = 8'b11111111; // Expected output: 3'b111
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 9 failed, expected 3'b111, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule