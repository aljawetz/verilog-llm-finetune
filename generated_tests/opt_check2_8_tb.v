`timescale 1ns/1ps

module tb_opt_check2;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    opt_check2 uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test case 1: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 1 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 2: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 2 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 3: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 4: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test case 5: a = 0, b = X (unknown)
        a = 0; b = 1'bx;
        #10;
        if (y !== 1'bx) begin
            $display("FAIL: Test case 5 failed, expected y = X, got y = %b", y);
            $finish;
        end

        // Test case 6: a = 1, b = X (unknown)
        a = 1; b = 1'bx;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test case 6 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule