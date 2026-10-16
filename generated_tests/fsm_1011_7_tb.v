`timescale 1ns/1ps

module tb_fsm_1011;

    reg clk;
    reg rst;
    reg din;
    wire y;

    // Instantiate the module under test
    fsm_1011 uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        din = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test sequence to detect 1011
        // Expected output y should be 0 initially
        #10; din = 1; #10; // S0 -> S1
        if (y !== 0) $display("FAIL: Expected y=0 at S1, got y=%b", y);

        #10; din = 0; #10; // S1 -> S2
        if (y !== 0) $display("FAIL: Expected y=0 at S2, got y=%b", y);

        #10; din = 1; #10; // S2 -> S3
        if (y !== 0) $display("FAIL: Expected y=0 at S3, got y=%b", y);

        #10; din = 1; #10; // S3 -> S4
        if (y !== 0) $display("FAIL: Expected y=0 at S4, got y=%b", y);

        #10; din = 0; #10; // S4 -> S2
        if (y !== 1) $display("FAIL: Expected y=1 at S4, got y=%b", y);

        // Check for the complete sequence 1011
        #10; din = 1; #10; // S2 -> S1
        if (y !== 0) $display("FAIL: Expected y=0 at S1 after 1011, got y=%b", y);

        #10; din = 0; #10; // S1 -> S2
        if (y !== 0) $display("FAIL: Expected y=0 at S2 after 1011, got y=%b", y);

        #10; din = 1; #10; // S2 -> S3
        if (y !== 0) $display("FAIL: Expected y=0 at S3 after 1011, got y=%b", y);

        #10; din = 1; #10; // S3 -> S4
        if (y !== 0) $display("FAIL: Expected y=0 at S4 after 1011, got y=%b", y);

        #10; din = 0; #10; // S4 -> S2
        if (y !== 1) $display("FAIL: Expected y=1 at S4 after 1011, got y=%b", y);

        // End of test
        $display("PASS");
        $finish;
    end

endmodule