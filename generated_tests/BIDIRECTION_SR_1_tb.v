`timescale 1ns/1ps

module tb_BIDIRECTION_SR;

    reg clk;
    reg reset;
    reg shift;
    reg data_in;
    wire [3:0] data_out;

    // Instantiate the module under test (uut)
    BIDIRECTION_SR uut (
        .clk(clk),
        .reset(reset),
        .shift(shift),
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
        reset = 1;
        shift = 0;
        data_in = 0;

        // Wait for a clock cycle
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Test shifting left
        shift = 0; data_in = 1; #10; // data_out should be 1000
        if (data_out !== 4'b1000) $display("FAIL: Expected 1000, got %b", data_out);

        shift = 0; data_in = 0; #10; // data_out should be 0000
        if (data_out !== 4'b0000) $display("FAIL: Expected 0000, got %b", data_out);

        shift = 0; data_in = 1; #10; // data_out should be 1000
        if (data_out !== 4'b1000) $display("FAIL: Expected 1000, got %b", data_out);

        // Test shifting right
        shift = 1; data_in = 1; #10; // data_out should be 0100
        if (data_out !== 4'b0100) $display("FAIL: Expected 0100, got %b", data_out);

        shift = 1; data_in = 0; #10; // data_out should be 0010
        if (data_out !== 4'b0010) $display("FAIL: Expected 0010, got %b", data_out);

        shift = 1; data_in = 1; #10; // data_out should be 1001
        if (data_out !== 4'b1001) $display("FAIL: Expected 1001, got %b", data_out);

        // Test reset functionality
        reset = 1; #10; // data_out should be 0000
        if (data_out !== 4'b0000) $display("FAIL: Expected 0000 after reset, got %b", data_out);

        // End of test
        $display("PASS");
        $finish;
    end

endmodule