`timescale 1ns/1ps

module tb_moore_fsm_nol;

    reg din;
    reg clk;
    reg rst;
    wire dout;

    // Instantiate the module under test
    moore_fsm_nol uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        din = 0;
        rst = 1; // Assert reset
        #10;
        
        rst = 0; // Deassert reset
        #10;

        // Test sequence 1: Transition through states
        din = 1; #10; // From s0 to s1
        if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s1");
        
        din = 0; #10; // From s1 to s2
        if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s2");
        
        din = 1; #10; // From s2 to s3
        if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s3");
        
        din = 0; #10; // From s3 to s4
        if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s4");
        
        din = 1; #10; // From s4 to s1
        if (uut.dout !== 1'b1) $display("FAIL: dout should be 1 in state s1 after transition from s4");
        
        // Test sequence 2: Reset functionality
        rst = 1; #10; // Assert reset
        rst = 0; #10; // Deassert reset
        
        din = 1; #10; // From s0 to s1
        din = 0; #10; // From s1 to s2
        din = 1; #10; // From s2 to s3
        din = 0; #10; // From s3 to s4
        din = 1; #10; // From s4 to s1
        
        // Final check
        if (uut.dout !== 1'b1) $display("FAIL: dout should be 1 in state s1 after transition from s4");
        
        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule