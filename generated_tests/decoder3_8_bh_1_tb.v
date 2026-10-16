`timescale 1ns/1ps

module tb_decoder3_8_bh;

    reg [2:0] d;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    decoder3_8_bh uut (
        .d(d),
        .y(y)
    );

    initial begin
        // Test cases
        d = 3'b000; #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case d=000 failed, expected 00000001 but got %b", y);
            $finish;
        end

        d = 3'b001; #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case d=001 failed, expected 00000010 but got %b", y);
            $finish;
        end

        d = 3'b010; #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case d=010 failed, expected 00000100 but got %b", y);
            $finish;
        end

        d = 3'b011; #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case d=011 failed, expected 00001000 but got %b", y);
            $finish;
        end

        d = 3'b100; #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case d=100 failed, expected 00010000 but got %b", y);
            $finish;
        end

        d = 3'b101; #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case d=101 failed, expected 00100000 but got %b", y);
            $finish;
        end

        d = 3'b110; #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case d=110 failed, expected 01000000 but got %b", y);
            $finish;
        end

        d = 3'b111; #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case d=111 failed, expected 10000000 but got %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule