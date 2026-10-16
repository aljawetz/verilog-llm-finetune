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
        data_in = 8'b0;

        // Apply reset
        #10;
        rst = 0;

        // Test 1: Check reset functionality
        #10;
        if (data_out !== 8'b0) begin
            $display("FAIL: Reset did not set data_out to 0");
            $finish;
        end

        // Test 2: Enable clock and check data input
        enable = 1;
        data_in = 8'b10101010;
        #10; // Wait for one clock cycle
        if (data_out !== 8'b10101010) begin
            $display("FAIL: data_out did not match data_in when enabled");
            $finish;
        end

        // Test 3: Disable clock and check data output remains unchanged
        enable = 0;
        data_in = 8'b11110000;
        #10; // Wait for one clock cycle
        if (data_out !== 8'b10101010) begin
            $display("FAIL: data_out changed when clock was disabled");
            $finish;
        end

        // Test 4: Re-enable clock and check new data input
        enable = 1;
        #10; // Wait for one clock cycle
        if (data_out !== 8'b11110000) begin
            $display("FAIL: data_out did not update with new data_in when re-enabled");
            $finish;
        end

        // Test 5: Assert reset functionality again
        rst = 1;
        #10; // Wait for reset to take effect
        if (data_out !== 8'b0) begin
            $display("FAIL: Reset did not set data_out to 0 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule