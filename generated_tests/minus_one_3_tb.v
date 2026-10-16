`timescale 1ns/1ps

module tb_minus_one;

reg [15:0] i_operand;
wire [15:0] o_result;
wire o_borrow;

// Instantiate the module under test
minus_one uut (
    .i_operand(i_operand),
    .o_result(o_result),
    .o_borrow(o_borrow)
);

// Test procedure
initial begin
    // Test case 1: Subtracting 1 from 0
    i_operand = 16'b0000000000000000; // 0
    #10;
    if (o_result !== 16'b1111111111111111 || o_borrow !== 1'b1) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Subtracting 1 from 1
    i_operand = 16'b0000000000000001; // 1
    #10;
    if (o_result !== 16'b0000000000000000 || o_borrow !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Subtracting 1 from 2
    i_operand = 16'b0000000000000010; // 2
    #10;
    if (o_result !== 16'b0000000000000001 || o_borrow !== 1'b0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Subtracting 1 from 32767
    i_operand = 16'b0111111111111111; // 32767
    #10;
    if (o_result !== 16'b0111111111111110 || o_borrow !== 1'b0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Subtracting 1 from 32768
    i_operand = 16'b1000000000000000; // 32768
    #10;
    if (o_result !== 16'b0111111111111111 || o_borrow !== 1'b0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Subtracting 1 from 65535
    i_operand = 16'b1111111111111111; // 65535
    #10;
    if (o_result !== 16'b1111111111111110 || o_borrow !== 1'b0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule