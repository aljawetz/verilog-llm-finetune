`timescale 1ns/1ps

module tb_not_gate;

    // Inputs
    reg e;

    // Outputs
    wire f;

    // Instantiate the Unit Under Test (UUT)
    not_gate uut (
        .f(f),
        .e(e)
    );

    initial begin
        // Test case 1: e = 0, expect f = 1
        e = 0;
        #10;
        if (f !== 1) begin
            $display("FAIL: Test case 1 failed, expected f = 1 but got f = %b", f);
            $finish;
        end

        // Test case 2: e = 1, expect f = 0
        e = 1;
        #10;
        if (f !== 0) begin
            $display("FAIL: Test case 2 failed, expected f = 0 but got f = %b", f);
            $finish;
        end

        // Test case 3: e = 0, expect f = 1 again
        e = 0;
        #10;
        if (f !== 1) begin
            $display("FAIL: Test case 3 failed, expected f = 1 but got f = %b", f);
            $finish;
        end

        // Test case 4: e = 1, expect f = 0 again
        e = 1;
        #10;
        if (f !== 0) begin
            $display("FAIL: Test case 4 failed, expected f = 0 but got f = %b", f);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule