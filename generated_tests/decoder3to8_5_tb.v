`timescale 1ns/1ps

module tb_decoder3to8;

    reg [2:0] bin;
    wire [7:0] data;
    
    // Instantiate the module under test (uut)
    decoder3to8 uut (
        .bin(bin),
        .data(data)
    );

    initial begin
        // Test all possible input values for bin
        bin = 3'b000; #10;
        if (data !== 8'b00000001) begin
            $display("FAIL: Expected data = 00000001 for bin = 000, got data = %b", data);
            $finish;
        end

        bin = 3'b001; #10;
        if (data !== 8'b00000010) begin
            $display("FAIL: Expected data = 00000010 for bin = 001, got data = %b", data);
            $finish;
        end

        bin = 3'b010; #10;
        if (data !== 8'b00000100) begin
            $display("FAIL: Expected data = 00000100 for bin = 010, got data = %b", data);
            $finish;
        end

        bin = 3'b011; #10;
        if (data !== 8'b00001000) begin
            $display("FAIL: Expected data = 00001000 for bin = 011, got data = %b", data);
            $finish;
        end

        bin = 3'b100; #10;
        if (data !== 8'b00010000) begin
            $display("FAIL: Expected data = 00010000 for bin = 100, got data = %b", data);
            $finish;
        end

        bin = 3'b101; #10;
        if (data !== 8'b00100000) begin
            $display("FAIL: Expected data = 00100000 for bin = 101, got data = %b", data);
            $finish;
        end

        bin = 3'b110; #10;
        if (data !== 8'b01000000) begin
            $display("FAIL: Expected data = 01000000 for bin = 110, got data = %b", data);
            $finish;
        end

        bin = 3'b111; #10;
        if (data !== 8'b10000000) begin
            $display("FAIL: Expected data = 10000000 for bin = 111, got data = %b", data);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule