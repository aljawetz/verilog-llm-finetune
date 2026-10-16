`timescale 1ns/1ps

module tb_isDiv3_3b;

    reg [2:0] number;
    wire divisible;

    // Instantiate the module under test (uut)
    isDiv3_3b uut (
        .number(number),
        .divisible(divisible)
    );

    initial begin
        // Test case 1: number = 3 (should be divisible)
        number = 3'd3;
        #10;
        if (divisible !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected divisible = 1, got %b", divisible);
            $finish;
        end

        // Test case 2: number = 6 (should be divisible)
        number = 3'd6;
        #10;
        if (divisible !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected divisible = 1, got %b", divisible);
            $finish;
        end

        // Test case 3: number = 0 (should not be divisible)
        number = 3'd0;
        #10;
        if (divisible !== 1'b0) begin
            $display("FAIL: Test case 3 failed, expected divisible = 0, got %b", divisible);
            $finish;
        end

        // Test case 4: number = 1 (should not be divisible)
        number = 3'd1;
        #10;
        if (divisible !== 1'b0) begin
            $display("FAIL: Test case 4 failed, expected divisible = 0, got %b", divisible);
            $finish;
        end

        // Test case 5: number = 2 (should not be divisible)
        number = 3'd2;
        #10;
        if (divisible !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected divisible = 0, got %b", divisible);
            $finish;
        end

        // Test case 6: number = 4 (should not be divisible)
        number = 3'd4;
        #10;
        if (divisible !== 1'b0) begin
            $display("FAIL: Test case 6 failed, expected divisible = 0, got %b", divisible);
            $finish;
        end

        // Test case 7: number = 5 (should not be divisible)
        number = 3'd5;
        #10;
        if (divisible !== 1'b0) begin
            $display("FAIL: Test case 7 failed, expected divisible = 0, got %b", divisible);
            $finish;
        end

        // Test case 8: number = 7 (should not be divisible)
        number = 3'd7;
        #10;
        if (divisible !== 1'b0) begin
            $display("FAIL: Test case 8 failed, expected divisible = 0, got %b", divisible);
            $finish;
        end

        // Test case 9: number = 8 (should not be divisible)
        number = 3'd8;
        #10;
        if (divisible !== 1'b0) begin
            $display("FAIL: Test case 9 failed, expected divisible = 0, got %b", divisible);
            $finish;
        end

        // Test case 10: number = 7 (should not be divisible)
        number = 3'd7;
        #10;
        if (divisible !== 1'b0) begin
            $display("FAIL: Test case 10 failed, expected divisible = 0, got %b", divisible);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule