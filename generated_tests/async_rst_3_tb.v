`timescale 1ns/1ps

module tb_async_rst;

    reg in;
    reg clk;
    reg rst;
    wire out;

    // Instantiate the module under test (uut)
    async_rst uut (
        .in(in),
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        in = 1'b0;
        rst = 1'b1;

        // Wait for a clock edge
        #10;

        // Test 1: Check output when reset is not asserted
        in = 1'b1; // Set input to 1
        #10; // Wait for one clock cycle
        if (out !== 1'b1) begin
            $display("FAIL: Output should be 1 when input is 1 and reset is not asserted");
            $finish;
        end

        // Test 2: Assert reset
        rst = 1'b0; // Assert reset
        #10; // Wait for one clock cycle
        if (out !== 1'b0) begin
            $display("FAIL: Output should be 0 when reset is asserted");
            $finish;
        end

        // Test 3: Deassert reset and check output
        rst = 1'b1; // Deassert reset
        #10; // Wait for one clock cycle
        if (out !== 1'b1) begin
            $display("FAIL: Output should be 1 after reset is deasserted and input is 1");
            $finish;
        end

        // Test 4: Change input while clock is high
        in = 1'b0; // Change input to 0
        #10; // Wait for one clock cycle
        if (out !== 1'b0) begin
            $display("FAIL: Output should be 0 after input is changed to 0");
            $finish;
        end

        // Test 5: Assert reset again
        rst = 1'b0; // Assert reset
        #10; // Wait for one clock cycle
        if (out !== 1'b0) begin
            $display("FAIL: Output should be 0 when reset is asserted again");
            $finish;
        end

        // Test 6: Deassert reset and check output with new input
        rst = 1'b1; // Deassert reset
        in = 1'b1; // Set input to 1
        #10; // Wait for one clock cycle
        if (out !== 1'b1) begin
            $display("FAIL: Output should be 1 after reset is deasserted and input is 1");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule