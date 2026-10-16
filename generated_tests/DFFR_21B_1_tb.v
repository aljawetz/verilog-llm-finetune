`timescale 1ns/1ps

module tb_DFFR_21B;

    parameter BW = 21;
    reg signed [BW-1:0] D;
    reg CLK;
    reg RES;
    wire signed [BW-1:0] Q, QN;

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
        D = 0;
        RES = 0;

        // Test 1: Reset functionality
        RES = 1; // Assert reset
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== ~0) begin
            $display("FAIL: QN should be all 1s after reset");
            $finish;
        end
        RES = 0; // Deassert reset

        // Test 2: Check data input
        D = 21'sb00000000000000000000001; // Set D to 1
        #10; // Wait for clock edge
        if (Q !== D) begin
            $display("FAIL: Q should be %b after clock edge", D);
            $finish;
        end
        if (QN !== ~D) begin
            $display("FAIL: QN should be %b after clock edge", ~D);
            $finish;
        end

        // Test 3: Change data input
        D = 21'sb11111111111111111111111; // Set D to max value
        #10; // Wait for clock edge
        if (Q !== D) begin
            $display("FAIL: Q should be %b after clock edge", D);
            $finish;
        end
        if (QN !== ~D) begin
            $display("FAIL: QN should be %b after clock edge", ~D);
            $finish;
        end

        // Test 4: Check reset again
        RES = 1; // Assert reset
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== ~0) begin
            $display("FAIL: QN should be all 1s after reset");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule