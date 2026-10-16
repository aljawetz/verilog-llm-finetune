`timescale 1ns/1ps

module tb_alu;

reg [7:0] a;
reg [7:0] b;
reg [2:0] sel;
reg clk;
reg reset;
wire [7:0] out;

alu #(8) uut (
    .a(a),
    .b(b),
    .out(out),
    .sel(sel),
    .clk(clk),
    .reset(reset)
);

initial begin
    // Initialize clock
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize reset
    reset = 1;
    #10;
    reset = 0;

    // Test ADD
    a = 8'd15; b = 8'd10; sel = 3'b000; // 15 + 10 = 25
    #10;
    if (out !== 8'd25) begin
        $display("FAIL: ADD operation failed");
        $finish;
    end

    // Test SUB
    a = 8'd20; b = 8'd5; sel = 3'b001; // 20 - 5 = 15
    #10;
    if (out !== 8'd15) begin
        $display("FAIL: SUB operation failed");
        $finish;
    end

    // Test LSL
    a = 8'd3; b = 8'd1; sel = 3'b010; // 3 << 1 = 6
    #10;
    if (out !== 8'd6) begin
        $display("FAIL: LSL operation failed");
        $finish;
    end

    // Test LSR
    a = 8'd8; b = 8'd1; sel = 3'b011; // 8 >> 1 = 4
    #10;
    if (out !== 8'd4) begin
        $display("FAIL: LSR operation failed");
        $finish;
    end

    // Test AND
    a = 8'd12; b = 8'd5; sel = 3'b100; // 12 & 5 = 4
    #10;
    if (out !== 8'd4) begin
        $display("FAIL: AND operation failed");
        $finish;
    end

    // Test OR
    a = 8'd12; b = 8'd5; sel = 3'b101; // 12 | 5 = 13
    #10;
    if (out !== 8'd13) begin
        $display("FAIL: OR operation failed");
        $finish;
    end

    // Test XOR
    a = 8'd12; b = 8'd5; sel = 3'b110; // 12 ^ 5 = 9
    #10;
    if (out !== 8'd9) begin
        $display("FAIL: XOR operation failed");
        $finish;
    end

    // Test EQL
    a = 8'd10; b = 8'd10; sel = 3'b111; // 10 == 10
    #10;
    if (out !== 1) begin
        $display("FAIL: EQL operation failed");
        $finish;
    end

    a = 8'd10; b = 8'd5; sel = 3'b111; // 10 == 5
    #10;
    if (out !== 0) begin
        $display("FAIL: EQL operation failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule