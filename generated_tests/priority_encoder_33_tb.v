`timescale 1ns/1ps

module tb_priority_encoder;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    priority_encoder uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Input is 8'b00000001
        in = 8'b00000001; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Test case 1 failed, expected 000, got %b", out);
            $finish;
        end

        // Test case 2: Input is 8'b00000010
        in = 8'b00000010; #10;
        if (out !== 3'b001) begin
            $display("FAIL: Test case 2 failed, expected 001, got %b", out);
            $finish;
        end

        // Test case 3: Input is 8'b00000100
        in = 8'b00000100; #10;
        if (out !== 3'b010) begin
            $display("FAIL: Test case 3 failed, expected 010, got %b", out);
            $finish;
        end

        // Test case 4: Input is 8'b00001000
        in = 8'b00001000; #10;
        if (out !== 3'b011) begin
            $display("FAIL: Test case 4 failed, expected 011, got %b", out);
            $finish;
        end

        // Test case 5: Input is 8'b00010000
        in = 8'b00010000; #10;
        if (out !== 3'b100) begin
            $display("FAIL: Test case 5 failed, expected 100, got %b", out);
            $finish;
        end

        // Test case 6: Input is 8'b00100000
        in = 8'b00100000; #10;
        if (out !== 3'b101) begin
            $display("FAIL: Test case 6 failed, expected 101, got %b", out);
            $finish;
        end

        // Test case 7: Input is 8'b01000000
        in = 8'b01000000; #10;
        if (out !== 3'b110) begin
            $display("FAIL: Test case 7 failed, expected 110, got %b", out);
            $finish;
        end

        // Test case 8: Input is 8'b10000000
        in = 8'b10000000; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Test case 8 failed, expected 111, got %b", out);
            $finish;
        end

        // Test case 9: Input is 8'b00000000 (no valid input)
        in = 8'b00000000; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Test case 9 failed, expected 000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule