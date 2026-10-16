`timescale 1ns/1ps

module tb_DFFR_6B_4;

    parameter BW = 6;
    reg signed[BW-1:0] D;
    reg CLK;
    reg RES;
    reg ENABLE;
    wire signed[BW-1:0] Q;
    wire signed[BW-1:0] QN;

    // Instantiate the module under test (uut)
    DFFR_6B_4 uut (
        .D(D),
        .CLK(CLK),
        .RES(RES),
        .ENABLE(ENABLE),
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
        RES = 1;
        ENABLE = 0;
        D = 6'b000000;

        // Wait for a clock cycle
        #10;

        // Release reset
        RES = 0;

        // Test 1: Check reset functionality
        #10;
        if (Q !== 0) begin
            $display("FAIL: Reset did not clear Q");
            $finish;
        end

        // Test 2: Check D input when ENABLE is low
        D = 6'b101010;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when ENABLE is low");
            $finish;
        end

        // Test 3: Check D input when ENABLE is high
        ENABLE = 1;
        #10;
        if (Q !== D) begin
            $display("FAIL: Q did not update to D when ENABLE is high");
            $finish;
        end

        // Test 4: Check QN output
        #10;
        if (QN !== ~Q) begin
            $display("FAIL: QN is not the complement of Q");
            $finish;
        end

        // Test 5: Change D while ENABLE is high
        D = 6'b111111;
        #10;
        if (Q !== D) begin
            $display("FAIL: Q did not update to new D when ENABLE is high");
            $finish;
        end

        // Test 6: Check reset functionality again
        RES = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Reset did not clear Q again");
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule