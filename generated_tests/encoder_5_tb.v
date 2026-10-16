`timescale 1ns/1ps

module tb_encoder;
    reg [7:0] in;
    wire [2:0] y;

    // Instantiate the module under test
    encoder uut (
        .in(in),
        .y(y)
    );

    initial begin
        // Test case 1: All inputs are 0
        in = 8'b00000000; #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

        // Test case 2: All inputs are 1
        in = 8'b11111111; #10;
        if (y !== 3'b111) $display("FAIL: Test case 2 failed, expected 111, got %b", y);

        // Test case 3: Only the first four bits are 1
        in = 8'b11110000; #10;
        if (y !== 3'b100) $display("FAIL: Test case 3 failed, expected 100, got %b", y);

        // Test case 4: Only the last four bits are 1
        in = 8'b00001111; #10;
        if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

        // Test case 5: Random bits
        in = 8'b10101010; #10;
        if (y !== 3'b101) $display("FAIL: Test case 5 failed, expected 101, got %b", y);

        // Test case 6: Another random pattern
        in = 8'b11001100; #10;
        if (y !== 3'b110) $display("FAIL: Test case 6 failed, expected 110, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule