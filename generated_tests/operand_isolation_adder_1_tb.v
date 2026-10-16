`timescale 1ns/1ps

module tb_operand_isolation_adder;

    reg enable;
    reg [7:0] a, b;
    wire [7:0] sum;

    // Instantiate the Unit Under Test (UUT)
    operand_isolation_adder uut (
        .enable(enable),
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test case 1: Enable is high, a = 5, b = 10
        enable = 1;
        a = 8'd5;
        b = 8'd10;
        #10;
        if (sum !== 8'd15) begin
            $display("FAIL: Test case 1 failed, expected sum = 15, got sum = %d", sum);
            $finish;
        end

        // Test case 2: Enable is low, a = 5, b = 10
        enable = 0;
        a = 8'd5;
        b = 8'd10;
        #10;
        if (sum !== 8'd0) begin
            $display("FAIL: Test case 2 failed, expected sum = 0, got sum = %d", sum);
            $finish;
        end

        // Test case 3: Enable is high, a = 255, b = 1
        enable = 1;
        a = 8'd255;
        b = 8'd1;
        #10;
        if (sum !== 8'd0) begin // 255 + 1 overflows to 0 in 8 bits
            $display("FAIL: Test case 3 failed, expected sum = 0, got sum = %d", sum);
            $finish;
        end

        // Test case 4: Enable is low, a = 100, b = 50
        enable = 0;
        a = 8'd100;
        b = 8'd50;
        #10;
        if (sum !== 8'd0) begin
            $display("FAIL: Test case 4 failed, expected sum = 0, got sum = %d", sum);
            $finish;
        end

        // Test case 5: Enable is high, a = 0, b = 0
        enable = 1;
        a = 8'd0;
        b = 8'd0;
        #10;
        if (sum !== 8'd0) begin
            $display("FAIL: Test case 5 failed, expected sum = 0, got sum = %d", sum);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule