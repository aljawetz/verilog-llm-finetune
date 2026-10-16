`timescale 1ns/1ps

module tb_t_flipflop1;

    // Inputs
    reg t;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire qbar;

    // Instantiate the Unit Under Test (UUT)
    t_flipflop1 uut (
        .t(t),
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
        rst = 1; t = 0;
        #10; // Wait for a clock edge
        rst = 0; // Release reset

        // Test case 1: Check reset functionality
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Toggle q when t is 1
        t = 1; 
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t is 1");
            $finish;
        end

        // Test case 3: Toggle q back when t is 1 again
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q did not toggle back to 0 when t is 1 again");
            $finish;
        end

        // Test case 4: Ensure q stays the same when t is 0
        t = 0; 
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q changed when t is 0");
            $finish;
        end

        // Test case 5: Check toggling with t = 1
        t = 1; 
        #10; // Wait for a clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t is 1 again");
            $finish;
        end

        // Test case 6: Reset again
        rst = 1; 
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule