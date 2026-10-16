`timescale 1ns/1ps

module tb_fifo_2048;

    reg [15:0] data_in;
    reg clk;
    reg rst;
    reg rd;
    reg wr;
    wire empty;
    wire full;
    wire [15:0] data_out;

    // Instantiate the FIFO module
    fifo_2048 uut (
        .data_in(data_in),
        .clk(clk),
        .rst(rst),
        .rd(rd),
        .wr(wr),
        .empty(empty),
        .full(full),
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
        wr = 0;
        rd = 0;
        data_in = 16'h0;

        // Release reset
        #10;
        rst = 0;

        // Test writing to FIFO
        for (integer i = 0; i < 10; i = i + 1) begin
            @(negedge clk);
            data_in = i;
            wr = 1;
            #1;
            wr = 0;
            if (full) begin
                $display("FAIL: FIFO should not be full after writing %d entries", i);
                $finish;
            end
        end

        // Check empty status
        @(negedge clk);
        if (empty) begin
            $display("FAIL: FIFO should not be empty after writing entries");
            $finish;
        end

        // Test reading from FIFO
        for (integer i = 0; i < 10; i = i + 1) begin
            @(negedge clk);
            rd = 1;
            #1;
            rd = 0;
            if (data_out !== i) begin
                $display("FAIL: Expected data_out = %d, got %d", i, data_out);
                $finish;
            end
        end

        // Check full status
        @(negedge clk);
        if (full) begin
            $display("FAIL: FIFO should not be full after reading entries");
            $finish;
        end

        // Test reading when empty
        @(negedge clk);
        rd = 1;
        #1;
        rd = 0;
        if (!empty) begin
            $display("FAIL: FIFO should be empty after reading all entries");
            $finish;
        end

        // Test writing after empty
        @(negedge clk);
        for (integer i = 0; i < 5; i = i + 1) begin
            @(negedge clk);
            data_in = 16'hA + i; // Write new data
            wr = 1;
            #1;
            wr = 0;
        end

        // Verify written data
        @(negedge clk);
        for (integer i = 0; i < 5; i = i + 1) begin
            @(negedge clk);
            rd = 1;
            #1;
            rd = 0;
            if (data_out !== (16'hA + i)) begin
                $display("FAIL: Expected data_out = %h, got %h", (16'hA + i), data_out);
                $finish;
            end
        end

        // Final check for empty and full
        @(negedge clk);
        if (!empty) begin
            $display("FAIL: FIFO should be empty after reading all entries");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule