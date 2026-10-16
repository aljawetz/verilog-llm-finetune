`timescale 1ns/1ps

module tb_divider2;

    reg D;
    reg CLK;
    reg RES;
    reg ENABLE;
    wire Q;
    wire QN;

    // Instantiate the module under test (uut)
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
        #10; // Wait for a clock cycle
        RES = 0; // Deassert reset
        #10; // Wait for a clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 2: Enable and set D
        ENABLE = 1; // Enable the flip-flop
        D = 1; // Set D to 1
        #10; // Wait for a clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is set to 1 and ENABLE is high");
            $finish;
        end

        // Test 3: Disable and check Q
        ENABLE = 0; // Disable the flip-flop
        D = 0; // Change D to 0
        #10; // Wait for a clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when ENABLE is low");
            $finish;
        end

        // Test 4: Enable again and change D
        ENABLE = 1; // Enable the flip-flop again
        D = 0; // Set D to 0
        #10; // Wait for a clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is set to 0 and ENABLE is high");
            $finish;
        end

        // Test 5: Check QN output
        if (QN !== 1) begin
            $display("FAIL: QN should be 1 when Q is 0");
            $finish;
        end

        // Test 6: Check QN output when Q is 1
        D = 1; // Set D to 1
        #10; // Wait for a clock cycle
        if (QN !== 0) begin
            $display("FAIL: QN should be 0 when Q is 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule