`timescale 1ns/1ps

module tb_decoder_3to8;

    reg [2:0] in;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    decoder_3to8 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Input = 3'b000
        in = 3'b000; #10;
        if (out !== 8'b0000_0001) begin
            $display("FAIL: Test case 1 failed, expected 8'b0000_0001, got %b", out);
            $finish;
        end

        // Test case 2: Input = 3'b001
        in = 3'b001; #10;
        if (out !== 8'b0000_0010) begin
            $display("FAIL: Test case 2 failed, expected 8'b0000_0010, got %b", out);
            $finish;
        end

        // Test case 3: Input = 3'b010
        in = 3'b010; #10;
        if (out !== 8'b0000_0100) begin
            $display("FAIL: Test case 3 failed, expected 8'b0000_0100, got %b", out);
            $finish;
        end

        // Test case 4: Input = 3'b011
        in = 3'b011; #10;
        if (out !== 8'b0000_1000) begin
            $display("FAIL: Test case 4 failed, expected 8'b0000_1000, got %b", out);
            $finish;
        end

        // Test case 5: Input = 3'b100
        in = 3'b100; #10;
        if (out !== 8'b0001_0000) begin
            $display("FAIL: Test case 5 failed, expected 8'b0001_0000, got %b", out);
            $finish;
        end

        // Test case 6: Input = 3'b101
        in = 3'b101; #10;
        if (out !== 8'b0010_0000) begin
            $display("FAIL: Test case 6 failed, expected 8'b0010_0000, got %b", out);
            $finish;
        end

        // Test case 7: Input = 3'b110
        in = 3'b110; #10;
        if (out !== 8'b0100_0000) begin
            $display("FAIL: Test case 7 failed, expected 8'b0100_0000, got %b", out);
            $finish;
        end

        // Test case 8: Input = 3'b111
        in = 3'b111; #10;
        if (out !== 8'b1000_0000) begin
            $display("FAIL: Test case 8 failed, expected 8'b1000_0000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule