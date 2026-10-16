`timescale 1ns/1ps

module tb_mealy_non_overlapping;

    reg din;
    reg clk;
    reg reset;
    wire dout;

    // Instantiate the module under test (uut)
    mealy_non_overlapping uut (
        .din(din),
        .clk(clk),
        .reset(reset),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        din = 0;
        reset = 1;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test sequence
        // State transitions with input din
        // s0 -> s1
        din = 1; #10;
        if (uut.current_state !== 2'b01) $display("FAIL: Expected state s1 after din=1 from s0");
        
        // s1 -> s2
        din = 0; #10;
        if (uut.current_state !== 2'b10) $display("FAIL: Expected state s2 after din=0 from s1");
        
        // s2 -> s3
        din = 0; #10;
        if (uut.current_state !== 2'b11) $display("FAIL: Expected state s3 after din=0 from s2");
        
        // s3 -> s0, dout should be 1
        din = 1; #10;
        if (uut.current_state !== 2'b00) $display("FAIL: Expected state s0 after din=1 from s3");
        if (dout !== 1'b1) $display("FAIL: Expected dout=1 after transition from s3 to s0");

        // Reset the system
        reset = 1; #10;
        reset = 0; #10;

        // Check if back to initial state
        if (uut.current_state !== 2'b00) $display("FAIL: Expected state s0 after reset");
        if (dout !== 1'b0) $display("FAIL: Expected dout=0 after reset");

        // Final checks
        $display("PASS");
        $finish;
    end

endmodule