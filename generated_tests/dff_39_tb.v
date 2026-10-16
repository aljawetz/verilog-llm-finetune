`timescale 1ns/1ps

module tb_dff;

    reg i_clk;
    reg i_rst;
    reg i_data;
    wire o_data;

    // Instantiate the D flip-flop
    dff uut (
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_data(i_data),
        .o_data(o_data)
    );

    // Clock generation
    initial begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        i_rst = 0;
        i_data = 0;

        // Apply reset
        #3; // Wait for a short time
        i_rst = 1; // Release reset
        #10; // Wait for a few clock cycles

        // Test case 1: Check output after reset
        if (o_data !== 0) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end

        // Test case 2: Set data and check output
        i_data = 1;
        #10; // Wait for a few clock cycles
        if (o_data !== 1) begin
            $display("FAIL: Output should be 1 after setting data");
            $finish;
        end

        // Test case 3: Change data and check output
        i_data = 0;
        #10; // Wait for a few clock cycles
        if (o_data !== 0) begin
            $display("FAIL: Output should be 0 after changing data");
            $finish;
        end

        // Test case 4: Check output with reset
        i_rst = 0; // Assert reset
        #10; // Wait for a few clock cycles
        if (o_data !== 0) begin
            $display("FAIL: Output should be 0 when reset is asserted");
            $finish;
        end

        // Test case 5: Release reset and check output
        i_rst = 1; // Release reset
        i_data = 1;
        #10; // Wait for a few clock cycles
        if (o_data !== 1) begin
            $display("FAIL: Output should be 1 after setting data post-reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule