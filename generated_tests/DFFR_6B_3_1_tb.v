`timescale 1ns/1ps

module tb_DFFR_6B_3;

    reg [5:0] D;
    reg CLK;
    reg RES;
    reg ENABLE;
    wire [5:0] Q;
    wire [5:0] QN;

    // Instantiate the module under test (uut)
    DFFR_6B_3 uut (
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
        forever #5 CLK = ~CLK; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        RES = 1;
        ENABLE = 0;
        D = 6'b000000;

        // Apply reset
        #10;
        RES = 0;

        // Test 1: Check reset functionality
        ENABLE = 1;
        D = 6'b101010;
        #10;
        if (Q !== 6'b101010) begin
            $display("FAIL: Q should be 101010 after D is set and ENABLE is high");
            $finish;
        end

        // Test 2: Check QN output
        if (QN !== ~Q) begin
            $display("FAIL: QN should be the bitwise NOT of Q");
            $finish;
        end

        // Test 3: Check that Q does not change when ENABLE is low
        ENABLE = 0;
        D = 6'b111111;
        #10;
        if (Q !== 6'b101010) begin
            $display("FAIL: Q should remain 101010 when ENABLE is low");
            $finish;
        end

        // Test 4: Check reset functionality again
        RES = 1;
        #10;
        if (Q !== 6'b000000) begin
            $display("FAIL: Q should be 000000 after reset");
            $finish;
        end

        // Test 5: Check Q after reset and ENABLE high
        RES = 0;
        ENABLE = 1;
        D = 6'b110011;
        #10;
        if (Q !== 6'b110011) begin
            $display("FAIL: Q should be 110011 after D is set and ENABLE is high");
            $finish;
        end

        // Final check for QN
        if (QN !== ~Q) begin
            $display("FAIL: QN should be the bitwise NOT of Q");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule