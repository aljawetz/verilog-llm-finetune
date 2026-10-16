`timescale 1ns/1ps

module tb_nbit_square;
    parameter n = 4;
    parameter total_tests = 5;

    reg [n-1:0] num;
    wire [2*n-1:0] result;
    
    // Instantiate the module under test
    nbit_square #(n) uut (
        .num(num),
        .result(result)
    );

    initial begin
        // Test cases
        num = 4'b0000; // 0^2 = 0
        #10;
        if (result !== 8'b00000000) begin
            $display("FAIL: Test case 1 failed for input %b", num);
            $finish;
        end

        num = 4'b0001; // 1^2 = 1
        #10;
        if (result !== 8'b00000001) begin
            $display("FAIL: Test case 2 failed for input %b", num);
            $finish;
        end

        num = 4'b0010; // 2^2 = 4
        #10;
        if (result !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed for input %b", num);
            $finish;
        end

        num = 4'b0011; // 3^2 = 9
        #10;
        if (result !== 8'b00001001) begin
            $display("FAIL: Test case 4 failed for input %b", num);
            $finish;
        end

        num = 4'b0100; // 4^2 = 16
        #10;
        if (result !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed for input %b", num);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule