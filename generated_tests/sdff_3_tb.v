`timescale 1ns/1ps

module tb_sdff;

reg R;
reg CLK;
reg SE;
reg SI;
reg D;
wire Q;
wire SO;

// Instantiate the module under test (uut)
sdff uut (
    .R(R),
    .CLK(CLK),
    .SE(SE),
    .SI(SI),
    .D(D),
    .Q(Q),
    .SO(SO)
);

// Clock generation
initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns period
end

// Test sequence
initial begin
    // Initialize inputs
    R = 1; SE = 0; SI = 0; D = 0;
    #10; // Wait for clock to stabilize

    // Test reset functionality
    R = 1; #10; // Assert reset
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    R = 0; // Deassert reset
    #10;

    // Test D input functionality
    D = 1; #10; // Set D to 1
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 when D is 1 and R is 0");
        $finish;
    end

    D = 0; #10; // Set D to 0
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 when D is 0 and R is 0");
        $finish;
    end

    // Test scan functionality
    SE = 1; SI = 1; #10; // Set scan enable and scan input to 1
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 when SE is 1 and SI is 1");
        $finish;
    end

    SI = 0; #10; // Set scan input to 0
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 when SE is 1 and SI is 0");
        $finish;
    end

    // Test combination of D and SE
    SE = 0; D = 1; #10; // Set D to 1 with SE low
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 when SE is 0 and D is 1");
        $finish;
    end

    D = 0; #10; // Set D to 0
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 when SE is 0 and D is 0");
        $finish;
    end

    // Final reset test
    R = 1; #10; // Assert reset
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule