`timescale 1ns/1ps

module tb_shift_rotate;

// Inputs
reg [7:0] a;
reg [2:0] opcode;

// Outputs
wire [7:0] result;

// Instantiate the Unit Under Test (UUT)
shift_rotate uut (
    .a(a),
    .opcode(opcode),
    .result(result)
);

// Test procedure
initial begin
    // Test cases
    // Test 1: Shift right arithmetic
    a = 8'b11001100; opcode = 3'b000; #10;
    if (result !== 8'b11110110) $display("FAIL: Test 1 failed");

    // Test 2: Shift right logical
    a = 8'b11001100; opcode = 3'b001; #10;
    if (result !== 8'b01100110) $display("FAIL: Test 2 failed");

    // Test 3: Shift left algebraic
    a = 8'b11001100; opcode = 3'b010; #10;
    if (result !== 8'b10011000) $display("FAIL: Test 3 failed");

    // Test 4: Shift left logical
    a = 8'b11001100; opcode = 3'b011; #10;
    if (result !== 8'b10011000) $display("FAIL: Test 4 failed");

    // Test 5: Rotate right
    a = 8'b11001100; opcode = 3'b100; #10;
    if (result !== 8'b01100110) $display("FAIL: Test 5 failed");

    // Test 6: Rotate left
    a = 8'b11001100; opcode = 3'b101; #10;
    if (result !== 8'b10011001) $display("FAIL: Test 6 failed");

    // Test 7: Default case
    a = 8'b11001100; opcode = 3'b111; #10;
    if (result !== 8'b00000000) $display("FAIL: Test 7 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule