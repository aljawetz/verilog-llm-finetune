`timescale 1ns/1ps

module tb_edgedetector;
    reg clk;
    reg reset;
    reg a_i;
    wire rising_edge_o;
    wire falling_edge_o;

    // Instantiate the module under test (uut)
    edgedetector uut (
        .clk(clk),
        .reset(reset),
        .a_i(a_i),
        .rising_edge_o(rising_edge_o),
        .falling_edge_o(falling_edge_o)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        a_i = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test rising edge detection
        a_i = 0; #10; // No edge
        if (rising_edge_o !== 0) $display("FAIL: Rising edge detected incorrectly when a_i is low");
        
        a_i = 1; #10; // Rising edge
        if (rising_edge_o !== 1) $display("FAIL: Rising edge not detected when a_i transitions from 0 to 1");
        
        a_i = 1; #10; // No edge
        if (rising_edge_o !== 0) $display("FAIL: Rising edge detected incorrectly when a_i is high");

        // Test falling edge detection
        a_i = 1; #10; // No edge
        if (falling_edge_o !== 0) $display("FAIL: Falling edge detected incorrectly when a_i is high");
        
        a_i = 0; #10; // Falling edge
        if (falling_edge_o !== 1) $display("FAIL: Falling edge not detected when a_i transitions from 1 to 0");
        
        a_i = 0; #10; // No edge
        if (falling_edge_o !== 0) $display("FAIL: Falling edge detected incorrectly when a_i is low");

        // Final check
        $display("PASS");
        $finish;
    end
endmodule