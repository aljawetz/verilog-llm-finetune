`timescale 1ns/1ps

module tb_priority_encoder_4_2_case;

reg [3:0] in;
wire [1:0] out;

// Instantiate the unit under test (UUT)
priority_encoder_4_2_case uut (
    .in(in),
    .out(out)
);

initial begin
    // Test cases
    // Test case 1: Input 0001 should output 00
    in = 4'b0001; #10;
    if (out !== 2'b00) begin
        $display("FAIL: Expected out=00 for in=0001, got out=%b", out);
        $finish;
    end

    // Test case 2: Input 0010 should output 01
    in = 4'b0010; #10;
    if (out !== 2'b01) begin
        $display("FAIL: Expected out=01 for in=0010, got out=%b", out);
        $finish;
    end

    // Test case 3: Input 0011 should output 01
    in = 4'b0011; #10;
    if (out !== 2'b01) begin
        $display("FAIL: Expected out=01 for in=0011, got out=%b", out);
        $finish;
    end

    // Test case 4: Input 0100 should output 10
    in = 4'b0100; #10;
    if (out !== 2'b10) begin
        $display("FAIL: Expected out=10 for in=0100, got out=%b", out);
        $finish;
    end

    // Test case 5: Input 0111 should output 10
    in = 4'b0111; #10;
    if (out !== 2'b10) begin
        $display("FAIL: Expected out=10 for in=0111, got out=%b", out);
        $finish;
    end

    // Test case 6: Input 1000 should output 11
    in = 4'b1000; #10;
    if (out !== 2'b11) begin
        $display("FAIL: Expected out=11 for in=1000, got out=%b", out);
        $finish;
    end

    // Test case 7: Input 1111 should output 11
    in = 4'b1111; #10;
    if (out !== 2'b11) begin
        $display("FAIL: Expected out=11 for in=1111, got out=%b", out);
        $finish;
    end

    // Test case 8: Input 0000 should output high-impedance (zz)
    in = 4'b0000; #10;
    if (out !== 2'bz) begin
        $display("FAIL: Expected out=z for in=0000, got out=%b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule