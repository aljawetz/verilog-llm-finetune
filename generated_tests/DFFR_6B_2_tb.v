`timescale 1ns/1ps

module tb_DFFR_6B;

    parameter BW = 6;
    reg signed [BW-1:0] D;
    reg CLK;
    reg RES;
    wire signed [BW-1:0] Q;
    wire signed [BW-1:0] QN;

    // Instantiate the module under test
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
        D = 6'b000000;
        RES = 1'b0;

        // Test 1: Check reset functionality
        RES = 1'b1; // Assert reset
        #10; // Wait for a clock cycle
        if (Q !== 6'b000000) begin
            $display("FAIL: Reset did not clear Q to zero");
            $finish;
        end

        // Deassert reset
        RES = 1'b0;
        #10; // Wait for a clock cycle

        // Test 2: Check D input functionality
        D = 6'b101010; // Set D to a known value
        #10; // Wait for a clock cycle
        if (Q !== D) begin
            $display("FAIL: Q did not match D after clock edge");
            $finish;
        end

        // Test 3: Check QN output
        if (QN !== ~D) begin
            $display("FAIL: QN did not match bitwise complement of Q");
            $finish;
        end

        // Test 4: Check reset functionality again
        RES = 1'b1; // Assert reset
        #10; // Wait for a clock cycle
        if (Q !== 6'b000000) begin
            $display("FAIL: Reset did not clear Q to zero on second check");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule