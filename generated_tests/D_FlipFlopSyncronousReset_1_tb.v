`timescale 1ns/1ps

module tb_D_FlipFlopSyncronousReset;

    reg D;
    reg reset;
    reg CLK;
    wire Q;

    // Instantiate the D flip-flop module
    D_FlipFlopSyncronousReset uut (
        .D(D),
        .reset(reset),
        .CLK(CLK),
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
        D = 0;
        reset = 0;

        // Test 1: Check reset functionality
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is asserted");
            $finish;
        end
        
        // Test 2: Check D input capture
        reset = 0; // Deassert reset
        D = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after capturing D=1");
            $finish;
        end
        
        // Test 3: Check D input capture with reset
        D = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after capturing D=0");
            $finish;
        end
        
        // Test 4: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is asserted again");
            $finish;
        end
        
        // Test 5: Check D input capture after reset
        reset = 0; // Deassert reset
        D = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after capturing D=1 again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule