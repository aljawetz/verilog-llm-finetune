`timescale 1ns/1ps

module tb_Xunit;

    reg clock;
    reg [9:0] x0;
    reg [9:0] x1;
    reg start_tanh;
    wire [9:0] x_difference;

    // Instantiate the Unit Under Test (UUT)
    Xunit uut (
        .clock(clock),
        .x0(x0),
        .x1(x1),
        .start_tanh(start_tanh),
        .x_difference(x_difference)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    initial begin
        // Initialize inputs
        x0 = 10'b0000000000;
        x1 = 10'b0000000000;
        start_tanh = 0;

        // Test case 1: start_tanh = 0, expect x_difference = x1
        x1 = 10'b0000000001; // Set x1 to 1
        #10; // Wait for one clock cycle
        if (x_difference !== x1) begin
            $display("FAIL: Expected x_difference = %b, got %b", x1, x_difference);
            $finish;
        end

        // Test case 2: start_tanh = 1, expect x_difference = x0
        start_tanh = 1;
        x0 = 10'b0000000010; // Set x0 to 2
        #10; // Wait for one clock cycle
        if (x_difference !== x0) begin
            $display("FAIL: Expected x_difference = %b, got %b", x0, x_difference);
            $finish;
        end

        // Test case 3: start_tanh = 0, expect x_difference = x1
        start_tanh = 0;
        x1 = 10'b0000000100; // Set x1 to 4
        #10; // Wait for one clock cycle
        if (x_difference !== x1) begin
            $display("FAIL: Expected x_difference = %b, got %b", x1, x_difference);
            $finish;
        end

        // Test case 4: start_tanh = 1, expect x_difference = x0
        start_tanh = 1;
        x0 = 10'b0000001000; // Set x0 to 8
        #10; // Wait for one clock cycle
        if (x_difference !== x0) begin
            $display("FAIL: Expected x_difference = %b, got %b", x0, x_difference);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule