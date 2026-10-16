`timescale 1ns/1ps

module tb_df_f;

    reg clk;
    reg reset;
    reg d;
    wire q;
    wire qb;

    // Instantiate the module under test (uut)
    df_f uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .qb(qb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check initial state after reset
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Test case 2: Set d = 1 and check output
        d = 1;
        #10; // Wait for clock edge
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Output after setting d=1 is incorrect");
            $finish;
        end

        // Test case 3: Set d = 0 and check output
        d = 0;
        #10; // Wait for clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Output after setting d=0 is incorrect");
            $finish;
        end

        // Test case 4: Assert reset functionality
        reset = 1;
        #10; // Wait for clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Output after asserting reset is incorrect");
            $finish;
        end

        // Test case 5: Check behavior with multiple clock cycles
        reset = 0;
        d = 1;
        #10; // Wait for clock edge
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Output after setting d=1 again is incorrect");
            $finish;
        end

        d = 0;
        #10; // Wait for clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Output after setting d=0 again is incorrect");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule