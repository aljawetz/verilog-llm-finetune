`timescale 1ns/1ps

module tb_shift_rotate;

reg [7:0] a;
reg [2:0] opcode;
wire [7:0] result;

// Instantiate the module under test
shift_rotate uut (
    .a(a),
    .opcode(opcode),
    .result(result)
);

initial begin
    // Test cases
    // Test arithmetic right shift
    a = 8'b11001100; opcode = 3'b000; #10;
    if (result !== 8'b11110110) $display("FAIL: Test case 1 failed");

    // Test logical right shift
    a = 8'b11001100; opcode = 3'b001; #10;
    if (result !== 8'b01100110) $display("FAIL: Test case 2 failed");

    // Test algebraic left shift
    a = 8'b11001100; opcode = 3'b010; #10;
    if (result !== 8'b10011000) $display("FAIL: Test case 3 failed");

    // Test logical left shift
    a = 8'b11001100; opcode = 3'b011; #10;
    if (result !== 8'b10011000) $display("FAIL: Test case 4 failed");

    // Test rotate right
    a = 8'b11001100; opcode = 3'b100; #10;
    if (result !== 8'b01100110) $display("FAIL: Test case 5 failed");

    // Test rotate left
    a = 8'b11001100; opcode = 3'b101; #10;
    if (result !== 8'b10011001) $display("FAIL: Test case 6 failed");

    // Test default case
    a = 8'b11001100; opcode = 3'b111; #10;
    if (result !== 8'b00000000) $display("FAIL: Test case 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule