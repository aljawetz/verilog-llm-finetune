`timescale 1ns/1ps

module tb_logic_reduce;

    // Testbench signals
    reg clk;
    reg non_critical;
    reg critical;
    reg additional_condition1;
    reg additional_condition2;
    reg in1;
    reg in2;
    wire out1;

    // Instantiate the module under test (uut)
    logic_reduce uut (
        .clk(clk),
        .non_critical(non_critical),
        .critical(critical),
        .additional_condition1(additional_condition1),
        .additional_condition2(additional_condition2),
        .in1(in1),
        .in2(in2),
        .out1(out1)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        non_critical = 0;
        critical = 0;
        additional_condition1 = 0;
        additional_condition2 = 0;
        in1 = 1'b1;
        in2 = 1'b0;

        // Wait for a clock cycle
        #10;

        // Test case 1: Critical conditions not met
        critical = 0;
        additional_condition1 = 0;
        additional_condition2 = 0;
        #10;
        if (out1 !== in2) begin
            $display("FAIL: Test case 1 failed, expected out1 = %b, got out1 = %b", in2, out1);
            $finish;
        end

        // Test case 2: Critical conditions met, non_critical = 0
        critical = 1;
        additional_condition1 = 1;
        additional_condition2 = 1;
        non_critical = 0;
        #10;
        if (out1 !== in2) begin
            $display("FAIL: Test case 2 failed, expected out1 = %b, got out1 = %b", in2, out1);
            $finish;
        end

        // Test case 3: Critical conditions met, non_critical = 1
        non_critical = 1;
        #10;
        if (out1 !== in1) begin
            $display("FAIL: Test case 3 failed, expected out1 = %b, got out1 = %b", in1, out1);
            $finish;
        end

        // Test case 4: Critical conditions not met again
        critical = 0;
        additional_condition1 = 0;
        additional_condition2 = 0;
        #10;
        if (out1 !== in2) begin
            $display("FAIL: Test case 4 failed, expected out1 = %b, got out1 = %b", in2, out1);
            $finish;
        end

        // Test case 5: Change inputs and check
        in1 = 1'b0;
        in2 = 1'b1;
        critical = 1;
        additional_condition1 = 1;
        additional_condition2 = 1;
        non_critical = 0;
        #10;
        if (out1 !== in2) begin
            $display("FAIL: Test case 5 failed, expected out1 = %b, got out1 = %b", in2, out1);
            $finish;
        end

        non_critical = 1;
        #10;
        if (out1 !== in1) begin
            $display("FAIL: Test case 5 failed, expected out1 = %b, got out1 = %b", in1, out1);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule