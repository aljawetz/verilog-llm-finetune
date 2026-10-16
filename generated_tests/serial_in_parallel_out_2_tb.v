`timescale 1ns/1ps

module tb_serial_in_parallel_out;

    reg clk;
    reg reset;
    reg serial_in;
    wire [3:0] parallel_out;

    // Instantiate the module under test (uut)
    serial_in_parallel_out uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
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
        serial_in = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10; // Wait for 10ns

        // Test case 1: Shift in bits
        serial_in = 1; #10; // Shift in 1
        if (parallel_out !== 4'b0001) $display("FAIL: Expected 0001, got %b", parallel_out);

        serial_in = 0; #10; // Shift in 0
        if (parallel_out !== 4'b0010) $display("FAIL: Expected 0010, got %b", parallel_out);

        serial_in = 1; #10; // Shift in 1
        if (parallel_out !== 4'b0101) $display("FAIL: Expected 0101, got %b", parallel_out);

        serial_in = 1; #10; // Shift in 1
        if (parallel_out !== 4'b1011) $display("FAIL: Expected 1011, got %b", parallel_out);

        // Test case 2: Reset the module
        reset = 1; #10; // Assert reset
        if (parallel_out !== 4'b0000) $display("FAIL: Expected 0000 after reset, got %b", parallel_out);

        reset = 0; #10; // Release reset

        // Test case 3: Shift in more bits after reset
        serial_in = 0; #10; // Shift in 0
        if (parallel_out !== 4'b0000) $display("FAIL: Expected 0000, got %b", parallel_out);

        serial_in = 1; #10; // Shift in 1
        if (parallel_out !== 4'b0001) $display("FAIL: Expected 0001, got %b", parallel_out);

        serial_in = 1; #10; // Shift in 1
        if (parallel_out !== 4'b0011) $display("FAIL: Expected 0011, got %b", parallel_out);

        serial_in = 0; #10; // Shift in 0
        if (parallel_out !== 4'b0110) $display("FAIL: Expected 0110, got %b", parallel_out);

        serial_in = 1; #10; // Shift in 1
        if (parallel_out !== 4'b1101) $display("FAIL: Expected 1101, got %b", parallel_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule