`timescale 1ns/1ps

module tb_index5_add;

    reg [3:0] operand;
    wire [7:0] sum;

    // Instantiate the module under test (uut)
    index5_add uut (
        .operand(operand),
        .sum(sum)
    );

    initial begin
        // Test case 1: operand = 4'b0000
        operand = 4'b0000; #10;
        if (sum !== 8'b00000001) begin
            $display("FAIL: Expected sum = 8'b00000001 for operand = 4'b0000, got sum = %b", sum);
            $finish;
        end

        // Test case 2: operand = 4'b0001
        operand = 4'b0001; #10;
        if (sum !== 8'b00000001) begin
            $display("FAIL: Expected sum = 8'b00000001 for operand = 4'b0001, got sum = %b", sum);
            $finish;
        end

        // Test case 3: operand = 4'b0010
        operand = 4'b0010; #10;
        if (sum !== 8'b01000000) begin
            $display("FAIL: Expected sum = 8'b01000000 for operand = 4'b0010, got sum = %b", sum);
            $finish;
        end

        // Test case 4: operand = 4'b0100
        operand = 4'b0100; #10;
        if (sum !== 8'b10000000) begin
            $display("FAIL: Expected sum = 8'b10000000 for operand = 4'b0100, got sum = %b", sum);
            $finish;
        end

        // Test case 5: operand = 4'b0110
        operand = 4'b0110; #10;
        if (sum !== 8'b11000000) begin
            $display("FAIL: Expected sum = 8'b11000000 for operand = 4'b0110, got sum = %b", sum);
            $finish;
        end

        // Test case 6: operand = 4'b1111
        operand = 4'b1111; #10;
        if (sum !== 8'b11000000) begin
            $display("FAIL: Expected sum = 8'b11000000 for operand = 4'b1111, got sum = %b", sum);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule