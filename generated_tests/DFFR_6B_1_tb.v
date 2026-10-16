`timescale 1ns/1ps

module tb_DFFR_6B;

    parameter BW = 6;
    reg signed [BW-1:0] D;
    reg CLK;
    reg RES;
    wire signed [BW-1:0] Q, QN;

    // Instantiate the DFFR_6B module
    DFFR_6B uut (
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
        D = 6'b000000; // Initial data
        #10; // Wait for 10ns

        // Deassert reset
        RES = 0;
        #10; // Wait for 10ns

        // Test case 1: Check output after loading data
        D = 6'b101010; // Load data
        #10; // Wait for 10ns
        if (Q !== 6'b101010) begin
            $display("FAIL: Expected Q = 101010, got Q = %b", Q);
            $finish;
        end

        // Test case 2: Check QN output
        if (QN !== ~Q) begin
            $display("FAIL: Expected QN = %b, got QN = %b", ~Q, QN);
            $finish;
        end

        // Test case 3: Check reset functionality
        RES = 1; // Assert reset
        #10; // Wait for 10ns
        if (Q !== 6'b000000) begin
            $display("FAIL: Expected Q = 000000 after reset, got Q = %b", Q);
            $finish;
        end

        // Test case 4: Load new data after reset
        RES = 0; // Deassert reset
        D = 6'b111111; // Load new data
        #10; // Wait for 10ns
        if (Q !== 6'b111111) begin
            $display("FAIL: Expected Q = 111111, got Q = %b", Q);
            $finish;
        end

        // Test case 5: Check QN after loading new data
        if (QN !== ~Q) begin
            $display("FAIL: Expected QN = %b, got QN = %b", ~Q, QN);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule