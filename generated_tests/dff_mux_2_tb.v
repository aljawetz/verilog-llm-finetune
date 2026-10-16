`timescale 1ns/1ps

module tb_dff_mux;

    parameter WIDTH = 18;
    parameter RESETTYPE = "SYNC";
    
    reg CLK;
    reg EN;
    reg RST;
    reg CEN;
    reg [WIDTH-1:0] D;
    wire [WIDTH-1:0] Q;

    // Instantiate the module under test (uut)
    dff_mux #(
        .width(WIDTH),
        .RESETTYPE(RESETTYPE)
    ) uut (
        .CLK(CLK),
        .EN(EN),
        .RST(RST),
        .CEN(CEN),
        .D(D),
        .Q(Q)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        EN = 0;
        RST = 0;
        CEN = 1;
        D = 18'h0;

        // Test 1: Reset functionality
        RST = 1; #10;
        RST = 0; #10;
        if (Q !== 18'h0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: D input when EN is low
        EN = 0; D = 18'hA5A5; #10;
        if (Q !== 18'hA5A5) begin
            $display("FAIL: Q did not follow D when EN is low");
            $finish;
        end

        // Test 3: D input when EN is high
        EN = 1; D = 18'h5A5A; #10;
        if (Q !== 18'h5A5A) begin
            $display("FAIL: Q did not follow D when EN is high");
            $finish;
        end

        // Test 4: Check clock enable functionality
        CEN = 0; #10;
        D = 18'hFFFF; #10;
        if (Q !== 18'h5A5A) begin
            $display("FAIL: Q changed when CEN is low");
            $finish;
        end

        // Test 5: Check synchronous reset
        CEN = 1; RST = 1; #10;
        if (Q !== 18'h0) begin
            $display("FAIL: Q did not reset to 0 on synchronous reset");
            $finish;
        end

        // Test 6: Normal operation after reset
        RST = 0; D = 18'h1234; #10;
        if (Q !== 18'h1234) begin
            $display("FAIL: Q did not follow D after reset");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule