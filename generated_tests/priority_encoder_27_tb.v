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
        // Initialize inputs
        enable = 0;
        i = 8'b00000000;

        // Test case 1: Enable is low, output should be undefined
        #10;
        if (y !== 3'bxxx) begin
            $display("FAIL: Expected undefined output when enable is low");
            $finish;
        end

        // Test case 2: Enable is high, input is 8'b00000001
        enable = 1;
        i = 8'b00000001;
        #10;
        if (y !== 3'b000) begin
            $display("FAIL: Expected output 000 for input 00000001");
            $finish;
        end

        // Test case 3: Input is 8'b00000010
        i = 8'b00000010;
        #10;
        if (y !== 3'b001) begin
            $display("FAIL: Expected output 001 for input 00000010");
            $finish;
        end

        // Test case 4: Input is 8'b00000100
        i = 8'b00000100;
        #10;
        if (y !== 3'b010) begin
            $display("FAIL: Expected output 010 for input 00000100");
            $finish;
        end

        // Test case 5: Input is 8'b00001000
        i = 8'b00001000;
        #10;
        if (y !== 3'b011) begin
            $display("FAIL: Expected output 011 for input 00001000");
            $finish;
        end

        // Test case 6: Input is 8'b00010000
        i = 8'b00010000;
        #10;
        if (y !== 3'b100) begin
            $display("FAIL: Expected output 100 for input 00010000");
            $finish;
        end

        // Test case 7: Input is 8'b00100000
        i = 8'b00100000;
        #10;
        if (y !== 3'b101) begin
            $display("FAIL: Expected output 101 for input 00100000");
            $finish;
        end

        // Test case 8: Input is 8'b01000000
        i = 8'b01000000;
        #10;
        if (y !== 3'b110) begin
            $display("FAIL: Expected output 110 for input 01000000");
            $finish;
        end

        // Test case 9: Input is 8'b10000000
        i = 8'b10000000;
        #10;
        if (y !== 3'b111) begin
            $display("FAIL: Expected output 111 for input 10000000");
            $finish;
        end

        // Test case 10: Multiple inputs high, should return the highest priority
        i = 8'b11000000; // Both i[6] and i[7] are high
        #10;
        if (y !== 3'b110) begin
            $display("FAIL: Expected output 110 for input 11000000");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule