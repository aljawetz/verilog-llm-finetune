`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg reset;
    reg valid;
    reg [3:0] wstrb;
    reg [15:0] wdata;
    reg [15:0] la_write;
    reg [15:0] la_input;
    wire ready;
    wire [15:0] rdata;
    wire [15:0] count;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .reset(reset),
        .valid(valid),
        .wstrb(wstrb),
        .wdata(wdata),
        .la_write(la_write),
        .la_input(la_input),
        .ready(ready),
        .rdata(rdata),
        .count(count)
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
        valid = 0;
        wstrb = 4'b0000;
        wdata = 16'h0000;
        la_write = 16'h0000;
        la_input = 16'hFFFF;

        // Release reset
        #10 reset = 0;

        // Test normal counting
        #10;
        if (count !== 1) $display("FAIL: Count should be 1 after 1 clock cycle");
        
        #10;
        if (count !== 2) $display("FAIL: Count should be 2 after 2 clock cycles");

        // Test valid write
        valid = 1;
        wstrb = 4'b0001; // Write to lower byte
        wdata = 16'h00FF; // New value for lower byte
        #10;
        if (ready !== 1) $display("FAIL: Ready should be asserted after valid write");
        if (count[7:0] !== 8'hFF) $display("FAIL: Lower byte of count should be 0xFF after write");

        // Test conditional load with la_write and la_input
        la_write = 16'h00FF; // Load value
        la_input = 16'hFFFF; // Input value
        #10;
        if (count !== 16'h00FF) $display("FAIL: Count should be 0x00FF after la_write and la_input");

        // Test reset functionality
        reset = 1;
        #10;
        if (count !== 0) $display("FAIL: Count should be 0 after reset");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule