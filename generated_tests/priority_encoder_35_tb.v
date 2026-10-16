`timescale 1ns/1ps

module tb_priority_encoder;

    reg [7:0] i;
    reg enable;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    priority_encoder uut (
        .i(i),
        .enable(enable),
        .y(y)
    );

    initial begin
        // Test case 1: Enable with i = 8'b00000001
        enable = 1;
        i = 8'b00000001; #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

        // Test case 2: Enable with i = 8'b00000010
        i = 8'b00000010; #10;
        if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", y);

        // Test case 3: Enable with i = 8'b00000100
        i = 8'b00000100; #10;
        if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

        // Test case 4: Enable with i = 8'b00001000
        i = 8'b00001000; #10;
        if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

        // Test case 5: Enable with i = 8'b00010000
        i = 8'b00010000; #10;
        if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", y);

        // Test case 6: Enable with i = 8'b00100000
        i = 8'b00100000; #10;
        if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", y);

        // Test case 7: Enable with i = 8'b01000000
        i = 8'b01000000; #10;
        if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", y);

        // Test case 8: Enable with no bits set
        i = 8'b00000000; #10;
        if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", y);

        // Test case 9: Disable the encoder
        enable = 0; 
        i = 8'b11111111; #10; // Should not affect output
        if (y !== 3'b111) $display("FAIL: Test case 9 failed, expected 111, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule