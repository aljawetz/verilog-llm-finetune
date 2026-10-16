`timescale 1ns/1ps

module tb_encoder8to3S;

    reg [7:0] i;
    wire [2:0] y;

    // Instantiate the module under test
    encoder8to3S uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: Input 00000001 (only i[0] is high)
        i = 8'b00000001;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

        // Test case 2: Input 00000010 (only i[1] is high)
        i = 8'b00000010;
        #10;
        if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", y);

        // Test case 3: Input 00000100 (only i[2] is high)
        i = 8'b00000100;
        #10;
        if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

        // Test case 4: Input 00001000 (only i[3] is high)
        i = 8'b00001000;
        #10;
        if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

        // Test case 5: Input 00010000 (only i[4] is high)
        i = 8'b00010000;
        #10;
        if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", y);

        // Test case 6: Input 00100000 (only i[5] is high)
        i = 8'b00100000;
        #10;
        if (y !== 3'b100) $display("FAIL: Test case 6 failed, expected 100, got %b", y);

        // Test case 7: Input 01000000 (only i[6] is high)
        i = 8'b01000000;
        #10;
        if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", y);

        // Test case 8: Input 10000000 (only i[7] is high)
        i = 8'b10000000;
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", y);

        // Test case 9: Input 11111111 (all inputs high)
        i = 8'b11111111;
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 9 failed, expected 111, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule