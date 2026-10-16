`timescale 1ns/1ps

module tb_ALU_8bit;

    reg [7:0] a, b;
    reg [4:0] command;
    reg enable;
    wire [15:0] y;

    // Instantiate the ALU_8bit module
    ALU_8bit uut (
        .a(a),
        .b(b),
        .command(command),
        .enable(enable),
        .y(y)
    );

    initial begin
        // Test case 1: Addition
        a = 8'd10; b = 8'd20; command = 5'b00000; enable = 1;
        #10;
        if (y !== 16'd30) $display("FAIL: Addition failed, expected 30, got %d", y);

        // Test case 2: Subtraction
        a = 8'd30; b = 8'd10; command = 5'b00001; enable = 1;
        #10;
        if (y !== 16'd20) $display("FAIL: Subtraction failed, expected 20, got %d", y);

        // Test case 3: Multiplication
        a = 8'd5; b = 8'd6; command = 5'b00010; enable = 1;
        #10;
        if (y !== 16'd30) $display("FAIL: Multiplication failed, expected 30, got %d", y);

        // Test case 4: Division
        a = 8'd20; b = 8'd5; command = 5'b00011; enable = 1;
        #10;
        if (y !== 16'd4) $display("FAIL: Division failed, expected 4, got %d", y);

        // Test case 5: AND operation
        a = 8'b11001100; b = 8'b10101010; command = 5'b00100; enable = 1;
        #10;
        if (y !== 16'b10001000) $display("FAIL: AND operation failed, expected 10001000, got %b", y);

        // Test case 6: OR operation
        a = 8'b11001100; b = 8'b10101010; command = 5'b00101; enable = 1;
        #10;
        if (y !== 16'b11101110) $display("FAIL: OR operation failed, expected 11101110, got %b", y);

        // Test case 7: NOT A operation
        a = 8'b00001111; command = 5'b01111; enable = 1;
        #10;
        if (y !== 16'b11110000) $display("FAIL: NOT A operation failed, expected 11110000, got %b", y);

        // Test case 8: Comparison
        a = 8'd15; b = 8'd15; command = 5'b10011; enable = 1;
        #10;
        if (y !== 16'b1) $display("FAIL: Comparison failed, expected 1, got %d", y);

        // Test case 9: Maximum
        a = 8'd10; b = 8'd20; command = 5'b10100; enable = 1;
        #10;
        if (y !== 16'd20) $display("FAIL: Maximum failed, expected 20, got %d", y);

        // Test case 10: Minimum
        a = 8'd10; b = 8'd20; command = 5'b10101; enable = 1;
        #10;
        if (y !== 16'd10) $display("FAIL: Minimum failed, expected 10, got %d", y);

        // Test case 11: High impedance when disabled
        enable = 0;
        a = 8'd10; b = 8'd20; command = 5'b00000;
        #10;
        if (y !== 16'hZZZZ) $display("FAIL: Expected high impedance, got %b", y);

        $display("PASS");
        $finish;
    end

endmodule