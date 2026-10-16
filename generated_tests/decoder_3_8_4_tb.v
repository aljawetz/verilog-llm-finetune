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
    // Test all input combinations
    in = 3'b000; #10;
    if (out !== 8'b0000_0001) begin
        $display("FAIL: Expected 8'b0000_0001 for input 3'b000, got %b", out);
        $finish;
    end

    in = 3'b001; #10;
    if (out !== 8'b0000_0010) begin
        $display("FAIL: Expected 8'b0000_0010 for input 3'b001, got %b", out);
        $finish;
    end

    in = 3'b010; #10;
    if (out !== 8'b0000_0100) begin
        $display("FAIL: Expected 8'b0000_0100 for input 3'b010, got %b", out);
        $finish;
    end

    in = 3'b011; #10;
    if (out !== 8'b0000_1000) begin
        $display("FAIL: Expected 8'b0000_1000 for input 3'b011, got %b", out);
        $finish;
    end

    in = 3'b100; #10;
    if (out !== 8'b0001_0000) begin
        $display("FAIL: Expected 8'b0001_0000 for input 3'b100, got %b", out);
        $finish;
    end

    in = 3'b101; #10;
    if (out !== 8'b0010_0000) begin
        $display("FAIL: Expected 8'b0010_0000 for input 3'b101, got %b", out);
        $finish;
    end

    in = 3'b110; #10;
    if (out !== 8'b0100_0000) begin
        $display("FAIL: Expected 8'b0100_0000 for input 3'b110, got %b", out);
        $finish;
    end

    in = 3'b111; #10;
    if (out !== 8'b1000_0000) begin
        $display("FAIL: Expected 8'b1000_0000 for input 3'b111, got %b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule