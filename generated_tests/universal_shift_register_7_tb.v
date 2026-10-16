`timescale 1ns/1ps

module tb_universal_shift_register;

    reg clk;
    reg reset;
    reg shift_left;
    reg shift_right;
    reg [7:0] parallel_in;
    wire [7:0] parallel_out;

    // Instantiate the module under test (uut)
    universal_shift_register uut (
        .clk(clk),
        .reset(reset),
        .shift_left(shift_left),
        .shift_right(shift_right),
        .parallel_in(parallel_in),
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
        shift_left = 0;
        shift_right = 0;
        parallel_in = 8'b00000000;

        // Wait for a clock cycle
        #10;
        
        // Release reset
        reset = 0;
        #10;

        // Test loading parallel data
        parallel_in = 8'b10101010;
        #10;
        if (parallel_out !== 8'b10101010) begin
            $display("FAIL: Parallel load failed");
            $finish;
        end

        // Test shifting left
        shift_left = 1;
        #10;
        if (parallel_out !== 8'b01010100) begin
            $display("FAIL: Shift left failed");
            $finish;
        end
        shift_left = 0;

        // Test shifting right
        shift_right = 1;
        #10;
        if (parallel_out !== 8'b00101010) begin
            $display("FAIL: Shift right failed");
            $finish;
        end
        shift_right = 0;

        // Test reset functionality
        reset = 1;
        #10;
        if (parallel_out !== 8'b00000000) begin
            $display("FAIL: Reset failed");
            $finish;
        end
        reset = 0;

        // Test multiple shifts
        parallel_in = 8'b11110000;
        #10;
        if (parallel_out !== 8'b11110000) begin
            $display("FAIL: Parallel load failed");
            $finish;
        end
        
        shift_left = 1;
        #10;
        shift_left = 0;
        if (parallel_out !== 8'b11100000) begin
            $display("FAIL: Shift left failed");
            $finish;
        end
        
        shift_left = 1;
        #10;
        shift_left = 0;
        if (parallel_out !== 8'b11000000) begin
            $display("FAIL: Shift left failed");
            $finish;
        end

        // Final check
        reset = 1;
        #10;
        if (parallel_out !== 8'b00000000) begin
            $display("FAIL: Reset failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule