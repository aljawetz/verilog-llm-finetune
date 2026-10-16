`timescale 1ns/1ps

module tb_rd_to_wrt_sync;

    parameter ADDR_SIZE = 4;
    reg [ADDR_SIZE:0] rd_ptr;
    reg wrt_clk;
    reg wrt_rst;
    wire [ADDR_SIZE:0] sync_rd_ptr;

    // Instantiate the module under test
    rd_to_wrt_sync #(ADDR_SIZE) uut (
        .sync_rd_ptr(sync_rd_ptr),
        .rd_ptr(rd_ptr),
        .wrt_clk(wrt_clk),
        .wrt_rst(wrt_rst)
    );

    // Clock generation
    initial begin
        wrt_clk = 0;
        forever #5 wrt_clk = ~wrt_clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        wrt_rst = 1;
        rd_ptr = 5'b00000;
        #10; // Wait for reset to take effect
        wrt_rst = 0;

        // Test case 1: Check reset behavior
        if (sync_rd_ptr !== 5'b00000) begin
            $display("FAIL: Reset did not set sync_rd_ptr to 0");
            $finish;
        end

        // Test case 2: Drive rd_ptr and check sync_rd_ptr
        rd_ptr = 5'b00001; 
        #10; // Wait for two clock cycles
        if (sync_rd_ptr !== 5'b00000) begin
            $display("FAIL: sync_rd_ptr should be 0 after first clock cycle");
            $finish;
        end

        // Test case 3: Check synchronization of rd_ptr
        #10; // Wait for another clock cycle
        if (sync_rd_ptr !== 5'b00001) begin
            $display("FAIL: sync_rd_ptr should be 1 after second clock cycle");
            $finish;
        end

        // Test case 4: Change rd_ptr and check sync_rd_ptr
        rd_ptr = 5'b00010; 
        #10; // Wait for two clock cycles
        if (sync_rd_ptr !== 5'b00001) begin
            $display("FAIL: sync_rd_ptr should be 1 after third clock cycle");
            $finish;
        end

        // Test case 5: Check synchronization with multiple changes
        rd_ptr = 5'b00111; 
        #10; // Wait for two clock cycles
        if (sync_rd_ptr !== 5'b00010) begin
            $display("FAIL: sync_rd_ptr should be 2 after fourth clock cycle");
            $finish;
        end

        // Test case 6: Assert reset again
        wrt_rst = 1;
        #10; // Wait for reset to take effect
        if (sync_rd_ptr !== 5'b00000) begin
            $display("FAIL: Reset did not set sync_rd_ptr to 0 again");
            $finish;
        end

        // Test case 7: Final check after reset
        wrt_rst = 0;
        rd_ptr = 5'b01000; 
        #10; // Wait for two clock cycles
        if (sync_rd_ptr !== 5'b00000) begin
            $display("FAIL: sync_rd_ptr should be 0 after reset and before next clock");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (sync_rd_ptr !== 5'b01000) begin
            $display("FAIL: sync_rd_ptr should be 8 after next clock cycle");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule