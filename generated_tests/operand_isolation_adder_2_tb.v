`timescale 1ns/1ps

module tb_operand_isolation_adder;

    reg enable;
    reg [7:0] a, b;
    wire [7:0] sum;

    // Instantiate the module under test (uut)
    operand_isolation_adder uut (
        .enable(enable),
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test case 1: Enable is low, expect sum to be 0
        enable = 0; a = 8'h12; b = 8'h34;
        #10;
        if (sum !== 8'b0) begin
            $display("FAIL: Expected sum to be 0 when enable is low");
            $finish;
        end

        // Test case 2: Enable is high, expect sum to be a + b
        enable = 1; a = 8'h12; b = 8'h34;
        #10;
        if (sum !== (a + b)) begin
            $display("FAIL: Expected sum to be %h when enable is high", a + b);
            $finish;
        end

        // Test case 3: Enable is low again, expect sum to be 0
        enable = 0; a = 8'hFF; b = 8'h01;
        #10;
        if (sum !== 8'b0) begin
            $display("FAIL: Expected sum to be 0 when enable is low");
            $finish;
        end

        // Test case 4: Enable is high with different values
        enable = 1; a = 8'hAA; b = 8'h55;
        #10;
        if (sum !== (a + b)) begin
            $display("FAIL: Expected sum to be %h when enable is high", a + b);
            $finish;
        end

        // Test case 5: Enable is high with maximum values
        enable = 1; a = 8'hFF; b = 8'h01;
        #10;
        if (sum !== (a + b)) begin
            $display("FAIL: Expected sum to be %h when enable is high", a + b);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule