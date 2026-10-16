`timescale 1ns/1ps

module tb_DFFR_21B;

    parameter BW = 21;
    reg signed [BW-1:0] D;
    reg CLK;
    reg RES;
    wire signed [BW-1:0] Q;
    wire signed [BW-1:0] QN;

    // Instantiate the DFFR_21B module
    DFFR_21B uut (
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
        // Initialize signals
        RES = 1; // Assert reset
        D = 21'sb0; // Initial data
        #10; // Wait for reset to take effect
        RES = 0; // Deassert reset

        // Test case 1: Check reset functionality
        if (Q !== 21'sb0) begin
            $display("FAIL: Reset did not set Q to zero");
            $finish;
        end

        // Test case 2: Check data capture on clock edge
        D = 21'sb101010101010101010101; // Set data
        #10; // Wait for clock edge
        if (Q !== D) begin
            $display("FAIL: Q did not capture D correctly");
            $finish;
        end

        // Test case 3: Check QN output
        if (QN !== ~D) begin
            $display("FAIL: QN did not match bitwise inversion of Q");
            $finish;
        end

        // Test case 4: Check reset functionality again
        RES = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (Q !== 21'sb0) begin
            $display("FAIL: Reset did not set Q to zero on second check");
            $finish;
        end

        // Test case 5: Check data capture after reset
        RES = 0; // Deassert reset
        D = 21'sb111111111111111111111; // New data
        #10; // Wait for clock edge
        if (Q !== D) begin
            $display("FAIL: Q did not capture new D correctly after reset");
            $finish;
        end

        // Test case 6: Check QN output after new data
        if (QN !== ~D) begin
            $display("FAIL: QN did not match bitwise inversion of new Q");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule