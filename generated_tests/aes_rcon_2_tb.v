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
    // Wait for a few clock cycles for outputs to stabilize
    #10;

    // Check outputs
    if (out !== 8'h01) begin
        $display("FAIL: out is not correct");
        $finish;
    end
    if (out2 !== 8'h02) begin
        $display("FAIL: out2 is not correct");
        $finish;
    end
    if (out3 !== 8'h04) begin
        $display("FAIL: out3 is not correct");
        $finish;
    end
    if (out4 !== 8'h08) begin
        $display("FAIL: out4 is not correct");
        $finish;
    end
    if (out5 !== 8'h10) begin
        $display("FAIL: out5 is not correct");
        $finish;
    end
    if (out6 !== 8'h20) begin
        $display("FAIL: out6 is not correct");
        $finish;
    end
    if (out7 !== 8'h40) begin
        $display("FAIL: out7 is not correct");
        $finish;
    end
    if (out8 !== 8'h80) begin
        $display("FAIL: out8 is not correct");
        $finish;
    end
    if (out9 !== 8'h1b) begin
        $display("FAIL: out9 is not correct");
        $finish;
    end
    if (out10 !== 8'h36) begin
        $display("FAIL: out10 is not correct");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule