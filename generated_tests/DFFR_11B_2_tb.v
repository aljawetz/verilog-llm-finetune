`timescale 1ns/1ps

module tb_DFFR_11B;

    parameter BW = 11;
    reg signed [BW-1:0] D;
    reg CLK;
    reg RES;
    wire signed [BW-1:0] Q;
    wire signed [BW-1:0] QN;

    // Instantiate the DFFR_11B module
    DFFR_11B uut (
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
        D = 11'sb00000000000; // Initial data
        #10; // Wait for a clock cycle

        // Check reset functionality
        if (Q !== 11'sb00000000000) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== 11'sb11111111111) begin
            $display("FAIL: QN should be all 1s after reset");
            $finish;
        end

        // Release reset
        RES = 0;
        #10; // Wait for a clock cycle

        // Test with a positive value
        D = 11'sb00000000001; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== 11'sb00000000001) begin
            $display("FAIL: Q should be 1 after clock edge");
            $finish;
        end
        if (QN !== 11'sb11111111110) begin
            $display("FAIL: QN should be 11111111110 after clock edge");
            $finish;
        end

        // Test with a negative value
        D = 11'sb11111111111; // Set D to -1
        #10; // Wait for a clock edge
        if (Q !== 11'sb11111111111) begin
            $display("FAIL: Q should be -1 after clock edge");
            $finish;
        end
        if (QN !== 11'sb00000000000) begin
            $display("FAIL: QN should be 0 after clock edge");
            $finish;
        end

        // Test reset functionality again
        RES = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (Q !== 11'sb00000000000) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== 11'sb11111111111) begin
            $display("FAIL: QN should be all 1s after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule