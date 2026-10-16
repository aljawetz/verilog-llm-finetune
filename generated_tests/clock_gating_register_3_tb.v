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
        data_in = 8'b00000000;
        #10; // Wait for a clock cycle

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check reset functionality
        if (data_out !== 8'b0) begin
            $display("FAIL: Reset did not set data_out to 0");
            $finish;
        end

        // Test case 2: Enable clock and load data
        enable = 1;
        data_in = 8'b10101010;
        #10; // Wait for a clock cycle
        if (data_out !== 8'b10101010) begin
            $display("FAIL: data_out did not match data_in after clock edge");
            $finish;
        end

        // Test case 3: Disable clock and check data_out remains unchanged
        enable = 0;
        data_in = 8'b11111111;
        #10; // Wait for a clock cycle
        if (data_out !== 8'b10101010) begin
            $display("FAIL: data_out changed when clock was disabled");
            $finish;
        end

        // Test case 4: Re-enable clock and load new data
        enable = 1;
        data_in = 8'b00001111;
        #10; // Wait for a clock cycle
        if (data_out !== 8'b00001111) begin
            $display("FAIL: data_out did not match new data_in after clock edge");
            $finish;
        end

        // Test case 5: Assert reset while clock is enabled
        rst = 1;
        #10; // Wait for a clock cycle
        if (data_out !== 8'b0) begin
            $display("FAIL: Reset did not set data_out to 0 during clock enable");
            $finish;
        end

        // Test case 6: Assert reset while clock is disabled
        rst = 0;
        enable = 0;
        #10; // Wait for a clock cycle
        rst = 1;
        #10; // Wait for a clock cycle
        if (data_out !== 8'b0) begin
            $display("FAIL: Reset did not set data_out to 0 when clock was disabled");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule