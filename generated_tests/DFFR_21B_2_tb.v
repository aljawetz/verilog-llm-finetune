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
        D = 21'sb0;
        RES = 1'b0;

        // Test 1: Asynchronous reset
        RES = 1'b1; // Assert reset
        #10; // Wait for a clock cycle
        if (Q !== 21'sb0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== ~21'sb0) begin
            $display("FAIL: QN should be all 1s after reset");
            $finish;
        end
        RES = 1'b0; // Deassert reset

        // Test 2: Check D input on clock edge
        D = 21'sb00000000000000000000001; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== D) begin
            $display("FAIL: Q should be %b after clock edge", D);
            $finish;
        end
        if (QN !== ~D) begin
            $display("FAIL: QN should be %b after clock edge", ~D);
            $finish;
        end

        // Test 3: Change D and check Q and QN
        D = 21'sb00000000000000000000010; // Set D to 2
        #10; // Wait for a clock edge
        if (Q !== D) begin
            $display("FAIL: Q should be %b after clock edge", D);
            $finish;
        end
        if (QN !== ~D) begin
            $display("FAIL: QN should be %b after clock edge", ~D);
            $finish;
        end

        // Test 4: Assert reset again
        RES = 1'b1; // Assert reset
        #10; // Wait for a clock cycle
        if (Q !== 21'sb0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (QN !== ~21'sb0) begin
            $display("FAIL: QN should be all 1s after reset");
            $finish;
        end

        // Test 5: Final check with a negative value
        RES = 1'b0; // Deassert reset
        D = 21'sb11111111111111111111111; // Set D to -1
        #10; // Wait for a clock edge
        if (Q !== D) begin
            $display("FAIL: Q should be %b after clock edge", D);
            $finish;
        end
        if (QN !== ~D) begin
            $display("FAIL: QN should be %b after clock edge", ~D);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule