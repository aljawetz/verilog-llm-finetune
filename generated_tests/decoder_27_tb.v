`timescale 1ns/1ps

module tb_decoder;

reg [2:0] i;
wire [7:0] out;

// Instantiate the decoder module
decoder uut (
    .i(i),
    .out(out)
);

initial begin
    // Test all input combinations
    i = 3'b000; #10;
    if (out !== 8'b00000001) begin
        $display("FAIL: Expected out=00000001 for i=000");
        $finish;
    end

    i = 3'b001; #10;
    if (out !== 8'b00000010) begin
        $display("FAIL: Expected out=00000010 for i=001");
        $finish;
    end

    i = 3'b010; #10;
    if (out !== 8'b00000100) begin
        $display("FAIL: Expected out=00000100 for i=010");
        $finish;
    end

    i = 3'b011; #10;
    if (out !== 8'b00001000) begin
        $display("FAIL: Expected out=00001000 for i=011");
        $finish;
    end

    i = 3'b100; #10;
    if (out !== 8'b00010000) begin
        $display("FAIL: Expected out=00010000 for i=100");
        $finish;
    end

    i = 3'b101; #10;
    if (out !== 8'b00100000) begin
        $display("FAIL: Expected out=00100000 for i=101");
        $finish;
    end

    i = 3'b110; #10;
    if (out !== 8'b01000000) begin
        $display("FAIL: Expected out=01000000 for i=110");
        $finish;
    end

    i = 3'b111; #10;
    if (out !== 8'b10000000) begin
        $display("FAIL: Expected out=10000000 for i=111");
        $finish;
    end

    // Test default case
    i = 3'bxxx; #10; // Invalid input
    if (out !== 8'b00000000) begin
        $display("FAIL: Expected out=00000000 for invalid input");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule