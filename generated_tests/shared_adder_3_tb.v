`timescale 1ns/1ps

module tb_shared_adder;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg mode;

    // Output
    wire [7:0] result;

    // Instantiate the Unit Under Test (UUT)
    shared_adder uut (
        .a(a),
        .b(b),
        .mode(mode),
        .result(result)
    );

    initial begin
        // Test case 1: Addition (mode = 0)
        a = 8'd15; b = 8'd10; mode = 1'b0; // 15 + 10 = 25
        #10;
        if (result !== 8'd25) $display("FAIL: Test case 1 failed, expected 25 but got %d", result);

        // Test case 2: Subtraction (mode = 1)
        a = 8'd20; b = 8'd5; mode = 1'b1; // 20 - 5 = 15
        #10;
        if (result !== 8'd15) $display("FAIL: Test case 2 failed, expected 15 but got %d", result);

        // Test case 3: Addition with overflow (mode = 0)
        a = 8'd200; b = 8'd100; mode = 1'b0; // 200 + 100 = 300 (overflow)
        #10;
        if (result !== 8'd44) $display("FAIL: Test case 3 failed, expected 44 but got %d", result); // 300 % 256 = 44

        // Test case 4: Subtraction resulting in negative (mode = 1)
        a = 8'd10; b = 8'd20; mode = 1'b1; // 10 - 20 = -10 (two's complement)
        #10;
        if (result !== 8'd246) $display("FAIL: Test case 4 failed, expected 246 but got %d", result); // -10 in two's complement

        // Test case 5: Zero addition (mode = 0)
        a = 8'd0; b = 8'd0; mode = 1'b0; // 0 + 0 = 0
        #10;
        if (result !== 8'd0) $display("FAIL: Test case 5 failed, expected 0 but got %d", result);

        // Test case 6: Zero subtraction (mode = 1)
        a = 8'd0; b = 8'd0; mode = 1'b1; // 0 - 0 = 0
        #10;
        if (result !== 8'd0) $display("FAIL: Test case 6 failed, expected 0 but got %d", result);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule