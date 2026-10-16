`timescale 1ns/1ps

module tb_half_adder;

    // Inputs
    reg in1;
    reg in2;

    // Outputs
    wire sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    half_adder uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: in1 = 0, in2 = 0
        in1 = 0; in2 = 0;
        #10;
        if (sum !== 0 || cout !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: in1 = 0, in2 = 1
        in1 = 0; in2 = 1;
        #10;
        if (sum !== 1 || cout !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: in1 = 1, in2 = 0
        in1 = 1; in2 = 0;
        #10;
        if (sum !== 1 || cout !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: in1 = 1, in2 = 1
        in1 = 1; in2 = 1;
        #10;
        if (sum !== 0 || cout !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule