`timescale 1ns/1ps

module tb_full_adder;

    reg a, b, carry_in;
    wire s, carry_out;

    // Instantiate the full adder module
    full_adder uut (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .s(s),
        .carry_out(carry_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, carry_out = 0
        a = 0; b = 0; carry_in = 0;
        #10;
        if (s !== 0 || carry_out !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 0 + 0 + 1 = 1, carry_out = 0
        a = 0; b = 0; carry_in = 1;
        #10;
        if (s !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 0 + 1 + 0 = 1, carry_out = 0
        a = 0; b = 1; carry_in = 0;
        #10;
        if (s !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 0 + 1 + 1 = 0, carry_out = 1
        a = 0; b = 1; carry_in = 1;
        #10;
        if (s !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 1 + 0 + 0 = 1, carry_out = 0
        a = 1; b = 0; carry_in = 0;
        #10;
        if (s !== 1 || carry_out !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 1 + 0 + 1 = 0, carry_out = 1
        a = 1; b = 0; carry_in = 1;
        #10;
        if (s !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 1 + 1 + 0 = 0, carry_out = 1
        a = 1; b = 1; carry_in = 0;
        #10;
        if (s !== 0 || carry_out !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 1 + 1 + 1 = 1, carry_out = 1
        a = 1; b = 1; carry_in = 1;
        #10;
        if (s !== 1 || carry_out !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule