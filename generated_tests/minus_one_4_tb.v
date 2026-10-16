`timescale 1ns/1ps

module tb_minus_one;

reg [15:0] i_operand;
wire [15:0] o_result;
wire o_borrow;

// Instantiate the module under test (uut)
minus_one uut (
    .i_operand(i_operand),
    .o_result(o_result),
    .o_borrow(o_borrow)
);

// Test procedure
initial begin
    // Test case 1: Subtract 1 from 0
    i_operand = 16'h0000; // Expect o_result = 16'hFFFF, o_borrow = 1
    #10;
    if (o_result !== 16'hFFFF || o_borrow !== 1) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Subtract 1 from 1
    i_operand = 16'h0001; // Expect o_result = 16'h0000, o_borrow = 0
    #10;
    if (o_result !== 16'h0000 || o_borrow !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Subtract 1 from 2
    i_operand = 16'h0002; // Expect o_result = 16'h0001, o_borrow = 0
    #10;
    if (o_result !== 16'h0001 || o_borrow !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Subtract 1 from 32768
    i_operand = 16'h8000; // Expect o_result = 16'h7FFF, o_borrow = 0
    #10;
    if (o_result !== 16'h7FFF || o_borrow !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Subtract 1 from 65535
    i_operand = 16'hFFFF; // Expect o_result = 16'hFFFE, o_borrow = 0
    #10;
    if (o_result !== 16'hFFFE || o_borrow !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Subtract 1 from 32767
    i_operand = 16'h7FFF; // Expect o_result = 16'h7FFE, o_borrow = 0
    #10;
    if (o_result !== 16'h7FFE || o_borrow !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: Subtract 1 from 2^15
    i_operand = 16'h8001; // Expect o_result = 16'h8000, o_borrow = 0
    #10;
    if (o_result !== 16'h8000 || o_borrow !== 0) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule