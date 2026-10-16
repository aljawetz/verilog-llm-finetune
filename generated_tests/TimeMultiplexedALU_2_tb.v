`timescale 1ns/1ps

module tb_TimeMultiplexedALU;

    reg [1:0] op_code;
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] result;

    // Instantiate the module under test (uut)
    TimeMultiplexedALU uut (
        .op_code(op_code),
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Test Addition
        op_code = 2'b00; a = 8'd15; b = 8'd10; #10;
        if (result !== 8'd25) $display("FAIL: Addition test failed, expected 25 but got %d", result);

        // Test Subtraction
        op_code = 2'b01; a = 8'd20; b = 8'd5; #10;
        if (result !== 8'd15) $display("FAIL: Subtraction test failed, expected 15 but got %d", result);

        // Test Bitwise AND
        op_code = 2'b10; a = 8'b11001100; b = 8'b10101010; #10;
        if (result !== 8'b10001000) $display("FAIL: Bitwise AND test failed, expected 10001000 but got %b", result);

        // Test Bitwise OR
        op_code = 2'b11; a = 8'b11001100; b = 8'b10101010; #10;
        if (result !== 8'b11101110) $display("FAIL: Bitwise OR test failed, expected 11101110 but got %b", result);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule