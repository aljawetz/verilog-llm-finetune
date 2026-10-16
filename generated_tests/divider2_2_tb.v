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
        // Initialize signals
        D = 0;
        RES = 0;
        ENABLE = 0;

        // Test 1: Reset functionality
        RES = 1; // Assert reset
        #10;
        if (Q !== 0 || QN !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and QN to 1");
            $finish;
        end
        RES = 0; // Deassert reset

        // Test 2: Enable functionality
        ENABLE = 1;

        // Test 3: Check D input
        D = 1; // Set D to 1
        #10; // Wait for clock edge
        if (Q !== 1 || QN !== 0) begin
            $display("FAIL: Q did not update to D when ENABLE is high");
            $finish;
        end

        D = 0; // Set D to 0
        #10; // Wait for clock edge
        if (Q !== 0 || QN !== 1) begin
            $display("FAIL: Q did not update to D when ENABLE is high");
            $finish;
        end

        // Test 4: Disable functionality
        ENABLE = 0;
        D = 1; // Change D to 1
        #10; // Wait for clock edge
        if (Q !== 0 || QN !== 1) begin
            $display("FAIL: Q should not update when ENABLE is low");
            $finish;
        end

        // Test 5: Re-enable and check
        ENABLE = 1;
        D = 1; // Set D to 1
        #10; // Wait for clock edge
        if (Q !== 1 || QN !== 0) begin
            $display("FAIL: Q did not update to D when ENABLE is high again");
            $finish;
        end

        // Test 6: Reset while enabled
        RES = 1; // Assert reset
        #10;
        if (Q !== 0 || QN !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and QN to 1 while enabled");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule