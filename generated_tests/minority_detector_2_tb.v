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
            $display("FAIL: Test case 1 failed (0, 0, 0)");
            $finish;
        end

        // Test case 2: One input high
        in1 = 1; in2 = 0; in3 = 0;
        #10;
        if (out !== 1) begin
            $display("FAIL: Test case 2 failed (1, 0, 0)");
            $finish;
        end

        // Test case 3: Another input high
        in1 = 0; in2 = 1; in3 = 0;
        #10;
        if (out !== 1) begin
            $display("FAIL: Test case 3 failed (0, 1, 0)");
            $finish;
        end

        // Test case 4: Last input high
        in1 = 0; in2 = 0; in3 = 1;
        #10;
        if (out !== 1) begin
            $display("FAIL: Test case 4 failed (0, 0, 1)");
            $finish;
        end

        // Test case 5: Two inputs high
        in1 = 1; in2 = 1; in3 = 0;
        #10;
        if (out !== 0) begin
            $display("FAIL: Test case 5 failed (1, 1, 0)");
            $finish;
        end

        // Test case 6: Another two inputs high
        in1 = 1; in2 = 0; in3 = 1;
        #10;
        if (out !== 0) begin
            $display("FAIL: Test case 6 failed (1, 0, 1)");
            $finish;
        end

        // Test case 7: All inputs high
        in1 = 1; in2 = 1; in3 = 1;
        #10;
        if (out !== 0) begin
            $display("FAIL: Test case 7 failed (1, 1, 1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule