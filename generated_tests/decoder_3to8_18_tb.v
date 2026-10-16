`timescale 1ns/1ps

module tb_decoder_3to8;

    reg [2:0] d;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    decoder_3to8 uut (
        .d(d),
        .y(y)
    );

    initial begin
        // Test all possible inputs
        d = 3'b000; #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Expected y=00000001 for d=000, got y=%b", y);
            $finish;
        end

        d = 3'b001; #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Expected y=00000010 for d=001, got y=%b", y);
            $finish;
        end

        d = 3'b010; #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Expected y=00000100 for d=010, got y=%b", y);
            $finish;
        end

        d = 3'b011; #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Expected y=00001000 for d=011, got y=%b", y);
            $finish;
        end

        d = 3'b100; #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Expected y=00010000 for d=100, got y=%b", y);
            $finish;
        end

        d = 3'b101; #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Expected y=00100000 for d=101, got y=%b", y);
            $finish;
        end

        d = 3'b110; #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Expected y=01000000 for d=110, got y=%b", y);
            $finish;
        end

        d = 3'b111; #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Expected y=10000000 for d=111, got y=%b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule