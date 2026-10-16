`timescale 1ns/1ps

module tb_posedge_detect;

    reg sig;
    reg clk;
    reg rst;
    wire pe;
    wire ne;

    // Instantiate the module under test (uut)
    posedge_detect uut (
        .sig(sig),
        .clk(clk),
        .rst(rst),
        .pe(pe),
        .ne(ne)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        sig = 0;
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        rst = 0; // Deassert reset

        // Test case 1: Detect positive edge
        sig = 0; #10; // sig remains low
        if (pe !== 0 || ne !== 0) $display("FAIL: Test case 1 failed at time %0t", $time);
        
        sig = 1; #10; // sig goes high
        if (pe !== 1 || ne !== 0) $display("FAIL: Test case 1 failed at time %0t", $time);
        
        sig = 1; #10; // sig remains high
        if (pe !== 0 || ne !== 0) $display("FAIL: Test case 1 failed at time %0t", $time);

        // Test case 2: Detect negative edge
        sig = 0; #10; // sig goes low
        if (pe !== 0 || ne !== 1) $display("FAIL: Test case 2 failed at time %0t", $time);
        
        sig = 0; #10; // sig remains low
        if (pe !== 0 || ne !== 0) $display("FAIL: Test case 2 failed at time %0t", $time);
        
        sig = 1; #10; // sig goes high
        if (pe !== 0 || ne !== 0) $display("FAIL: Test case 2 failed at time %0t", $time);

        // Test case 3: Reset functionality
        rst = 1; #10; // Assert reset
        if (pe !== 0 || ne !== 0) $display("FAIL: Reset failed at time %0t", $time);
        
        rst = 0; #10; // Deassert reset
        sig = 1; #10; // sig goes high
        if (pe !== 1 || ne !== 0) $display("FAIL: Test case 3 failed at time %0t", $time);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule