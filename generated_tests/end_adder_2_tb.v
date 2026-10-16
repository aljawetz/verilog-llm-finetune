`timescale 1ns/1ps

module tb_end_adder;
    reg in1;
    reg in2;
    wire sum;

    // Instantiate the module under test (uut)
    end_adder uut (
        .sum(sum),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        in1 = 0; in2 = 0;
        #10;
        if (sum !== 0) begin
            $display("FAIL: Test case 1 failed, expected sum = 0, got sum = %b", sum);
            $finish;
        end

        // Test case 2: 0 + 1 = 1
        in1 = 0; in2 = 1;
        #10;
        if (sum !== 1) begin
            $display("FAIL: Test case 2 failed, expected sum = 1, got sum = %b", sum);
            $finish;
        end

        // Test case 3: 1 + 0 = 1
        in1 = 1; in2 = 0;
        #10;
        if (sum !== 1) begin
            $display("FAIL: Test case 3 failed, expected sum = 1, got sum = %b", sum);
            $finish;
        end

        // Test case 4: 1 + 1 = 0 (since it's one-bit addition)
        in1 = 1; in2 = 1;
        #10;
        if (sum !== 0) begin
            $display("FAIL: Test case 4 failed, expected sum = 0, got sum = %b", sum);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule