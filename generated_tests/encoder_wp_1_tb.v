`timescale 1ns/1ps

module tb_encoder_wp;

reg [7:0] i;
wire [2:0] d;

// Instantiate the Unit Under Test (UUT)
encoder_wp uut (
    .i(i),
    .d(d)
);

initial begin
    // Test case 1: Check for the highest priority bit set
    i = 8'b00000000; #10;
    if (d !== 3'bzzz) begin
        $display("FAIL: Expected d = 3'bzzz for i = 8'b00000000, got d = %b", d);
        $finish;
    end

    // Test case 2: Check for the MSB set
    i = 8'b10000000; #10;
    if (d !== 3'b111) begin
        $display("FAIL: Expected d = 3'b111 for i = 8'b10000000, got d = %b", d);
        $finish;
    end

    // Test case 3: Check for the second MSB set
    i = 8'b01000000; #10;
    if (d !== 3'b110) begin
        $display("FAIL: Expected d = 3'b110 for i = 8'b01000000, got d = %b", d);
        $finish;
    end

    // Test case 4: Check for the third MSB set
    i = 8'b00100000; #10;
    if (d !== 3'b101) begin
        $display("FAIL: Expected d = 3'b101 for i = 8'b00100000, got d = %b", d);
        $finish;
    end

    // Test case 5: Check for the fourth MSB set
    i = 8'b00010000; #10;
    if (d !== 3'b100) begin
        $display("FAIL: Expected d = 3'b100 for i = 8'b00010000, got d = %b", d);
        $finish;
    end

    // Test case 6: Check for the fifth MSB set
    i = 8'b00001000; #10;
    if (d !== 3'b011) begin
        $display("FAIL: Expected d = 3'b011 for i = 8'b00001000, got d = %b", d);
        $finish;
    end

    // Test case 7: Check for the sixth MSB set
    i = 8'b00000100; #10;
    if (d !== 3'b010) begin
        $display("FAIL: Expected d = 3'b010 for i = 8'b00000100, got d = %b", d);
        $finish;
    end

    // Test case 8: Check for the seventh MSB set
    i = 8'b00000010; #10;
    if (d !== 3'b001) begin
        $display("FAIL: Expected d = 3'b001 for i = 8'b00000010, got d = %b", d);
        $finish;
    end

    // Test case 9: Check for the least significant bit set
    i = 8'b00000001; #10;
    if (d !== 3'b000) begin
        $display("FAIL: Expected d = 3'b000 for i = 8'b00000001, got d = %b", d);
        $finish;
    end

    // Final check: All bits set
    i = 8'b11111111; #10;
    if (d !== 3'b111) begin
        $display("FAIL: Expected d = 3'b111 for i = 8'b11111111, got d = %b", d);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule