`timescale 1ns/1ps

module tb_adder_half;

    reg a;
    reg b;
    wire c;
    wire s;

    // Instantiate the half adder
    adder_half uut (
        .a(a),
        .b(b),
        .c(c),
        .s(s)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (c !== 0 || s !== 0) begin
            $display("FAIL: Test case 1 failed (a=0, b=0)");
            $finish;
        end

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (c !== 0 || s !== 1) begin
            $display("FAIL: Test case 2 failed (a=0, b=1)");
            $finish;
        end

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (c !== 0 || s !== 1) begin
            $display("FAIL: Test case 3 failed (a=1, b=0)");
            $finish;
        end

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (c !== 1 || s !== 0) begin
            $display("FAIL: Test case 4 failed (a=1, b=1)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule