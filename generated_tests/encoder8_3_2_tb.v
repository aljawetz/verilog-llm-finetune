`timescale 1ns/1ps

module tb_encoder8_3;
    reg [7:0] d;
    wire [2:0] y;

    // Instantiate the module under test
    encoder8_3 uut (
        .d(d),
        .y(y)
    );

    initial begin
        // Test case 1: Input is 8'b00000001
        d = 8'b00000001; #10;
        if (y !== 3'b000) begin
            $display("FAIL: Test case 1 failed, expected 3'b000, got %b", y);
            $finish;
        end

        // Test case 2: Input is 8'b00000010
        d = 8'b00000010; #10;
        if (y !== 3'b001) begin
            $display("FAIL: Test case 2 failed, expected 3'b001, got %b", y);
            $finish;
        end

        // Test case 3: Input is 8'b00000100
        d = 8'b00000100; #10;
        if (y !== 3'b010) begin
            $display("FAIL: Test case 3 failed, expected 3'b010, got %b", y);
            $finish;
        end

        // Test case 4: Input is 8'b00001000
        d = 8'b00001000; #10;
        if (y !== 3'b011) begin
            $display("FAIL: Test case 4 failed, expected 3'b011, got %b", y);
            $finish;
        end

        // Test case 5: Input is 8'b00010000
        d = 8'b00010000; #10;
        if (y !== 3'b100) begin
            $display("FAIL: Test case 5 failed, expected 3'b100, got %b", y);
            $finish;
        end

        // Test case 6: Input is 8'b00100000
        d = 8'b00100000; #10;
        if (y !== 3'b101) begin
            $display("FAIL: Test case 6 failed, expected 3'b101, got %b", y);
            $finish;
        end

        // Test case 7: Input is 8'b01000000
        d = 8'b01000000; #10;
        if (y !== 3'b110) begin
            $display("FAIL: Test case 7 failed, expected 3'b110, got %b", y);
            $finish;
        end

        // Test case 8: Input is 8'b10000000
        d = 8'b10000000; #10;
        if (y !== 3'b111) begin
            $display("FAIL: Test case 8 failed, expected 3'b111, got %b", y);
            $finish;
        end

        // Test case 9: Input is an unmatched value
        d = 8'b00000000; #10;
        if (y !== 3'b000) begin
            $display("FAIL: Test case 9 failed, expected 3'b000, got %b", y);
            $finish;
        end

        // Test case 10: Input is an unmatched value
        d = 8'b11111111; #10;
        if (y !== 3'b000) begin
            $display("FAIL: Test case 10 failed, expected 3'b000, got %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule