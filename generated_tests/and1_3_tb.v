`timescale 1ns/1ps

module tb_and1;

    // Inputs
    reg a;
    reg b;

    // Output
    wire d;

    // Instantiate the Unit Under Test (UUT)
    and1 uut (
        .a(a),
        .b(b),
        .d(d)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (d !== 0) begin
            $display("FAIL: Test case 1 failed (a=0, b=0, d=%b)", d);
            $finish;
        end

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (d !== 0) begin
            $display("FAIL: Test case 2 failed (a=0, b=1, d=%b)", d);
            $finish;
        end

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (d !== 0) begin
            $display("FAIL: Test case 3 failed (a=1, b=0, d=%b)", d);
            $finish;
        end

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (d !== 1) begin
            $display("FAIL: Test case 4 failed (a=1, b=1, d=%b)", d);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule