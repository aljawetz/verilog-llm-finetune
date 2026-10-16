`timescale 1ns/1ps

module tb_divider2;

    reg D;
    reg CLK;
    reg RES;
    reg ENABLE;
    wire Q;
    wire QN;

    // Instantiate the module under test
    divider2 uut (
        .D(D),
        .CLK(CLK),
        .Q(Q),
        .ENABLE(ENABLE),
        .QN(QN),
        .RES(RES)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        D = 0;
        RES = 1; // Assert reset
        ENABLE = 0;

        // Wait for a clock cycle
        #10;
        RES = 0; // Deassert reset

        // Test case 1: Check reset functionality
        #10;
        if (Q !== 0 || QN !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and QN to 1");
            $finish;
        end

        // Test case 2: Check ENABLE functionality
        ENABLE = 1;
        D = 1; // Set D to 1
        #10;
        if (Q !== 1 || QN !== 0) begin
            $display("FAIL: Q did not update to D when ENABLE is high");
            $finish;
        end

        // Test case 3: Check D changes when ENABLE is high
        D = 0; // Change D to 0
        #10;
        if (Q !== 0 || QN !== 1) begin
            $display("FAIL: Q did not update to D when ENABLE is high");
            $finish;
        end

        // Test case 4: Check that Q does not change when ENABLE is low
        ENABLE = 0;
        D = 1; // Change D to 1
        #10;
        if (Q !== 0 || QN !== 1) begin
            $display("FAIL: Q changed when ENABLE is low");
            $finish;
        end

        // Test case 5: Check reset functionality again
        RES = 1; // Assert reset
        #10;
        if (Q !== 0 || QN !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and QN to 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule