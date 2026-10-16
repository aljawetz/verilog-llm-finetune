`timescale 1ns/1ps

module tb_write_pointer;

    parameter pt = 3;
    reg clk;
    reg rst;
    reg we;
    reg [pt:0] g_rdpt_sync;
    wire full;
    wire [pt:0] b_wrpt, g_wrpt;

    // Instantiate the module under test (uut)
    write_pointer uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .g_rdpt_sync(g_rdpt_sync),
        .full(full)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;
        we = 0;
        g_rdpt_sync = 4'b0000;

        // Apply reset
        #10 rst = 1; // Release reset
        #10;

        // Test writing when not full
        we = 1; g_rdpt_sync = 4'b0000; // Write enabled, read pointer sync
        #10;
        if (full !== 0) $display("FAIL: Expected full to be 0 after first write");
        
        // Check write pointer and Gray code
        if (b_wrpt !== 1 || g_wrpt !== 1) $display("FAIL: Expected b_wrpt and g_wrpt to be 1 after first write");

        // Write again
        #10;
        if (full !== 0) $display("FAIL: Expected full to be 0 after second write");
        
        // Check write pointer and Gray code
        if (b_wrpt !== 2 || g_wrpt !== 3) $display("FAIL: Expected b_wrpt to be 2 and g_wrpt to be 3 after second write");

        // Simulate full condition
        g_rdpt_sync = 4'b0011; // Set read pointer to match the next Gray code
        #10;
        if (full !== 1) $display("FAIL: Expected full to be 1 when g_rdpt_sync matches next Gray code");

        // Reset and check
        rst = 0; #10; rst = 1; #10;
        if (b_wrpt !== 0 || g_wrpt !== 0 || full !== 0) $display("FAIL: Expected pointers and full to be reset to 0");

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule