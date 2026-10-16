`timescale 1ns/1ps

module tb_FPA;

    reg [3:0] REQ;
    reg clk;
    reg reset;
    wire [3:0] GNT;

    // Instantiate the module under test
    FPA uut (
        .GNT(GNT),
        .REQ(REQ),
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        REQ = 4'b0000;
        reset = 0;

        // Apply reset
        #10;
        reset = 1;

        // Test case 1: REQ[3] is active
        REQ = 4'b1000; // Request 3
        #10;
        if (GNT !== 4'b1000) $display("FAIL: Expected GNT=1000, got GNT=%b", GNT);

        // Test case 2: REQ[1] is active
        REQ = 4'b0010; // Request 1
        #10;
        if (GNT !== 4'b0010) $display("FAIL: Expected GNT=0010, got GNT=%b", GNT);

        // Test case 3: REQ[0] is active
        REQ = 4'b0001; // Request 0
        #10;
        if (GNT !== 4'b0001) $display("FAIL: Expected GNT=0001, got GNT=%b", GNT);

        // Test case 4: REQ[2] is active
        REQ = 4'b0100; // Request 2
        #10;
        if (GNT !== 4'b0100) $display("FAIL: Expected GNT=0100, got GNT=%b", GNT);

        // Test case 5: No requests active
        REQ = 4'b0000; // No requests
        #10;
        if (GNT !== 4'b0000) $display("FAIL: Expected GNT=0000, got GNT=%b", GNT);

        // Test case 6: Reset functionality
        reset = 0; // Assert reset
        #10;
        if (GNT !== 4'b0000) $display("FAIL: Expected GNT=0000 after reset, got GNT=%b", GNT);
        reset = 1; // Deassert reset
        #10;

        // Final check with no requests
        REQ = 4'b0000; // No requests
        #10;
        if (GNT !== 4'b0000) $display("FAIL: Expected GNT=0000, got GNT=%b", GNT);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule