`timescale 1ns/1ps

module tb_instn_dec;

reg [31:0] instrn;
wire [6:0] op_code;
wire [4:0] src_reg_1, src_reg_2, dest_reg;
wire [2:0] fn3;
wire [6:0] fn7;

// Instantiate the module under test (uut)
instn_dec uut (
    .instrn(instrn),
    .op_code(op_code),
    .src_reg_1(src_reg_1),
    .src_reg_2(src_reg_2),
    .dest_reg(dest_reg),
    .fn3(fn3),
    .fn7(fn7)
);

initial begin
    // Test case 1: Example instruction
    instrn = 32'b00000000000100000000000000110011; // ADD x1, x0, x1
    #10;
    if (op_code !== 7'b0110011) $display("FAIL: Test case 1 - Incorrect op_code");
    if (dest_reg !== 5'b00001) $display("FAIL: Test case 1 - Incorrect dest_reg");
    if (src_reg_1 !== 5'b00000) $display("FAIL: Test case 1 - Incorrect src_reg_1");
    if (src_reg_2 !== 5'b00001) $display("FAIL: Test case 1 - Incorrect src_reg_2");
    if (fn3 !== 3'b000) $display("FAIL: Test case 1 - Incorrect fn3");
    if (fn7 !== 7'b0000000) $display("FAIL: Test case 1 - Incorrect fn7");

    // Test case 2: Another instruction
    instrn = 32'b00000000001000000000000000100011; // SW x0, 0(x0)
    #10;
    if (op_code !== 7'b0100011) $display("FAIL: Test case 2 - Incorrect op_code");
    if (dest_reg !== 5'b00000) $display("FAIL: Test case 2 - Incorrect dest_reg");
    if (src_reg_1 !== 5'b00000) $display("FAIL: Test case 2 - Incorrect src_reg_1");
    if (src_reg_2 !== 5'b00010) $display("FAIL: Test case 2 - Incorrect src_reg_2");
    if (fn3 !== 3'b010) $display("FAIL: Test case 2 - Incorrect fn3");
    if (fn7 !== 7'b0000000) $display("FAIL: Test case 2 - Incorrect fn7");

    // Test case 3: Yet another instruction
    instrn = 32'b00000000001100000000000001100111; // JALR x0, 0(x0)
    #10;
    if (op_code !== 7'b1100111) $display("FAIL: Test case 3 - Incorrect op_code");
    if (dest_reg !== 5'b00000) $display("FAIL: Test case 3 - Incorrect dest_reg");
    if (src_reg_1 !== 5'b00000) $display("FAIL: Test case 3 - Incorrect src_reg_1");
    if (src_reg_2 !== 5'b00000) $display("FAIL: Test case 3 - Incorrect src_reg_2");
    if (fn3 !== 3'b000) $display("FAIL: Test case 3 - Incorrect fn3");
    if (fn7 !== 7'b0000000) $display("FAIL: Test case 3 - Incorrect fn7");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule