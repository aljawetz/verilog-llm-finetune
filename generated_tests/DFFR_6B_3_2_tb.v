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
        forever #5 CLK = ~CLK; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        D = 6'b000000;
        RES = 0;
        ENABLE = 0;

        // Test 1: Asynchronous reset
        RES = 1; #10;
        RES = 0; #10;
        if (Q !== 6'b000000 || QN !== 6'b111111) begin
            $display("FAIL: Reset did not clear the register");
            $finish;
        end

        // Test 2: Load data when ENABLE is high
        D = 6'b101010; ENABLE = 1; #10;
        if (Q !== 6'b101010 || QN !== 6'b010101) begin
            $display("FAIL: Data not loaded correctly when ENABLE is high");
            $finish;
        end

        // Test 3: Do not load data when ENABLE is low
        D = 6'b111111; ENABLE = 0; #10;
        if (Q !== 6'b101010 || QN !== 6'b010101) begin
            $display("FAIL: Data changed when ENABLE is low");
            $finish;
        end

        // Test 4: Reset while ENABLE is high
        D = 6'b001100; ENABLE = 1; RES = 1; #10;
        if (Q !== 6'b000000 || QN !== 6'b111111) begin
            $display("FAIL: Reset did not clear the register during ENABLE");
            $finish;
        end

        // Test 5: Load new data after reset
        RES = 0; D = 6'b110011; ENABLE = 1; #10;
        if (Q !== 6'b110011 || QN !== 6'b001100) begin
            $display("FAIL: Data not loaded correctly after reset");
            $finish;
        end

        // Test 6: Check that register holds value when ENABLE is low
        ENABLE = 0; #10;
        if (Q !== 6'b110011 || QN !== 6'b001100) begin
            $display("FAIL: Data changed when ENABLE is low after loading");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule