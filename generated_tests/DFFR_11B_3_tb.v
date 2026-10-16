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
        #10; // Wait for reset to take effect
        if (Q !== 11'sb00000000000 || QN !== 11'sb11111111111) begin
            $display("FAIL: Reset did not set Q and QN correctly");
            $finish;
        end

        RES = 0; // Deassert reset
        D = 11'sb00000000001; // Set data
        #10; // Wait for clock edge
        if (Q !== 11'sb00000000001 || QN !== 11'sb11111111110) begin
            $display("FAIL: Q and QN did not update correctly after clock edge");
            $finish;
        end

        D = 11'sb00000000010; // Change data
        #10; // Wait for clock edge
        if (Q !== 11'sb00000000010 || QN !== 11'sb11111111101) begin
            $display("FAIL: Q and QN did not update correctly after clock edge");
            $finish;
        end

        // Test reset again
        RES = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (Q !== 11'sb00000000000 || QN !== 11'sb11111111111) begin
            $display("FAIL: Reset did not set Q and QN correctly");
            $finish;
        end

        // Final test with negative data
        RES = 0; // Deassert reset
        D = 11'sb11111111111; // Set negative data
        #10; // Wait for clock edge
        if (Q !== 11'sb11111111111 || QN !== 11'sb00000000000) begin
            $display("FAIL: Q and QN did not update correctly with negative data");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule