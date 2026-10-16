`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
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
        // Initialize signals
        rst = 1; t = 0;
        #10; // Wait for 10ns
        
        // Release reset
        rst = 0;
        #10; // Wait for 10ns
        
        // Test case 1: Check reset functionality
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end
        
        // Test case 2: Toggle q when t is high
        t = 1; 
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t is high");
            $finish;
        end
        
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q did not toggle back to 0 on next clock edge");
            $finish;
        end
        
        // Test case 3: Ensure q remains unchanged when t is low
        t = 0; 
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q changed when t is low");
            $finish;
        end
        
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q changed unexpectedly when t is low");
            $finish;
        end
        
        // Test case 4: Check reset functionality again
        rst = 1; 
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end
        
        // Test case 5: Toggle q again with t high
        rst = 0; t = 1; 
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t is high again");
            $finish;
        end
        
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q did not toggle back to 0 on next clock edge again");
            $finish;
        end
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule