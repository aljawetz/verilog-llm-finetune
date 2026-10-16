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
        // Test case 1: Enable is low, expect sum = 0
        enable = 0; a = 8'hFF; b = 8'h01; // 255 + 1 = 256 (but should be 0)
        #10;
        if (sum !== 8'b00000000) begin
            $display("FAIL: Expected sum = 0 when enable = 0");
            $finish;
        end

        // Test case 2: Enable is high, expect sum = a + b
        enable = 1; a = 8'hFF; b = 8'h01; // 255 + 1 = 256
        #10;
        if (sum !== 8'h00) begin // 256 wraps to 0 in 8 bits
            $display("FAIL: Expected sum = 0x00 when a = 0xFF and b = 0x01 with enable = 1");
            $finish;
        end

        // Test case 3: Enable is high, different values
        a = 8'h0A; b = 8'h05; // 10 + 5 = 15
        #10;
        if (sum !== 8'h0F) begin
            $display("FAIL: Expected sum = 0x0F when a = 0x0A and b = 0x05 with enable = 1");
            $finish;
        end

        // Test case 4: Enable is low again, expect sum = 0
        enable = 0; a = 8'h12; b = 8'h34; // 18 + 52 = 70 (but should be 0)
        #10;
        if (sum !== 8'b00000000) begin
            $display("FAIL: Expected sum = 0 when enable = 0");
            $finish;
        end

        // Test case 5: Enable is high, expect sum = a + b
        enable = 1; a = 8'h20; b = 8'h30; // 32 + 48 = 80
        #10;
        if (sum !== 8'h50) begin
            $display("FAIL: Expected sum = 0x50 when a = 0x20 and b = 0x30 with enable = 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule