`timescale 1ns/1ps

module tb_wrt_to_rd_sync;

    parameter ADDR_SIZE = 4;
    reg [ADDR_SIZE:0] wrt_ptr;
    reg rd_clk;
    reg rd_rst;
    wire [ADDR_SIZE:0] sync_wrt_ptr;

    // Instantiate the module under test (uut)
    wrt_to_rd_sync #(.ADDR_SIZE(ADDR_SIZE)) uut (
        .sync_wrt_ptr(sync_wrt_ptr),
        .wrt_ptr(wrt_ptr),
        .rd_clk(rd_clk),
        .rd_rst(rd_rst)
    );

    // Clock generation
    initial begin
        rd_clk = 0;
        forever #5 rd_clk = ~rd_clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        wrt_ptr = 0;
        rd_rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        rd_rst = 0; // Deassert reset

        // Test case 1: Check sync_wrt_ptr after reset
        #10;
        if (sync_wrt_ptr !== 0) begin
            $display("FAIL: sync_wrt_ptr should be 0 after reset");
            $finish;
        end

        // Test case 2: Write pointer update
        wrt_ptr = 5'b00001; // Set write pointer
        #10; // Wait for clock edge
        if (sync_wrt_ptr !== 5'b00000) begin
            $display("FAIL: sync_wrt_ptr should be 0 after first clock with wrt_ptr = 1");
            $finish;
        end

        // Test case 3: Check sync_wrt_ptr after second clock
        #10; // Wait for next clock edge
        if (sync_wrt_ptr !== 5'b00001) begin
            $display("FAIL: sync_wrt_ptr should be 1 after second clock with wrt_ptr = 1");
            $finish;
        end

        // Test case 4: Change write pointer
        wrt_ptr = 5'b00010; // Change write pointer
        #10; // Wait for clock edge
        if (sync_wrt_ptr !== 5'b00001) begin
            $display("FAIL: sync_wrt_ptr should be 1 after clock with wrt_ptr = 2");
            $finish;
        end

        // Test case 5: Check sync_wrt_ptr after another clock
        #10; // Wait for next clock edge
        if (sync_wrt_ptr !== 5'b00010) begin
            $display("FAIL: sync_wrt_ptr should be 2 after second clock with wrt_ptr = 2");
            $finish;
        end

        // Test case 6: Assert reset again
        rd_rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (sync_wrt_ptr !== 0) begin
            $display("FAIL: sync_wrt_ptr should be 0 after reset");
            $finish;
        end

        // Final case: Check behavior after reset
        rd_rst = 0; // Deassert reset
        wrt_ptr = 5'b00011; // Set write pointer
        #10; // Wait for clock edge
        if (sync_wrt_ptr !== 0) begin
            $display("FAIL: sync_wrt_ptr should be 0 after first clock with wrt_ptr = 3");
            $finish;
        end

        #10; // Wait for next clock edge
        if (sync_wrt_ptr !== 5'b00011) begin
            $display("FAIL: sync_wrt_ptr should be 3 after second clock with wrt_ptr = 3");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule