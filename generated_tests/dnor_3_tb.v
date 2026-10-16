`timescale 1ns/1ps

module tb_dnor;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire y;

    // Instantiate the Unit Under Test (UUT)
    dnor uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test Case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test Case 1 failed (a=0, b=0)");
            $finish;
        end

        // Test Case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test Case 2 failed (a=0, b=1)");
            $finish;
        end

        // Test Case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test Case 3 failed (a=1, b=0)");
            $finish;
        end

        // Test Case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test Case 4 failed (a=1, b=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule