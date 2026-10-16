`timescale 1ns/1ps

module tb_decoder_3_8;

reg [2:0] in;
wire [7:0] out;

// Instantiate the module under test (uut)
decoder_3_8 uut (
    .in(in),
    .out(out)
);

initial begin
    // Test all possible inputs
    in = 3'b000; #10;
    if (out !== 8'b0000_0001) begin
        $display("FAIL: Expected output for input 000 is 0000_0001, got %b", out);
        $finish;
    end

    in = 3'b001; #10;
    if (out !== 8'b0000_0010) begin
        $display("FAIL: Expected output for input 001 is 0000_0010, got %b", out);
        $finish;
    end

    in = 3'b010; #10;
    if (out !== 8'b0000_0100) begin
        $display("FAIL: Expected output for input 010 is 0000_0100, got %b", out);
        $finish;
    end

    in = 3'b011; #10;
    if (out !== 8'b0000_1000) begin
        $display("FAIL: Expected output for input 011 is 0000_1000, got %b", out);
        $finish;
    end

    in = 3'b100; #10;
    if (out !== 8'b0001_0000) begin
        $display("FAIL: Expected output for input 100 is 0001_0000, got %b", out);
        $finish;
    end

    in = 3'b101; #10;
    if (out !== 8'b0010_0000) begin
        $display("FAIL: Expected output for input 101 is 0010_0000, got %b", out);
        $finish;
    end

    in = 3'b110; #10;
    if (out !== 8'b0100_0000) begin
        $display("FAIL: Expected output for input 110 is 0100_0000, got %b", out);
        $finish;
    end

    in = 3'b111; #10;
    if (out !== 8'b1000_0000) begin
        $display("FAIL: Expected output for input 111 is 1000_0000, got %b", out);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule