`timescale 1ns/1ps

module tb_d_ff;

    // Inputs
    reg in;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire qbar;

    // Instantiate the Unit Under Test (UUT)
    d_ff uut (
        .in(in),
        .clk(clk),
        .rst(rst),
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
        in = 0;
        rst = 0;

        // Test 1: Reset the flip-flop
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end
        
        // Deassert reset
        rst = 0;
        #10; // Wait for a clock cycle

        // Test 2: Check D input propagation
        in = 1; // Set D input to 1
        #10; // Wait for a clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D input did not propagate to q");
            $finish;
        end

        // Test 3: Change D input
        in = 0; // Set D input to 0
        #10; // Wait for a clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: D input did not propagate to q");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 5: Deassert reset and check D input
        rst = 0;
        in = 1; // Set D input to 1
        #10; // Wait for a clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D input did not propagate to q");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule