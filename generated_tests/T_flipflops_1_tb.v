`timescale 1ns/1ps

module tb_T_flipflops;

    // Inputs
    reg clk;
    reg rst;
    reg t;

    // Outputs
    wire q;
    wire qbar;

    // Instantiate the Unit Under Test (UUT)
    T_flipflops uut (
        .clk(clk), 
        .rst(rst), 
        .t(t), 
        .q(q), 
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        t = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test 1: Check reset functionality
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 2: Toggle q when t is high
        t = 1; // Set T to toggle
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t is high");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q did not toggle back to 0 when t is high");
            $finish;
        end

        // Test 3: No toggle when t is low
        t = 0; // Set T to not toggle
        #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q should remain 0 when t is low");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q should still remain 0 when t is low");
            $finish;
        end

        // Test 4: Toggle again with t high
        t = 1; // Set T to toggle
        #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t is high again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule