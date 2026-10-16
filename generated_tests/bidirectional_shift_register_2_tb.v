`timescale 1ns/1ps

module tb_bidirectional_shift_register;

    reg clk;
    reg rst;
    reg s;
    reg [3:0] d_in;
    wire [3:0] y_out;

    // Instantiate the unit under test (UUT)
    bidirectional_shift_register uut (
        .clk(clk),
        .rst(rst),
        .s(s),
        .d_in(d_in),
        .y_out(y_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 0;
        s = 0;
        d_in = 4'b0000;
        #10;

        // Release reset
        rst = 1;
        #10;

        // Test shifting right
        d_in = 4'b1010; // Load data
        #10; // Wait for clock
        if (y_out !== 4'b0101) $display("FAIL: Expected 0101 after right shift, got %b", y_out);

        // Shift right again
        #10; // Wait for clock
        if (y_out !== 4'b0010) $display("FAIL: Expected 0010 after right shift, got %b", y_out);

        // Shift right again
        #10; // Wait for clock
        if (y_out !== 4'b0001) $display("FAIL: Expected 0001 after right shift, got %b", y_out);

        // Shift right again
        #10; // Wait for clock
        if (y_out !== 4'b0000) $display("FAIL: Expected 0000 after right shift, got %b", y_out);

        // Test shifting left
        s = 1; // Set to shift left
        d_in = 4'b1010; // Load data
        #10; // Wait for clock
        if (y_out !== 4'b0100) $display("FAIL: Expected 0100 after left shift, got %b", y_out);

        // Shift left again
        #10; // Wait for clock
        if (y_out !== 4'b1000) $display("FAIL: Expected 1000 after left shift, got %b", y_out);

        // Shift left again
        #10; // Wait for clock
        if (y_out !== 4'b0000) $display("FAIL: Expected 0000 after left shift, got %b", y_out);

        // Test reset functionality
        rst = 0; // Assert reset
        #10;
        if (y_out !== 4'b0000) $display("FAIL: Expected 0000 after reset, got %b", y_out);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule