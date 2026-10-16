`timescale 1ns/1ps

module tb_DFFR_6B_4;

    parameter BW = 6;
    reg signed [BW-1:0] D;
    reg CLK;
    reg RES;
    reg ENABLE;
    wire signed [BW-1:0] Q;
    wire signed [BW-1:0] QN;

    // Instantiate the module under test
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
        forever #5 CLK = ~CLK; // 10 ns clock period
    end

    // Test procedure
    initial begin
        // Initialize signals
        D = 6'b000000;
        RES = 0;
        ENABLE = 0;

        // Test 1: Asynchronous reset
        RES = 1; #10;
        RES = 0; #10;
        if (Q !== 6'b000000) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 2: Enable and set D
        ENABLE = 1;
        D = 6'b101010; #10;
        if (Q !== 6'b101010) begin
            $display("FAIL: Q should be 101010 when ENABLE is high");
            $finish;
        end
        if (QN !== ~Q) begin
            $display("FAIL: QN should be the bitwise complement of Q");
            $finish;
        end

        // Test 3: Disable and check Q remains unchanged
        ENABLE = 0; #10;
        D = 6'b111111; #10; // Change D while ENABLE is low
        if (Q !== 6'b101010) begin
            $display("FAIL: Q should remain 101010 when ENABLE is low");
            $finish;
        end

        // Test 4: Re-enable and check Q updates
        ENABLE = 1; #10;
        if (Q !== 6'b111111) begin
            $display("FAIL: Q should be updated to 111111 when ENABLE is high again");
            $finish;
        end

        // Final check for QN
        if (QN !== ~Q) begin
            $display("FAIL: QN should be the bitwise complement of Q");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule