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
        D = 0;
        RES = 0;

        // Test reset functionality
        RES = 1; // Assert reset
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== ~0) begin
            $display("FAIL: QN should be all ones after reset");
            $finish;
        end
        
        RES = 0; // Deassert reset
        #10;

        // Test normal operation
        D = 11'sb00000000001; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== D) begin
            $display("FAIL: Q should be %b but got %b", D, Q);
            $finish;
        end
        if (QN !== ~D) begin
            $display("FAIL: QN should be %b but got %b", ~D, QN);
            $finish;
        end

        D = 11'sb00000000010; // Set D to 2
        #10; // Wait for one clock cycle
        if (Q !== D) begin
            $display("FAIL: Q should be %b but got %b", D, Q);
            $finish;
        end
        if (QN !== ~D) begin
            $display("FAIL: QN should be %b but got %b", ~D, QN);
            $finish;
        end

        // Test reset again
        RES = 1; // Assert reset
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== ~0) begin
            $display("FAIL: QN should be all ones after reset");
            $finish;
        end

        // Finalize the simulation
        $display("PASS");
        $finish;
    end

endmodule