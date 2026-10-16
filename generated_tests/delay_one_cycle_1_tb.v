`timescale 1ns/1ps

module tb_delay_one_cycle;

    parameter WIDTH = 32;
    reg clk;
    reg rst_n;
    reg stall;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;

    // Instantiate the module under test (uut)
    delay_one_cycle #(.WIDTH(WIDTH)) uut (
        .clk(clk),
        .rst_n(rst_n),
        .stall(stall),
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
        stall = 0;
        data_in = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset

        // Test case 1: Normal operation
        data_in = 32'hA5A5A5A5; // Input some data
        #10; // Wait for one clock cycle
        if (data_out !== 32'hA5A5A5A5) begin
            $display("FAIL: Expected data_out to be 0xA5A5A5A5 after one clock cycle");
            $finish;
        end

        // Test case 2: Stall the output
        stall = 1; // Assert stall
        #10; // Wait for one clock cycle
        if (data_out !== 32'hA5A5A5A5) begin
            $display("FAIL: Expected data_out to remain 0xA5A5A5A5 when stalled");
            $finish;
        end

        // Test case 3: Change input while stalled
        data_in = 32'h5A5A5A5A; // Change input data
        #10; // Wait for one clock cycle
        if (data_out !== 32'hA5A5A5A5) begin
            $display("FAIL: Expected data_out to remain 0xA5A5A5A5 when stalled");
            $finish;
        end

        // Test case 4: Release stall
        stall = 0; // Deassert stall
        #10; // Wait for one clock cycle
        if (data_out !== 32'h5A5A5A5A) begin
            $display("FAIL: Expected data_out to be 0x5A5A5A5A after releasing stall");
            $finish;
        end

        // Test case 5: Reset functionality
        rst_n = 0; // Assert reset
        #10; // Wait for reset to take effect
        if (data_out !== 0) begin
            $display("FAIL: Expected data_out to be 0 after reset");
            $finish;
        end

        // Test case 6: Check behavior after reset
        rst_n = 1; // Release reset
        data_in = 32'hDEADBEEF; // New input data
        #10; // Wait for one clock cycle
        if (data_out !== 32'hDEADBEEF) begin
            $display("FAIL: Expected data_out to be 0xDEADBEEF after reset and one clock cycle");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule