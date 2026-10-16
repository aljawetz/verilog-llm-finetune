`timescale 1ns/1ps

module tb_not1;

    reg in1;
    wire out;

    // Instantiate the module under test (uut)
    not1 uut (
        .out(out),
        .in1(in1)
    );

    initial begin
        // Test sequence
        // Test case 1: in1 = 0, expect out = 1
        in1 = 0;
        #10;
        if (out !== 1) begin
            $display("FAIL: Test case 1 failed, expected out = 1 but got out = %b", out);
            $finish;
        end

        // Test case 2: in1 = 1, expect out = 0
        in1 = 1;
        #10;
        if (out !== 0) begin
            $display("FAIL: Test case 2 failed, expected out = 0 but got out = %b", out);
            $finish;
        end

        // Test case 3: in1 = 0, expect out = 1 again
        in1 = 0;
        #10;
        if (out !== 1) begin
            $display("FAIL: Test case 3 failed, expected out = 1 but got out = %b", out);
            $finish;
        end

        // Test case 4: in1 = 1, expect out = 0 again
        in1 = 1;
        #10;
        if (out !== 0) begin
            $display("FAIL: Test case 4 failed, expected out = 0 but got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule