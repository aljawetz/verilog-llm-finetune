`timescale 1ns/1ps

module tb_decoder;
    reg [2:0] x;
    reg en;
    wire [7:0] y;

    // Instantiate the decoder module
    decoder uut (
        .x(x),
        .en(en),
        .y(y)
    );

    initial begin
        // Test case 1: Enable decoder and input 0
        en = 1;
        x = 3'b000;
        #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);
            $finish;
        end

        // Test case 2: Enable decoder and input 1
        x = 3'b001;
        #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);
            $finish;
        end

        // Test case 3: Enable decoder and input 2
        x = 3'b010;
        #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);
            $finish;
        end

        // Test case 4: Enable decoder and input 3
        x = 3'b011;
        #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);
            $finish;
        end

        // Test case 5: Enable decoder and input 4
        x = 3'b100;
        #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);
            $finish;
        end

        // Test case 6: Enable decoder and input 5
        x = 3'b101;
        #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);
            $finish;
        end

        // Test case 7: Enable decoder and input 6
        x = 3'b110;
        #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);
            $finish;
        end

        // Test case 8: Enable decoder and input 7
        x = 3'b111;
        #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);
            $finish;
        end

        // Test case 9: Disable decoder
        en = 0;
        x = 3'b101; // Input doesn't matter when disabled
        #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 9 failed, expected 00000000, got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule