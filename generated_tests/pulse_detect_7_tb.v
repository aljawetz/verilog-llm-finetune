`timescale 1ns/1ps

module tb_pulse_detect;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg data_in;
    wire data_out;

    // Instantiate the module under test (uut)
    pulse_detect uut (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        data_in = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset

        // Test case 1: No pulse
        #10 data_in = 0; // Shift reg: 000
        #10 data_in = 0; // Shift reg: 000
        #10 data_in = 0; // Shift reg: 000
        #10;
        if (data_out !== 1'b0) $display("FAIL: Expected data_out = 0, got %b", data_out);

        // Test case 2: Detect pulse 010
        #10 data_in = 1; // Shift reg: 001
        #10 data_in = 0; // Shift reg: 010
        #10 data_in = 0; // Shift reg: 100
        #10;
        if (data_out !== 1'b1) $display("FAIL: Expected data_out = 1, got %b", data_out);

        // Test case 3: No pulse
        #10 data_in = 1; // Shift reg: 001
        #10 data_in = 1; // Shift reg: 011
        #10 data_in = 0; // Shift reg: 110
        #10;
        if (data_out !== 1'b0) $display("FAIL: Expected data_out = 0, got %b", data_out);

        // Test case 4: Another pulse 010
        #10 data_in = 1; // Shift reg: 100
        #10 data_in = 0; // Shift reg: 001
        #10 data_in = 0; // Shift reg: 010
        #10;
        if (data_out !== 1'b1) $display("FAIL: Expected data_out = 1, got %b", data_out);

        // Test case 5: Reset functionality
        #10 rst_n = 0; // Assert reset
        #10 rst_n = 1; // Release reset
        #10;
        if (data_out !== 1'b0) $display("FAIL: Expected data_out = 0 after reset, got %b", data_out);

        // End of test
        $display("PASS");
        $finish;
    end

endmodule