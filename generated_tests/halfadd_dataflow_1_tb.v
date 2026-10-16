`timescale 1ns/1ps

module tb_halfadd_dataflow;

    // Inputs
    reg inputA;
    reg inputB;

    // Outputs
    wire sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    halfadd_dataflow uut (
        .inputA(inputA),
        .inputB(inputB),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test case 1: inputA = 0, inputB = 0
        inputA = 0; inputB = 0;
        #10;
        if (sum !== 0 || carry !== 0) begin
            $display("FAIL: Test case 1 failed (inputA=0, inputB=0)");
            $finish;
        end

        // Test case 2: inputA = 0, inputB = 1
        inputA = 0; inputB = 1;
        #10;
        if (sum !== 1 || carry !== 0) begin
            $display("FAIL: Test case 2 failed (inputA=0, inputB=1)");
            $finish;
        end

        // Test case 3: inputA = 1, inputB = 0
        inputA = 1; inputB = 0;
        #10;
        if (sum !== 1 || carry !== 0) begin
            $display("FAIL: Test case 3 failed (inputA=1, inputB=0)");
            $finish;
        end

        // Test case 4: inputA = 1, inputB = 1
        inputA = 1; inputB = 1;
        #10;
        if (sum !== 0 || carry !== 1) begin
            $display("FAIL: Test case 4 failed (inputA=1, inputB=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule