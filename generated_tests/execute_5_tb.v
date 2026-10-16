`timescale 1ns/1ps

module tb_execute;

reg clk;
reg depi;
reg [3:0] nzcv_old;
reg [3:0] op_code;
reg [31:0] opr1;
reg [31:0] opr2;
reg [31:0] dep;
wire [31:0] result;
wire is_write;
wire [3:0] nzcv;

execute uut (
    .clk(clk),
    .nzcv_old(nzcv_old),
    .op_code(op_code),
    .opr1(opr1),
    .opr2(opr2),
    .depi(depi),
    .dep(dep),
    .result(result),
    .is_write(is_write),
    .nzcv(nzcv)
);

initial begin
    clk = 0;
    depi = 0;
    nzcv_old = 4'b0000;
    op_code = 4'b0000;
    opr1 = 32'h00000000;
    opr2 = 32'h00000000;
    dep = 32'h00000000;

    // Test AND operation
    #5;
    op_code = 4'b0000; // AND
    opr1 = 32'hFFFFFFFF; // 11111111...
    opr2 = 32'h0F0F0F0F; // 0000111100001111...
    #5;
    if (result !== 32'h0F0F0F0F || nzcv !== 4'b0000 || is_write !== 1) begin
        $display("FAIL: AND operation failed");
        $finish;
    end

    // Test OR operation
    #5;
    op_code = 4'b1100; // OR
    opr1 = 32'h00000000; // 00000000...
    opr2 = 32'h0F0F0F0F; // 0000111100001111...
    #5;
    if (result !== 32'h0F0F0F0F || nzcv !== 4'b0000 || is_write !== 0) begin
        $display("FAIL: OR operation failed");
        $finish;
    end

    // Test XOR operation
    #5;
    op_code = 4'b0001; // XOR
    opr1 = 32'hFFFFFFFF; // 11111111...
    opr2 = 32'h0F0F0F0F; // 0000111100001111...
    #5;
    if (result !== 32'hF0F0F0F0 || nzcv !== 4'b0000 || is_write !== 1) begin
        $display("FAIL: XOR operation failed");
        $finish;
    end

    // Test ADD operation
    #5;
    op_code = 4'b0100; // ADD
    opr1 = 32'h00000001; // 00000001
    opr2 = 32'h00000001; // 00000001
    #5;
    if (result !== 32'h00000002 || nzcv !== 4'b0000 || is_write !== 1) begin
        $display("FAIL: ADD operation failed");
        $finish;
    end

    // Test SUB operation
    #5;
    op_code = 4'b0010; // SUB
    opr1 = 32'h00000002; // 00000002
    opr2 = 32'h00000001; // 00000001
    #5;
    if (result !== 32'h00000001 || nzcv !== 4'b0000 || is_write !== 1) begin
        $display("FAIL: SUB operation failed");
        $finish;
    end

    // Test NOT operation
    #5;
    op_code = 4'b1111; // NOT
    opr2 = 32'hFFFFFFFF; // 11111111...
    #5;
    if (result !== 32'h00000000 || nzcv !== 4'b1000 || is_write !== 0) begin
        $display("FAIL: NOT operation failed");
        $finish;
    end

    // Test with depi
    #5;
    depi = 1;
    dep = 32'h0000000F; // Dependency value
    op_code = 4'b0000; // AND
    opr1 = 32'hFFFFFFFF; // 11111111...
    #5;
    if (result !== 32'h0000000F || nzcv !== 4'b0000 || is_write !== 1) begin
        $display("FAIL: AND operation with dependency failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

always #2.5 clk = ~clk;

endmodule