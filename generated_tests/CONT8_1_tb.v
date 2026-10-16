`timescale 1ns/1ps

module tb_CONT8;
    reg clk;
    reg rst;
    reg en;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    CONT8 uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .out(out)
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
        en = 0;

        // Wait for a clock cycle
        #10;

        // Test reset functionality
        rst = 0; // Assert reset
        #10;
        if (out !== 8'b0) begin
            $display("FAIL: Reset did not set output to 0");
            $finish;
        end

        rst = 1; // Deassert reset
        #10;

        // Test counting when enabled
        en = 1; // Enable counting
        #50; // Wait for 5 clock cycles (should count to 5)
        if (out !== 8'd5) begin
            $display("FAIL: Expected output 5, got %d", out);
            $finish;
        end

        // Test counting when disabled
        en = 0; // Disable counting
        #20; // Wait for 2 clock cycles
        if (out !== 8'd5) begin
            $display("FAIL: Expected output 5, got %d", out);
            $finish;
        end

        // Re-enable counting
        en = 1; 
        #30; // Wait for 3 clock cycles (should count to 8)
        if (out !== 8'd8) begin
            $display("FAIL: Expected output 8, got %d", out);
            $finish;
        end

        // Test reset again
        rst = 0; // Assert reset
        #10;
        if (out !== 8'b0) begin
            $display("FAIL: Reset did not set output to 0");
            $finish;
        end

        // Finalize the test
        $display("PASS");
        $finish;
    end
endmodule