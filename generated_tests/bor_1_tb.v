`timescale 1ns/1ps

module tb_bor;

    reg a;
    reg b;
    wire y;

    // Instantiate the module under test (uut)
    bor uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: Test case 1 failed (a=0, b=0)");
            $finish;
        end

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 2 failed (a=0, b=1)");
            $finish;
        end

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 3 failed (a=1, b=0)");
            $finish;
        end

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 4 failed (a=1, b=1)");
            $finish;
        end

        // Test case 5: a = 0, b = 0 (again)
        a = 0; b = 0;
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: Test case 5 failed (a=0, b=0)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule