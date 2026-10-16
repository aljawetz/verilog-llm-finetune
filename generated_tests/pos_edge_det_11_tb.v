`timescale 1ns/1ps

module tb_pos_edge_det;

    reg sig;
    reg clk;
    reg rstn;
    wire pe;

    // Instantiate the module under test (uut)
    pos_edge_det uut (
        .sig(sig),
        .clk(clk),
        .rstn(rstn),
        .pe(pe)
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
        rstn = 0;

        // Apply reset
        #10;
        rstn = 1;

        // Test case 1: No rising edge
        #10;
        if (pe !== 0) $display("FAIL: Expected pe = 0, got pe = %b", pe);

        // Test case 2: Rising edge detected
        #10;
        sig = 1; // Rising edge
        #10;
        if (pe !== 1) $display("FAIL: Expected pe = 1, got pe = %b", pe);
        #10;
        if (pe !== 0) $display("FAIL: Expected pe = 0, got pe = %b", pe);

        // Test case 3: No rising edge
        #10;
        sig = 0; // No rising edge
        #10;
        if (pe !== 0) $display("FAIL: Expected pe = 0, got pe = %b", pe);

        // Test case 4: Another rising edge detected
        #10;
        sig = 1; // Rising edge
        #10;
        if (pe !== 1) $display("FAIL: Expected pe = 1, got pe = %b", pe);
        #10;
        if (pe !== 0) $display("FAIL: Expected pe = 0, got pe = %b", pe);

        // Test case 5: Reset functionality
        #10;
        rstn = 0; // Assert reset
        #10;
        if (pe !== 0) $display("FAIL: Expected pe = 0 during reset, got pe = %b", pe);
        rstn = 1; // Deassert reset
        #10;

        // Final check after reset
        sig = 1; // Rising edge
        #10;
        if (pe !== 1) $display("FAIL: Expected pe = 1 after reset, got pe = %b", pe);
        #10;
        if (pe !== 0) $display("FAIL: Expected pe = 0 after pulse, got pe = %b", pe);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule