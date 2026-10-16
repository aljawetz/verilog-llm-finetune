`timescale 1ns/1ps

module tb_bidirectional_shift_register;

    reg clk;
    reg rst;
    reg shift_direction;
    reg data_in;
    wire data_out;

    // Instantiate the unit under test (UUT)
    bidirectional_shift_register uut (
        .clk(clk),
        .rst(rst),
        .shift_direction(shift_direction),
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
        rst = 1;
        shift_direction = 0;
        data_in = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test shifting left
        shift_direction = 0; // Shift left
        data_in = 1; // Input data
        #10; // Wait for one clock cycle
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after reset");
        
        // Shift left with data_in
        #10; // Wait for one clock cycle
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after first left shift");
        
        // Shift left again
        #10; // Wait for one clock cycle
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after second left shift");

        // Shift left with data_in
        #10; // Wait for one clock cycle
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after third left shift");

        // Shift right
        shift_direction = 1; // Shift right
        #10; // Wait for one clock cycle
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after first right shift");

        // Shift left with data_in
        shift_direction = 0; // Shift left
        #10; // Wait for one clock cycle
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after fourth left shift");

        // Shift left with data_in
        #10; // Wait for one clock cycle
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after fifth left shift");

        // Shift right with data_in
        shift_direction = 1; // Shift right
        #10; // Wait for one clock cycle
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after sixth right shift");

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule