`timescale 1ns/1ps

module tb_sipo;

    reg clk;
    reg reset;
    reg datain;
    wire [3:0] dataout;

    // Instantiate the module under test (uut)
    sipo uut (
        .clk(clk),
        .reset(reset),
        .datain(datain),
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
        #10; // Wait for a few clock cycles

        // Release reset
        reset = 0;
        #10;

        // Test shifting in bits
        datain = 1; #10; // Shift in 1
        if (dataout !== 4'b0001) $display("FAIL: Expected dataout=0001, got %b", dataout);

        datain = 0; #10; // Shift in 0
        if (dataout !== 4'b0010) $display("FAIL: Expected dataout=0010, got %b", dataout);

        datain = 1; #10; // Shift in 1
        if (dataout !== 4'b0101) $display("FAIL: Expected dataout=0101, got %b", dataout);

        datain = 1; #10; // Shift in 1
        if (dataout !== 4'b1011) $display("FAIL: Expected dataout=1011, got %b", dataout);

        // Reset the register
        reset = 1; #10;
        if (dataout !== 4'b0000) $display("FAIL: Expected dataout=0000 after reset, got %b", dataout);

        // Release reset and shift in more bits
        reset = 0; #10;
        datain = 1; #10; // Shift in 1
        datain = 0; #10; // Shift in 0
        datain = 1; #10; // Shift in 1
        if (dataout !== 4'b0101) $display("FAIL: Expected dataout=0101, got %b", dataout);

        // End of test
        $display("PASS");
        $finish;
    end

endmodule