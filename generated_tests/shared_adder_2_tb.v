`timescale 1ns/1ps

module tb_shared_adder;

    reg [7:0] a;
    reg [7:0] b;
    reg mode;
    wire [7:0] result;

    // Instantiate the module under test (uut)
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
        if (result !== 8'd25) begin
            $display("FAIL: Test case 1 failed, expected 25 but got %d", result);
            $finish;
        end

        // Test case 2: Subtraction (mode = 1)
        a = 8'd20; b = 8'd5; mode = 1'b1; // 20 - 5 = 15
        #10;
        if (result !== 8'd15) begin
            $display("FAIL: Test case 2 failed, expected 15 but got %d", result);
            $finish;
        end

        // Test case 3: Subtraction resulting in negative (mode = 1)
        a = 8'd5; b = 8'd10; mode = 1'b1; // 5 - 10 = -5 (should wrap around to 251)
        #10;
        if (result !== 8'd251) begin
            $display("FAIL: Test case 3 failed, expected 251 but got %d", result);
            $finish;
        end

        // Test case 4: Addition with carry (mode = 0)
        a = 8'd200; b = 8'd100; mode = 1'b0; // 200 + 100 = 300 (should wrap around to 44)
        #10;
        if (result !== 8'd44) begin
            $display("FAIL: Test case 4 failed, expected 44 but got %d", result);
            $finish;
        end

        // Test case 5: Zero addition (mode = 0)
        a = 8'd0; b = 8'd0; mode = 1'b0; // 0 + 0 = 0
        #10;
        if (result !== 8'd0) begin
            $display("FAIL: Test case 5 failed, expected 0 but got %d", result);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule