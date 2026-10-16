`timescale 1ns/1ps

module tb_encoder;

reg [7:0] i;
wire [2:0] y;

// Instantiate the encoder module
encoder uut (
    .i(i),
    .y(y)
);

initial begin
    // Test case 1: Input is 8'b10000000, expect output 3'b111
    i = 8'b10000000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected 3'b111 for input 8'b10000000, got %b", y);
        $finish;
    end

    // Test case 2: Input is 8'b01000000, expect output 3'b110
    i = 8'b01000000; #10;
    if (y !== 3'b110) begin
        $display("FAIL: Expected 3'b110 for input 8'b01000000, got %b", y);
        $finish;
    end

    // Test case 3: Input is 8'b00100000, expect output 3'b101
    i = 8'b00100000; #10;
    if (y !== 3'b101) begin
        $display("FAIL: Expected 3'b101 for input 8'b00100000, got %b", y);
        $finish;
    end

    // Test case 4: Input is 8'b00010000, expect output 3'b100
    i = 8'b00010000; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Expected 3'b100 for input 8'b00010000, got %b", y);
        $finish;
    end

    // Test case 5: Input is 8'b00001000, expect output 3'b011
    i = 8'b00001000; #10;
    if (y !== 3'b011) begin
        $display("FAIL: Expected 3'b011 for input 8'b00001000, got %b", y);
        $finish;
    end

    // Test case 6: Input is 8'b00000100, expect output 3'b010
    i = 8'b00000100; #10;
    if (y !== 3'b010) begin
        $display("FAIL: Expected 3'b010 for input 8'b00000100, got %b", y);
        $finish;
    end

    // Test case 7: Input is 8'b00000010, expect output 3'b001
    i = 8'b00000010; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Expected 3'b001 for input 8'b00000010, got %b", y);
        $finish;
    end

    // Test case 8: Input is 8'b00000001, expect output 3'b000
    i = 8'b00000001; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected 3'b000 for input 8'b00000001, got %b", y);
        $finish;
    end

    // Test case 9: Input is 8'b00000000, expect output 3'b000 (default case)
    i = 8'b00000000; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected 3'b000 for input 8'b00000000, got %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule