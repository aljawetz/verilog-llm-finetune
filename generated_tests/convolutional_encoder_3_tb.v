`timescale 1ns/1ps

module tb_convolutional_encoder;

    reg [4:0] x;
    wire [5:0] y;

    // Instantiate the module under test (uut)
    convolutional_encoder uut (
        .x(x),
        .y(y)
    );

    initial begin
        // Test case 1: x = 5'b00000
        x = 5'b00000;
        #10;
        if (y !== 6'b000000) $display("FAIL: Test case 1 failed, expected 000000, got %b", y);

        // Test case 2: x = 5'b11111
        x = 5'b11111;
        #10;
        if (y !== 6'b111111) $display("FAIL: Test case 2 failed, expected 111111, got %b", y);

        // Test case 3: x = 5'b10101
        x = 5'b10101;
        #10;
        if (y !== 6'b101100) $display("FAIL: Test case 3 failed, expected 101100, got %b", y);

        // Test case 4: x = 5'b01010
        x = 5'b01010;
        #10;
        if (y !== 6'b010101) $display("FAIL: Test case 4 failed, expected 010101, got %b", y);

        // Test case 5: x = 5'b11000
        x = 5'b11000;
        #10;
        if (y !== 6'b110100) $display("FAIL: Test case 5 failed, expected 110100, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule