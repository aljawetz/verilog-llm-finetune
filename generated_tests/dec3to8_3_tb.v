`timescale 1ns/1ps

module tb_dec3to8;

    reg [2:0] in;
    reg reset;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    dec3to8 uut (
        .in(in),
        .reset(reset),
        .out(out)
    );

    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10 ns
        reset = 0; // Release reset

        // Test case 1: Check output for input 3'b000
        in = 3'b000;
        #10;
        if (out !== 8'b00000001) begin
            $display("FAIL: Expected output 00000001 for input 000");
            $finish;
        end

        // Test case 2: Check output for input 3'b001
        in = 3'b001;
        #10;
        if (out !== 8'b00000010) begin
            $display("FAIL: Expected output 00000010 for input 001");
            $finish;
        end

        // Test case 3: Check output for input 3'b010
        in = 3'b010;
        #10;
        if (out !== 8'b00000100) begin
            $display("FAIL: Expected output 00000100 for input 010");
            $finish;
        end

        // Test case 4: Check output for input 3'b011
        in = 3'b011;
        #10;
        if (out !== 8'b00001000) begin
            $display("FAIL: Expected output 00001000 for input 011");
            $finish;
        end

        // Test case 5: Check output for input 3'b100
        in = 3'b100;
        #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Expected output 00010000 for input 100");
            $finish;
        end

        // Test case 6: Check output for input 3'b101
        in = 3'b101;
        #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Expected output 00100000 for input 101");
            $finish;
        end

        // Test case 7: Check output for input 3'b110
        in = 3'b110;
        #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Expected output 01000000 for input 110");
            $finish;
        end

        // Test case 8: Check output for input 3'b111
        in = 3'b111;
        #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Expected output 10000000 for input 111");
            $finish;
        end

        // Test case 9: Check output when reset is active
        reset = 1;
        #10;
        if (out !== 8'bzzzzzzzz) begin
            $display("FAIL: Expected high-impedance output when reset is active");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule