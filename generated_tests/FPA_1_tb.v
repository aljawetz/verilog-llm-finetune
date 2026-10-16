`timescale 1ns/1ps

module tb_FPA;

    reg [3:0] REQ;
    reg clk;
    reg reset;
    wire [3:0] GNT;

    // Instantiate the module under test (uut)
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
        #10 reset = 1;

        // Test case 1: REQ[3] is high
        REQ = 4'b1000; // Request from REQ[3]
        #10;
        if (GNT !== 4'b1000) begin
            $display("FAIL: Expected GNT = 4'b1000, got GNT = %b", GNT);
            $finish;
        end

        // Test case 2: REQ[1] is high
        REQ = 4'b0010; // Request from REQ[1]
        #10;
        if (GNT !== 4'b0010) begin
            $display("FAIL: Expected GNT = 4'b0010, got GNT = %b", GNT);
            $finish;
        end

        // Test case 3: REQ[0] is high
        REQ = 4'b0001; // Request from REQ[0]
        #10;
        if (GNT !== 4'b0001) begin
            $display("FAIL: Expected GNT = 4'b0001, got GNT = %b", GNT);
            $finish;
        end

        // Test case 4: REQ[2] is high
        REQ = 4'b0100; // Request from REQ[2]
        #10;
        if (GNT !== 4'b0100) begin
            $display("FAIL: Expected GNT = 4'b0100, got GNT = %b", GNT);
            $finish;
        end

        // Test case 5: No requests
        REQ = 4'b0000; // No requests
        #10;
        if (GNT !== 4'b0000) begin
            $display("FAIL: Expected GNT = 4'b0000, got GNT = %b", GNT);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule