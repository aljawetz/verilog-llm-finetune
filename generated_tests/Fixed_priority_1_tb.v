`timescale 1ns/1ps

module tb_Fixed_priority;

    reg [3:0] REQ;
    reg clk;
    reg reset;
    wire [3:0] GNT;

    // Instantiate the module under test (uut)
    Fixed_priority uut (
        .GNT(GNT),
        .REQ(REQ),
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 0;
        REQ = 4'b0000;
        #10; // Wait for a clock cycle
        
        // Release reset
        reset = 1;
        #10; // Wait for a clock cycle

        // Test case 1: REQ[0] is active
        REQ = 4'b0001; // Only REQ[0] is active
        #10;
        if (GNT !== 4'b1000) begin
            $display("FAIL: Expected GNT=1000 when REQ=0001, got GNT=%b", GNT);
            $finish;
        end

        // Test case 2: REQ[1] is active
        REQ = 4'b0010; // Only REQ[1] is active
        #10;
        if (GNT !== 4'b0010) begin
            $display("FAIL: Expected GNT=0010 when REQ=0010, got GNT=%b", GNT);
            $finish;
        end

        // Test case 3: REQ[2] is active
        REQ = 4'b0100; // Only REQ[2] is active
        #10;
        if (GNT !== 4'b0001) begin
            $display("FAIL: Expected GNT=0001 when REQ=0100, got GNT=%b", GNT);
            $finish;
        end

        // Test case 4: REQ[3] is active
        REQ = 4'b1000; // Only REQ[3] is active
        #10;
        if (GNT !== 4'b0100) begin
            $display("FAIL: Expected GNT=0100 when REQ=1000, got GNT=%b", GNT);
            $finish;
        end

        // Test case 5: No requests active
        REQ = 4'b0000; // No requests
        #10;
        if (GNT !== 4'b0000) begin
            $display("FAIL: Expected GNT=0000 when REQ=0000, got GNT=%b", GNT);
            $finish;
        end

        // Test case 6: Multiple requests active (REQ[0] and REQ[2])
        REQ = 4'b0101; // REQ[0] and REQ[2] are active
        #10;
        if (GNT !== 4'b1000) begin
            $display("FAIL: Expected GNT=1000 when REQ=0101, got GNT=%b", GNT);
            $finish;
        end

        // Test case 7: Reset functionality
        reset = 0; // Assert reset
        #10;
        if (GNT !== 4'b0000) begin
            $display("FAIL: Expected GNT=0000 when reset is low, got GNT=%b", GNT);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule