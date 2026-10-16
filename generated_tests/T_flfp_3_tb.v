`timescale 1ns/1ps

module tb_T_flfp;

    // Inputs
    reg T;
    reg clk;
    reg reset;

    // Outputs
    wire Q;
    wire Qb;

    // Instantiate the Unit Under Test (UUT)
    T_flfp uut (
        .T(T),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qb(Qb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        T = 0;
        reset = 1;

        // Wait for a clock edge
        #10;
        reset = 0; // Release reset

        // Test case 1: T = 0, Q should remain 0
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when T is 1 and Q was 0");
            $finish;
        end

        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again");
            $finish;
        end

        // Test case 3: Assert reset, Q should be 0
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle after reset
        reset = 0;
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling from reset state");
            $finish;
        end

        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again");
            $finish;
        end

        // Test case 5: T = 0, Q should remain the same
        T = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when T is 0");
            $finish;
        end

        // Test case 6: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when T is 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule