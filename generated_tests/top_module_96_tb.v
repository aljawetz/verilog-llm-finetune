`timescale 1ns/1ps

module tb_top_module;

    reg a;
    reg b;
    reg c;
    reg d;
    wire out;
    wire out_n;

    // Instantiate the module under test
    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out),
        .out_n(out_n)
    );

    initial begin
        // Test case 1: a=0, b=0, c=0, d=0
        a = 0; b = 0; c = 0; d = 0;
        #10;
        if (out !== 0 || out_n !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a=0, b=0, c=0, d=1
        a = 0; b = 0; c = 0; d = 1;
        #10;
        if (out !== 0 || out_n !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a=0, b=1, c=0, d=0
        a = 0; b = 1; c = 0; d = 0;
        #10;
        if (out !== 0 || out_n !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a=1, b=1, c=0, d=0
        a = 1; b = 1; c = 0; d = 0;
        #10;
        if (out !== 1 || out_n !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a=0, b=0, c=1, d=1
        a = 0; b = 0; c = 1; d = 1;
        #10;
        if (out !== 1 || out_n !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: a=1, b=0, c=1, d=1
        a = 1; b = 0; c = 1; d = 1;
        #10;
        if (out !== 1 || out_n !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: a=1, b=1, c=1, d=0
        a = 1; b = 1; c = 1; d = 0;
        #10;
        if (out !== 1 || out_n !== 0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: a=1, b=1, c=1, d=1
        a = 1; b = 1; c = 1; d = 1;
        #10;
        if (out !== 1 || out_n !== 0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule