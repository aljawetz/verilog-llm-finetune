`timescale 1ns/1ps

module tb_tff_asyn;

    reg clk;
    reg t;
    reg arst;
    wire q;
    wire qb;

    // Instantiate the T flip-flop module
    tff_asyn uut (
        .clk(clk),
        .t(t),
        .arst(arst),
        .q(q),
        .qb(qb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        arst = 0;
        t = 0;

        // Test 1: Asynchronous reset
        arst = 1; // Assert reset
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Asynchronous reset failed");
            $finish;
        end
        arst = 0; // Deassert reset

        // Test 2: T = 0, q should remain unchanged
        #10; // Wait for a clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: T=0 failed, q should remain 0");
            $finish;
        end

        // Test 3: T = 1, q should toggle
        t = 1; // Set T to 1
        #10; // Wait for a clock edge
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: T=1 failed, q should toggle to 1");
            $finish;
        end

        #10; // Wait for another clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: T=1 failed, q should toggle back to 0");
            $finish;
        end

        // Test 4: T = 0 again, q should remain unchanged
        t = 0; // Set T to 0
        #10; // Wait for a clock edge
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: T=0 failed, q should remain 0");
            $finish;
        end

        // Test 5: T = 1, q should toggle
        t = 1; // Set T to 1
        #10; // Wait for a clock edge
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: T=1 failed, q should toggle to 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule