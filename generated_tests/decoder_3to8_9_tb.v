`timescale 1ns/1ps

module tb_decoder_3to8;

    reg [2:0] en;
    wire [7:0] out;

    // Instantiate the module under test
    decoder_3to8 uut (
        .en(en),
        .out(out)
    );

    initial begin
        // Test all input combinations
        en = 3'b000; #10;
        if (out !== 8'b00000001) begin
            $display("FAIL: Test case en=000 failed");
            $finish;
        end

        en = 3'b001; #10;
        if (out !== 8'b00000010) begin
            $display("FAIL: Test case en=001 failed");
            $finish;
        end

        en = 3'b010; #10;
        if (out !== 8'b00000100) begin
            $display("FAIL: Test case en=010 failed");
            $finish;
        end

        en = 3'b011; #10;
        if (out !== 8'b00001000) begin
            $display("FAIL: Test case en=011 failed");
            $finish;
        end

        en = 3'b100; #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Test case en=100 failed");
            $finish;
        end

        en = 3'b101; #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Test case en=101 failed");
            $finish;
        end

        en = 3'b110; #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Test case en=110 failed");
            $finish;
        end

        en = 3'b111; #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Test case en=111 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule