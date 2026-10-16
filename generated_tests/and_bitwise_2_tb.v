`timescale 1ns/1ps

module tb_and_bitwise;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] and_result;

    // Instantiate the module under test (uut)
    and_bitwise uut (
        .a(a),
        .b(b),
        .and_result(and_result)
    );

    initial begin
        // Test case 1: Both inputs are 0
        a = 8'b00000000;
        b = 8'b00000000;
        #10;
        if (and_result !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: One input is 0
        a = 8'b10101010;
        b = 8'b00000000;
        #10;
        if (and_result !== 8'b00000000) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Both inputs are the same
        a = 8'b11110000;
        b = 8'b11110000;
        #10;
        if (and_result !== 8'b11110000) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Different inputs
        a = 8'b10101010;
        b = 8'b11001100;
        #10;
        if (and_result !== 8'b10001000) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: All bits set
        a = 8'b11111111;
        b = 8'b11111111;
        #10;
        if (and_result !== 8'b11111111) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Mixed bits
        a = 8'b10111100;
        b = 8'b01010101;
        #10;
        if (and_result !== 8'b00010100) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule