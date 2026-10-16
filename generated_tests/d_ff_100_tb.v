`timescale 1ns/1ps

module tb_d_ff;

    // Inputs
    reg d;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire qb;

    // Instantiate the Unit Under Test (UUT)
    d_ff uut (
        .q(q),
        .qb(qb),
        .d(d),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; d = 0;
        #10; // Wait for 10ns

        // Assert reset functionality
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test D flip-flop behavior
        d = 1; #10; // Set d to 1
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: After d=1, q should be 1 and qb should be 0");
            $finish;
        end

        d = 0; #10; // Set d to 0
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: After d=0, q should be 0 and qb should be 1");
            $finish;
        end

        // Test reset again
        rst = 1; #10; // Assert reset
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule