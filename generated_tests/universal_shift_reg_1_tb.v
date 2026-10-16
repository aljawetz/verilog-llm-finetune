`timescale 1ns/1ps

module tb_universal_shift_reg;

    reg clk;
    reg rst;
    reg [3:0] xp;
    reg [1:0] dir;
    wire [3:0] qp;
    wire qs;

    // Instantiate the module under test (uut)
    universal_shift_reg uut (
        .clk(clk),
        .rst(rst),
        .xp(xp),
        .dir(dir),
        .qp(qp),
        .qs(qs)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        xp = 4'b0000;
        dir = 2'b00;
        #10;

        // Release reset
        rst = 0;
        #10;

        // Test loading xp when dir = 11
        xp = 4'b1010; dir = 2'b11; // Load 1010
        #10;
        if (qp !== 4'b1010) $display("FAIL: Expected qp = 1010, got qp = %b", qp);

        // Test right shift when dir = 01
        dir = 2'b01; // Right shift
        #10;
        if (qp !== 4'b0101) $display("FAIL: Expected qp = 0101, got qp = %b", qp);

        // Test left shift when dir = 10
        dir = 2'b10; // Left shift
        #10;
        if (qp !== 4'b1010) $display("FAIL: Expected qp = 1010, got qp = %b", qp);

        // Test hold when dir = 00
        dir = 2'b00; // Hold
        #10;
        if (qp !== 4'b1010) $display("FAIL: Expected qp = 1010, got qp = %b", qp);

        // Test reset functionality
        rst = 1; // Assert reset
        #10;
        if (qp !== 4'b0000) $display("FAIL: Expected qp = 0000 after reset, got qp = %b", qp);

        // Release reset
        rst = 0; 
        #10;

        // Test loading new value after reset
        xp = 4'b1111; dir = 2'b11; // Load 1111
        #10;
        if (qp !== 4'b1111) $display("FAIL: Expected qp = 1111, got qp = %b", qp);

        // Test right shift again
        dir = 2'b01; // Right shift
        #10;
        if (qp !== 4'b0111) $display("FAIL: Expected qp = 0111, got qp = %b", qp);

        // Test left shift again
        dir = 2'b10; // Left shift
        #10;
        if (qp !== 4'b1110) $display("FAIL: Expected qp = 1110, got qp = %b", qp);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule