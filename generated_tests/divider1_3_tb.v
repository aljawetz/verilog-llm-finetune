`timescale 1ns/1ps

module tb_divider1;

    reg D;
    reg CLK;
    reg RES;
    wire Q;
    wire QN;

    // Instantiate the module under test (uut)
    divider1 uut (
        .D(D),
        .CLK(CLK),
        .RES(RES),
        .Q(Q),
        .QN(QN)
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
        RES = 0;

        // Test 1: Check reset functionality
        RES = 1; // Assert reset
        #10;     // Wait for a clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== 1) begin
            $display("FAIL: QN should be 1 after reset");
            $finish;
        end
        RES = 0; // Deassert reset

        // Test 2: Check D input capturing
        D = 1; // Set D to 1
        #10;   // Wait for a clock edge
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end
        if (QN !== 0) begin
            $display("FAIL: QN should be 0 when Q is 1");
            $finish;
        end

        // Test 3: Change D input
        D = 0; // Set D to 0
        #10;   // Wait for a clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end
        if (QN !== 1) begin
            $display("FAIL: QN should be 1 when Q is 0");
            $finish;
        end

        // Test 4: Check reset functionality again
        RES = 1; // Assert reset
        #10;     // Wait for a clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== 1) begin
            $display("FAIL: QN should be 1 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule