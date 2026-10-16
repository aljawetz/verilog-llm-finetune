`timescale 1ns/1ps

module tb_encoder;
    reg en;
    reg [7:0] din;
    wire [2:0] dout;

    // Instantiate the encoder module
    encoder uut (
        .en(en),
        .din(din),
        .dout(dout)
    );

    initial begin
        // Test case 1: Enable with first bit set
        en = 1;
        din = 8'b00000001; // Expected output: 3'b000
        #10;
        if (dout !== 3'b000) begin
            $display("FAIL: Test case 1 failed, expected 3'b000, got %b", dout);
            $finish;
        end

        // Test case 2: Enable with second bit set
        din = 8'b00000010; // Expected output: 3'b001
        #10;
        if (dout !== 3'b001) begin
            $display("FAIL: Test case 2 failed, expected 3'b001, got %b", dout);
            $finish;
        end

        // Test case 3: Enable with third bit set
        din = 8'b00000100; // Expected output: 3'b010
        #10;
        if (dout !== 3'b010) begin
            $display("FAIL: Test case 3 failed, expected 3'b010, got %b", dout);
            $finish;
        end

        // Test case 4: Enable with fourth bit set
        din = 8'b00001000; // Expected output: 3'b011
        #10;
        if (dout !== 3'b011) begin
            $display("FAIL: Test case 4 failed, expected 3'b011, got %b", dout);
            $finish;
        end

        // Test case 5: Enable with fifth bit set
        din = 8'b00010000; // Expected output: 3'b100
        #10;
        if (dout !== 3'b100) begin
            $display("FAIL: Test case 5 failed, expected 3'b100, got %b", dout);
            $finish;
        end

        // Test case 6: Enable with sixth bit set
        din = 8'b00100000; // Expected output: 3'b101
        #10;
        if (dout !== 3'b101) begin
            $display("FAIL: Test case 6 failed, expected 3'b101, got %b", dout);
            $finish;
        end

        // Test case 7: Enable with seventh bit set
        din = 8'b01000000; // Expected output: 3'b110
        #10;
        if (dout !== 3'b110) begin
            $display("FAIL: Test case 7 failed, expected 3'b110, got %b", dout);
            $finish;
        end

        // Test case 8: Enable with eighth bit set
        din = 8'b10000000; // Expected output: 3'b111
        #10;
        if (dout !== 3'b111) begin
            $display("FAIL: Test case 8 failed, expected 3'b111, got %b", dout);
            $finish;
        end

        // Test case 9: Disable the encoder
        en = 0;
        din = 8'b11111111; // Expected output: 3'b000
        #10;
        if (dout !== 3'b000) begin
            $display("FAIL: Test case 9 failed, expected 3'b000, got %b", dout);
            $finish;
        end

        // Test case 10: Enable with no bits set
        en = 1;
        din = 8'b00000000; // Expected output: 3'b000
        #10;
        if (dout !== 3'b000) begin
            $display("FAIL: Test case 10 failed, expected 3'b000, got %b", dout);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule