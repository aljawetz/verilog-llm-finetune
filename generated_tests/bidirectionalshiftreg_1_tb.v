`timescale 1ns/1ps

module tb_bidirectionalshiftreg;

    reg clk;
    reg reset;
    reg datain;
    reg mode;
    wire [3:0] dataout;

    // Instantiate the unit under test (UUT)
    bidirectionalshiftreg uut (
        .clk(clk),
        .reset(reset),
        .datain(datain),
        .mode(mode),
        .dataout(dataout)
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
        datain = 0;
        mode = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;

        // Test left shift (mode = 1)
        mode = 1;

        // Shift in 1
        datain = 1; #10;
        if (dataout !== 4'b0001) $display("FAIL: Expected 0001, got %b", dataout);

        // Shift in 0
        datain = 0; #10;
        if (dataout !== 4'b0010) $display("FAIL: Expected 0010, got %b", dataout);

        // Shift in 1
        datain = 1; #10;
        if (dataout !== 4'b0101) $display("FAIL: Expected 0101, got %b", dataout);

        // Shift in 1
        datain = 1; #10;
        if (dataout !== 4'b1011) $display("FAIL: Expected 1011, got %b", dataout);

        // Reset the register
        reset = 1; #10;
        reset = 0; #10;
        if (dataout !== 4'b0000) $display("FAIL: Expected 0000 after reset, got %b", dataout);

        // Test right shift (mode = 0)
        mode = 0;

        // Shift in 1
        datain = 1; #10;
        if (dataout !== 4'b1000) $display("FAIL: Expected 1000, got %b", dataout);

        // Shift in 0
        datain = 0; #10;
        if (dataout !== 4'b0100) $display("FAIL: Expected 0100, got %b", dataout);

        // Shift in 1
        datain = 1; #10;
        if (dataout !== 4'b1010) $display("FAIL: Expected 1010, got %b", dataout);

        // Shift in 1
        datain = 1; #10;
        if (dataout !== 4'b1101) $display("FAIL: Expected 1101, got %b", dataout);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule