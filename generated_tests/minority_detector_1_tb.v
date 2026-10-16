`timescale 1ns/1ps

module tb_minority_detector;

    reg in1, in2, in3;
    wire out;

    // Instantiate the module under test (uut)
    minority_detector uut (
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .out(out)
    );

    initial begin
        // Test case 1: All inputs low
        in1 = 0; in2 = 0; in3 = 0;
        #10;
        if (out !== 1) begin
            $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 2: One input high
        in1 = 1; in2 = 0; in3 = 0;
        #10;
        if (out !== 1) begin
            $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 3: Two inputs high
        in1 = 1; in2 = 1; in3 = 0;
        #10;
        if (out !== 0) begin
            $display("FAIL: Test case 3 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 4: All inputs high
        in1 = 1; in2 = 1; in3 = 1;
        #10;
        if (out !== 0) begin
            $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 5: Two inputs high, one low
        in1 = 0; in2 = 1; in3 = 1;
        #10;
        if (out !== 0) begin
            $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 6: Random combination
        in1 = 0; in2 = 0; in3 = 1;
        #10;
        if (out !== 1) begin
            $display("FAIL: Test case 6 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule