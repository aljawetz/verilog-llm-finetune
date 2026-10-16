`timescale 1ns/1ps

module tb_clock_gating_register;

    reg clk;
    reg rst;
    reg enable;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate the module under test (uut)
    clock_gating_register uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
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
        enable = 0;
        data_in = 8'h00;

        // Release reset
        #10;
        rst = 0;

        // Test 1: Check reset functionality
        #10;
        if (data_out !== 8'b0) begin
            $display("FAIL: Reset did not clear data_out");
            $finish;
        end

        // Test 2: Enable clock gating and check data input
        enable = 1;
        data_in = 8'hA5; // Test data

        // Wait for one clock cycle
        #10;
        if (data_out !== 8'hA5) begin
            $display("FAIL: data_out did not match data_in when enabled");
            $finish;
        end

        // Test 3: Disable clock gating and check data input
        enable = 0;
        data_in = 8'h5A; // New test data

        // Wait for one clock cycle
        #10;
        if (data_out !== 8'hA5) begin
            $display("FAIL: data_out changed when enable was low");
            $finish;
        end

        // Test 4: Re-enable and check data input
        enable = 1;

        // Wait for one clock cycle
        #10;
        if (data_out !== 8'h5A) begin
            $display("FAIL: data_out did not match new data_in when re-enabled");
            $finish;
        end

        // Test 5: Check reset functionality again
        rst = 1;
        #10;
        if (data_out !== 8'b0) begin
            $display("FAIL: Reset did not clear data_out on reassertion");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule