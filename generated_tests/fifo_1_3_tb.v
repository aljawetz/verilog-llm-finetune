`timescale 1ns/1ps

module tb_fifo_1;

    reg [7:0] data_in;
    reg clk;
    reg rst;
    reg rd;
    reg wr;
    wire empty;
    wire full;
    wire [3:0] fifo_cnt;
    wire [7:0] data_out;

    // Instantiate the FIFO module
    fifo_1 uut (
        .data_in(data_in),
        .clk(clk),
        .rst(rst),
        .rd(rd),
        .wr(wr),
        .empty(empty),
        .full(full),
        .fifo_cnt(fifo_cnt),
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
        data_in = 8'h00;

        // Release reset
        #10 rst = 0;

        // Test writing to FIFO
        wr = 1; data_in = 8'hAA; #10; // Write AA
        wr = 1; data_in = 8'hBB; #10; // Write BB
        wr = 1; data_in = 8'hCC; #10; // Write CC
        wr = 0; #10;

        // Check FIFO count
        if (fifo_cnt !== 3) begin
            $display("FAIL: Expected fifo_cnt = 3, got %d", fifo_cnt);
            $finish;
        end

        // Test reading from FIFO
        rd = 1; #10; // Read first
        if (data_out !== 8'hAA) begin
            $display("FAIL: Expected data_out = AA, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read second
        if (data_out !== 8'hBB) begin
            $display("FAIL: Expected data_out = BB, got %h", data_out);
            $finish;
        end

        rd = 0; #10;

        // Check FIFO count after reads
        if (fifo_cnt !== 1) begin
            $display("FAIL: Expected fifo_cnt = 1, got %d", fifo_cnt);
            $finish;
        end

        // Fill the FIFO
        wr = 1; data_in = 8'hDD; #10; // Write DD
        wr = 1; data_in = 8'hEE; #10; // Write EE
        wr = 1; data_in = 8'hFF; #10; // Write FF
        wr = 0; #10;

        // Check FIFO count
        if (fifo_cnt !== 4) begin
            $display("FAIL: Expected fifo_cnt = 4, got %d", fifo_cnt);
            $finish;
        end

        // Read until empty
        rd = 1; #10; // Read
        rd = 1; #10; // Read
        rd = 1; #10; // Read
        rd = 1; #10; // Read
        rd = 0; #10;

        // Check if FIFO is empty
        if (empty !== 1) begin
            $display("FAIL: Expected empty = 1, got %b", empty);
            $finish;
        end

        // Check FIFO count
        if (fifo_cnt !== 0) begin
            $display("FAIL: Expected fifo_cnt = 0, got %d", fifo_cnt);
            $finish;
        end

        // Test full condition
        wr = 1; data_in = 8'h11; #10; // Write 11
        wr = 1; data_in = 8'h22; #10; // Write 22
        wr = 1; data_in = 8'h33; #10; // Write 33
        wr = 1; data_in = 8'h44; #10; // Write 44
        wr = 1; data_in = 8'h55; #10; // Write 55
        wr = 1; data_in = 8'h66; #10; // Write 66
        wr = 1; data_in = 8'h77; #10; // Write 77
        wr = 1; data_in = 8'h88; #10; // Write 88
        wr = 0; #10;

        // Check if full condition is asserted
        if (full !== 1) begin
            $display("FAIL: Expected full = 1, got %b", full);
            $finish;
        end

        // Final check for FIFO count
        if (fifo_cnt !== 8) begin
            $display("FAIL: Expected fifo_cnt = 8, got %d", fifo_cnt);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule