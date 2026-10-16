`timescale 1ns/1ps

module tb_roundrobin_arbiter;

    reg clk;
    reg rst_n;
    reg [3:0] REQ;
    wire [3:0] GNT;

    // Instantiate the roundrobin_arbiter module
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
        #10; // Wait for 10ns
        rst_n = 1; // Deassert reset
        #10;

        // Test case 1: Single request
        REQ = 4'b0001; // Request from source 0
        #10;
        if (GNT !== 4'b0001) begin
            $display("FAIL: Expected GNT=4'b0001, got GNT=%b", GNT);
            $finish;
        end

        // Test case 2: Multiple requests
        REQ = 4'b0110; // Requests from source 1 and 2
        #10;
        if (GNT !== 4'b0010) begin
            $display("FAIL: Expected GNT=4'b0010, got GNT=%b", GNT);
            $finish;
        end

        // Test case 3: Cycle through requests
        REQ = 4'b1000; // Request from source 3
        #10;
        if (GNT !== 4'b0100) begin
            $display("FAIL: Expected GNT=4'b0100, got GNT=%b", GNT);
            $finish;
        end

        REQ = 4'b0001; // Request from source 0 again
        #10;
        if (GNT !== 4'b0001) begin
            $display("FAIL: Expected GNT=4'b0001, got GNT=%b", GNT);
            $finish;
        end

        // Test case 4: No requests
        REQ = 4'b0000; // No requests
        #10;
        if (GNT !== 4'b0000) begin
            $display("FAIL: Expected GNT=4'b0000, got GNT=%b", GNT);
            $finish;
        end

        // Test case 5: All requests
        REQ = 4'b1111; // Requests from all sources
        #10;
        if (GNT !== 4'b0001) begin
            $display("FAIL: Expected GNT=4'b0001, got GNT=%b", GNT);
            $finish;
        end

        // Additional cycles to verify round-robin behavior
        #10;
        if (GNT !== 4'b0010) begin
            $display("FAIL: Expected GNT=4'b0010, got GNT=%b", GNT);
            $finish;
        end

        #10;
        if (GNT !== 4'b0011) begin
            $display("FAIL: Expected GNT=4'b0011, got GNT=%b", GNT);
            $finish;
        end

        #10;
        if (GNT !== 4'b0100) begin
            $display("FAIL: Expected GNT=4'b0100, got GNT=%b", GNT);
            $finish;
        end

        // Final check for no requests
        REQ = 4'b0000; // No requests
        #10;
        if (GNT !== 4'b0000) begin
            $display("FAIL: Expected GNT=4'b0000, got GNT=%b", GNT);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule