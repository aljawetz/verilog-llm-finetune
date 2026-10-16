`timescale 1ns/1ps

module tb_fsm1001_nov2;
    reg clk;
    reg rst;
    reg in;
    wire out;

    // Instantiate the module under test
    fsm1001_nov2 uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        in = 0;
        #10;

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check initial state (S0)
        if (uut.out !== 0) begin
            $display("FAIL: Initial state output is not 0");
            $finish;
        end

        // Test case 2: Transition to S1
        in = 1; // S0 -> S1
        #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output is not 0 in state S1");
            $finish;
        end

        // Test case 3: Transition to S2
        in = 0; // S1 -> S2
        #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output is not 0 in state S2");
            $finish;
        end

        // Test case 4: Transition to S3
        in = 0; // S2 -> S3
        #10;
        if (uut.out !== 1) begin
            $display("FAIL: Output is not 1 in state S3");
            $finish;
        end

        // Test case 5: Transition back to S0
        in = 1; // S3 -> S0
        #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output is not 0 after returning to S0");
            $finish;
        end

        // Test case 6: Check S1 again
        in = 1; // S0 -> S1
        #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output is not 0 in state S1 again");
            $finish;
        end

        // Test case 7: S1 to S2
        in = 0; // S1 -> S2
        #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output is not 0 in state S2 again");
            $finish;
        end

        // Test case 8: S2 to S3
        in = 0; // S2 -> S3
        #10;
        if (uut.out !== 1) begin
            $display("FAIL: Output is not 1 in state S3 again");
            $finish;
        end

        // Test case 9: S3 to S0
        in = 1; // S3 -> S0
        #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output is not 0 after returning to S0 again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule