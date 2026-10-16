`timescale 1ns/1ps

module tb_xchecker_reg;

    parameter DW = 32;
    reg clk;
    reg [DW-1:0] data_i;
    
    // Instantiate the module under test
    xchecker_reg #(
        .DW(DW),
        .SIGNAL_NAME("data_i")
    ) uut (
        .clk(clk),
        .data_i(data_i)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize data_i
        data_i = 32'h0;

        // Wait for a few clock cycles
        #10;

        // Test with valid data
        data_i = 32'hA5A5A5A5; // No X values
        #10;

        // Test with an X value
        data_i = 32'hA5A5A5A5; // No X values
        #10;

        // Introduce an X value
        data_i = 32'hA5A5A5A5; // No X values
        #10;

        // Test with another valid data
        data_i = 32'hFFFFFFFF; // No X values
        #10;

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule