`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a, b;
    reg enable;
    reg [3:0] command;
    wire [15:0] y;

    // Instantiate the ALU
    alu uut (
        .a(a),
        .b(b),
        .enable(enable),
        .command(command),
        .y(y)
    );

    initial begin
        // Test case 1: Addition
        a = 8'd10; b = 8'd20; enable = 1; command = 4'b0000; // ADD
        #10;
        if (y !== 16'd30) $display("FAIL: ADD operation failed");

        // Test case 2: Increment
        a = 8'd15; enable = 1; command = 4'b0001; // INC
        #10;
        if (y !== 16'd16) $display("FAIL: INC operation failed");

        // Test case 3: Subtraction
        a = 8'd30; b = 8'd10; enable = 1; command = 4'b0010; // SUB
        #10;
        if (y !== 16'd20) $display("FAIL: SUB operation failed");

        // Test case 4: Decrement
        a = 8'd5; enable = 1; command = 4'b0011; // DEC
        #10;
        if (y !== 16'd4) $display("FAIL: DEC operation failed");

        // Test case 5: Multiplication
        a = 8'd3; b = 8'd4; enable = 1; command = 4'b0100; // MUL
        #10;
        if (y !== 16'd12) $display("FAIL: MUL operation failed");

        // Test case 6: Division
        a = 8'd20; b = 8'd4; enable = 1; command = 4'b0101; // DIV
        #10;
        if (y !== 16'd5) $display("FAIL: DIV operation failed");

        // Test case 7: Shift Left
        a = 8'd1; b = 8'd2; enable = 1; command = 4'b0110; // SHL
        #10;
        if (y !== 16'd4) $display("FAIL: SHL operation failed");

        // Test case 8: Shift Right
        a = 8'd4; b = 8'd2; enable = 1; command = 4'b0111; // SHR
        #10;
        if (y !== 16'd1) $display("FAIL: SHR operation failed");

        // Test case 9: Bitwise AND
        a = 8'd12; b = 8'd5; enable = 1; command = 4'b1001; // AND
        #10;
        if (y !== 16'd4) $display("FAIL: AND operation failed");

        // Test case 10: Bitwise OR
        a = 8'd12; b = 8'd5; enable = 1; command = 4'b1010; // OR
        #10;
        if (y !== 16'd13) $display("FAIL: OR operation failed");

        // Test case 11: Bitwise XOR
        a = 8'd12; b = 8'd5; enable = 1; command = 4'b1101; // XOR
        #10;
        if (y !== 16'd9) $display("FAIL: XOR operation failed");

        // Test case 12: Bitwise NOT
        a = 8'd15; enable = 1; command = 4'b1000; // INV
        #10;
        if (y !== 16'd240) $display("FAIL: INV operation failed");

        // Test case 13: Buffer
        a = 8'd100; enable = 1; command = 4'b1111; // BUF
        #10;
        if (y !== 16'd100) $display("FAIL: BUF operation failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule