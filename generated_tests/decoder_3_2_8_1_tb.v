`timescale 1ns/1ps

module tb_decoder_3_2_8;

    reg [2:0] i;
    wire [7:0] o;
    
    // Instantiate the module under test
    decoder_3_2_8 uut (
        .i(i),
        .o(o)
    );

    initial begin
        // Test all possible inputs
        i = 3'b000; #10;
        if (o !== 8'b00000001) begin
            $display("FAIL: Input 000 should output 00000001");
            $finish;
        end

        i = 3'b001; #10;
        if (o !== 8'b00000010) begin
            $display("FAIL: Input 001 should output 00000010");
            $finish;
        end

        i = 3'b010; #10;
        if (o !== 8'b00000100) begin
            $display("FAIL: Input 010 should output 00000100");
            $finish;
        end

        i = 3'b011; #10;
        if (o !== 8'b00001000) begin
            $display("FAIL: Input 011 should output 00001000");
            $finish;
        end

        i = 3'b100; #10;
        if (o !== 8'b00010000) begin
            $display("FAIL: Input 100 should output 00010000");
            $finish;
        end

        i = 3'b101; #10;
        if (o !== 8'b00100000) begin
            $display("FAIL: Input 101 should output 00100000");
            $finish;
        end

        i = 3'b110; #10;
        if (o !== 8'b01000000) begin
            $display("FAIL: Input 110 should output 01000000");
            $finish;
        end

        i = 3'b111; #10;
        if (o !== 8'b10000000) begin
            $display("FAIL: Input 111 should output 10000000");
            $finish;
        end

        // Test default case
        i = 3'bxxx; #10; // Invalid input
        if (o !== 8'b00000000) begin
            $display("FAIL: Invalid input should output 00000000");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule