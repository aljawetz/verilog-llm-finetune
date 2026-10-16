`timescale 1ns/1ps

module tb_aes_rcon;

reg clk;
wire [7:0] out, out2, out3, out4, out5, out6, out7, out8, out9, out10;

// Instantiate the module under test
aes_rcon uut (
    .clk(clk),
    .out(out),
    .out2(out2),
    .out3(out3),
    .out4(out4),
    .out5(out5),
    .out6(out6),
    .out7(out7),
    .out8(out8),
    .out9(out9),
    .out10(out10)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
end

// Test sequence
initial begin
    // Wait for a few clock cycles to stabilize
    #10;

    // Check outputs
    if (out !== 8'h01) $display("FAIL: out is incorrect, expected 0x01 but got %h", out);
    if (out2 !== 8'h02) $display("FAIL: out2 is incorrect, expected 0x02 but got %h", out2);
    if (out3 !== 8'h04) $display("FAIL: out3 is incorrect, expected 0x04 but got %h", out3);
    if (out4 !== 8'h08) $display("FAIL: out4 is incorrect, expected 0x08 but got %h", out4);
    if (out5 !== 8'h10) $display("FAIL: out5 is incorrect, expected 0x10 but got %h", out5);
    if (out6 !== 8'h20) $display("FAIL: out6 is incorrect, expected 0x20 but got %h", out6);
    if (out7 !== 8'h40) $display("FAIL: out7 is incorrect, expected 0x40 but got %h", out7);
    if (out8 !== 8'h80) $display("FAIL: out8 is incorrect, expected 0x80 but got %h", out8);
    if (out9 !== 8'h1b) $display("FAIL: out9 is incorrect, expected 0x1b but got %h", out9);
    if (out10 !== 8'h36) $display("FAIL: out10 is incorrect, expected 0x36 but got %h", out10);

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule