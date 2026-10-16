`timescale 1ns/1ps

module tb_roundrobin_arbiter;

    reg clk;
    reg rst_n;
    reg [3:0] REQ;
    wire [3:0] GNT;

    // Instantiate the unit under test (UUT)
    roundrobin_arbiter uut (
        .clk(clk),
        .rst_n(rst_n),
        .REQ(REQ),
        .GNT(GNT)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        rst_n = 0; // Assert reset
        REQ = 4'b0000; // No requests
        #10; // Wait for some time
        rst_n = 1; // Deassert reset

        // Test case 1: Single request
        REQ = 4'b0001; // Request from channel 0
        #10;
        if (GNT !== 4'b0001) $display("FAIL: Expected GNT=0001, got GNT=%b", GNT);

        // Test case 2: Rotate to next request
        REQ = 4'b0010; // Request from channel 1
        #10;
        if (GNT !== 4'b0010) $display("FAIL: Expected GNT=0010, got GNT=%b", GNT);

        // Test case 3: Rotate to next request
        REQ = 4'b0100; // Request from channel 2
        #10;
        if (GNT !== 4'b0100) $display("FAIL: Expected GNT=0100, got GNT=%b", GNT);

        // Test case 4: Rotate to next request
        REQ = 4'b1000; // Request from channel 3
        #10;
        if (GNT !== 4'b0001) $display("FAIL: Expected GNT=0001, got GNT=%b", GNT);

        // Test case 5: Multiple requests
        REQ = 4'b1111; // Requests from all channels
        #10;
        if (GNT !== 4'b0010) $display("FAIL: Expected GNT=0010, got GNT=%b", GNT);

        // Test case 6: No requests
        REQ = 4'b0000; // No requests
        #10;
        if (GNT !== 4'b0000) $display("FAIL: Expected GNT=0000, got GNT=%b", GNT);

        // Test case 7: Reset functionality
        rst_n = 0; // Assert reset
        #10;
        if (GNT !== 4'b0000) $display("FAIL: Expected GNT=0000 after reset, got GNT=%b", GNT);
        rst_n = 1; // Deassert reset
        #10;

        // Final check after reset
        REQ = 4'b0001; // Request from channel 0
        #10;
        if (GNT !== 4'b0001) $display("FAIL: Expected GNT=0001 after reset, got GNT=%b", GNT);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule