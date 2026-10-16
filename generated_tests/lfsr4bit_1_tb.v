`timescale 1ns/1ps

module tb_lfsr4bit;

    reg clk;
    reg rst;
    wire [3:0] rand_out;

    // Instantiate the module under test (uut)
    lfsr4bit uut (
        .clk(clk),
        .rst(rst),
        .rand_out(rand_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Reset the LFSR
        rst = 1;
        #10; // Wait for 10ns
        rst = 0;

        // Check the initial state after reset
        if (rand_out !== 4'b0001) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Allow some clock cycles to generate pseudo-random values
        #10; // Wait for 10ns
        if (rand_out === 4'b0001) begin
            $display("FAIL: LFSR did not change after clock cycles");
            $finish;
        end

        // Check the output for a few more cycles
        #20; // Wait for 20ns
        if (rand_out === 4'b0001) begin
            $display("FAIL: LFSR did not change after additional clock cycles");
            $finish;
        end

        // Check for a few more values to ensure randomness
        #20; // Wait for 20ns
        if (rand_out === 4'b0001) begin
            $display("FAIL: LFSR did not change after further clock cycles");
            $finish;
        end

        // If we reach here, all checks have passed
        $display("PASS");
        $finish;
    end

endmodule