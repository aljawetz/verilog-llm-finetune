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
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        D = 6'b000000;
        RES = 1'b0;
        ENABLE = 1'b0;

        // Test 1: Asynchronous reset
        RES = 1'b1; // Assert reset
        #10;
        RES = 1'b0; // Deassert reset
        #10;
        if (Q !== 6'b000000 || QN !== 6'b111111) begin
            $display("FAIL: Reset did not clear the register");
            $finish;
        end

        // Test 2: Load data with ENABLE
        D = 6'b101010;
        ENABLE = 1'b1;
        #10; // Wait for clock edge
        if (Q !== 6'b101010 || QN !== 6'b010101) begin
            $display("FAIL: Data not loaded correctly with ENABLE");
            $finish;
        end

        // Test 3: Do not load data when ENABLE is low
        D = 6'b111111;
        ENABLE = 1'b0;
        #10; // Wait for clock edge
        if (Q !== 6'b101010 || QN !== 6'b010101) begin
            $display("FAIL: Data changed when ENABLE is low");
            $finish;
        end

        // Test 4: Load new data with ENABLE
        ENABLE = 1'b1;
        D = 6'b001100;
        #10; // Wait for clock edge
        if (Q !== 6'b001100 || QN !== 6'b110011) begin
            $display("FAIL: New data not loaded correctly with ENABLE");
            $finish;
        end

        // Test 5: Check behavior with multiple clock edges
        D = 6'b000111;
        #10; // Wait for clock edge
        if (Q !== 6'b000111 || QN !== 6'b111000) begin
            $display("FAIL: Data not loaded correctly on subsequent clock edge");
            $finish;
        end

        // Test 6: Assert reset again
        RES = 1'b1; // Assert reset
        #10;
        if (Q !== 6'b000000 || QN !== 6'b111111) begin
            $display("FAIL: Reset did not clear the register on second assert");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule