`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg rst;
    reg in;
    wire norst_o;
    wire syncrst_o;
    wire asyncrst_o;

    // Instantiate the module under test (uut)
    dff uut (
        .clk(clk),
        .rst(rst),
        .in(in),
        .norst_o(norst_o),
        .syncrst_o(syncrst_o),
        .asyncrst_o(asyncrst_o)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        // Initialize inputs
        rst = 0;
        in = 0;

        // Test sequence
        // Test 1: No reset behavior
        #10 in = 1; // Set input high
        #10 if (norst_o !== 1) $display("FAIL: No reset output incorrect at time %0t", $time);
        #10 in = 0; // Set input low
        #10 if (norst_o !== 0) $display("FAIL: No reset output incorrect at time %0t", $time);
        
        // Test 2: Synchronous reset behavior
        #10 rst = 1; // Assert reset
        #10 if (syncrst_o !== 0) $display("FAIL: Synchronous reset output incorrect at time %0t", $time);
        #10 rst = 0; // Deassert reset
        #10 in = 1; // Set input high
        #10 if (syncrst_o !== 1) $display("FAIL: Synchronous output incorrect at time %0t", $time);
        #10 in = 0; // Set input low
        #10 if (syncrst_o !== 0) $display("FAIL: Synchronous output incorrect at time %0t", $time);
        
        // Test 3: Asynchronous reset behavior
        #10 rst = 1; // Assert reset
        #10 if (asyncrst_o !== 0) $display("FAIL: Asynchronous reset output incorrect at time %0t", $time);
        #10 rst = 0; // Deassert reset
        #10 in = 1; // Set input high
        #10 if (asyncrst_o !== 1) $display("FAIL: Asynchronous output incorrect at time %0t", $time);
        #10 in = 0; // Set input low
        #10 if (asyncrst_o !== 0) $display("FAIL: Asynchronous output incorrect at time %0t", $time);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule