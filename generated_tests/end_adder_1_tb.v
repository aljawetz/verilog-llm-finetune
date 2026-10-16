`timescale 1ns/1ps

module tb_end_adder;

    // Inputs
    reg in1;
    reg in2;

    // Output
    wire sum;

    // Instantiate the Unit Under Test (UUT)
    end_adder uut (
        .sum(sum),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: in1 = 0, in2 = 0
        in1 = 0; in2 = 0;
        #10;
        if (sum !== 0) begin
            $display("FAIL: Test case 1 failed (in1=0, in2=0)");
            $finish;
        end

        // Test case 2: in1 = 0, in2 = 1
        in1 = 0; in2 = 1;
        #10;
        if (sum !== 1) begin
            $display("FAIL: Test case 2 failed (in1=0, in2=1)");
            $finish;
        end

        // Test case 3: in1 = 1, in2 = 0
        in1 = 1; in2 = 0;
        #10;
        if (sum !== 1) begin
            $display("FAIL: Test case 3 failed (in1=1, in2=0)");
            $finish;
        end

        // Test case 4: in1 = 1, in2 = 1
        in1 = 1; in2 = 1;
        #10;
        if (sum !== 0) begin
            $display("FAIL: Test case 4 failed (in1=1, in2=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule