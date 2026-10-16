`timescale 1ns/1ps

module tb_aes_rcon;

reg clk;
wire [7:0] out, out2, out3, out4, out5, out6, out7, out8, out9, out10;

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

initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
end

initial begin
    // Wait for a few clock cycles to stabilize
    #10;

    // Test round constants
    if (out !== 8'h01) begin
        $display("FAIL: out is not 8'h01");
        $finish;
    end
    #10;

    if (out2 !== 8'h02) begin
        $display("FAIL: out2 is not 8'h02");
        $finish;
    end
    #10;

    if (out3 !== 8'h04) begin
        $display("FAIL: out3 is not 8'h04");
        $finish;
    end
    #10;

    if (out4 !== 8'h08) begin
        $display("FAIL: out4 is not 8'h08");
        $finish;
    end
    #10;

    if (out5 !== 8'h10) begin
        $display("FAIL: out5 is not 8'h10");
        $finish;
    end
    #10;

    if (out6 !== 8'h20) begin
        $display("FAIL: out6 is not 8'h20");
        $finish;
    end
    #10;

    if (out7 !== 8'h40) begin
        $display("FAIL: out7 is not 8'h40");
        $finish;
    end
    #10;

    if (out8 !== 8'h80) begin
        $display("FAIL: out8 is not 8'h80");
        $finish;
    end
    #10;

    if (out9 !== 8'h1b) begin
        $display("FAIL: out9 is not 8'h1b");
        $finish;
    end
    #10;

    if (out10 !== 8'h36) begin
        $display("FAIL: out10 is not 8'h36");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule