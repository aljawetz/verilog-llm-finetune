`timescale 1ns/1ps

module tb_decoder;

    reg [2:0] in;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    decoder uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test all possible input values
        in = 3'b000; #10;
        if (out !== 8'b00000001) begin
            $display("FAIL: Expected 00000001 for input 000");
            $finish;
        end

        in = 3'b001; #10;
        if (out !== 8'b00000010) begin
            $display("FAIL: Expected 00000010 for input 001");
            $finish;
        end

        in = 3'b010; #10;
        if (out !== 8'b00000100) begin
            $display("FAIL: Expected 00000100 for input 010");
            $finish;
        end

        in = 3'b011; #10;
        if (out !== 8'b00001000) begin
            $display("FAIL: Expected 00001000 for input 011");
            $finish;
        end

        in = 3'b100; #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Expected 00010000 for input 100");
            $finish;
        end

        in = 3'b101; #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Expected 00100000 for input 101");
            $finish;
        end

        in = 3'b110; #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Expected 01000000 for input 110");
            $finish;
        end

        in = 3'b111; #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Expected 10000000 for input 111");
            $finish;
        end

        // Check default case (not applicable in this test as all inputs are valid)
        in = 3'bxxx; #10; // This will not be tested as all inputs are valid
        if (out !== 8'bxxxxxxxx) begin
            $display("FAIL: Expected xxxxxxxx for invalid input");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule