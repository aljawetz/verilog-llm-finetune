`timescale 1ns/1ps

module tb_fp_mul_10;

    reg [9:0] a;
    reg [9:0] b;
    wire [19:0] result;

    // Instantiate the module under test
    fp_mul_10 uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Test case 1: 3 * 2 = 6
        a = 10'b0000000011; // 3 in binary
        b = 10'b0000000010; // 2 in binary
        #10;
        if (result !== 20'b0000000000000110) begin
            $display("FAIL: Test case 1 failed, expected 6, got %d", result);
            $finish;
        end

        // Test case 2: 5 * 4 = 20
        a = 10'b0000000101; // 5 in binary
        b = 10'b0000000100; // 4 in binary
        #10;
        if (result !== 20'b0000000000010100) begin
            $display("FAIL: Test case 2 failed, expected 20, got %d", result);
            $finish;
        end

        // Test case 3: 7 * 8 = 56
        a = 10'b0000000111; // 7 in binary
        b = 10'b0000001000; // 8 in binary
        #10;
        if (result !== 20'b0000000000111000) begin
            $display("FAIL: Test case 3 failed, expected 56, got %d", result);
            $finish;
        end

        // Test case 4: 0 * 10 = 0
        a = 10'b0000000000; // 0 in binary
        b = 10'b0000001010; // 10 in binary
        #10;
        if (result !== 20'b0000000000000000) begin
            $display("FAIL: Test case 4 failed, expected 0, got %d", result);
            $finish;
        end

        // Test case 5: 15 * 15 = 225
        a = 10'b0000001111; // 15 in binary
        b = 10'b0000001111; // 15 in binary
        #10;
        if (result !== 20'b0000000011100001) begin
            $display("FAIL: Test case 5 failed, expected 225, got %d", result);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule