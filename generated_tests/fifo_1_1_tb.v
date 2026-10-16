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
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        wr = 0;
        rd = 0;
        data_in = 8'h00;

        // Release reset
        #10;
        rst = 0;

        // Test writing to FIFO
        wr = 1; data_in = 8'hAA; #10; // Write AA
        wr = 1; data_in = 8'hBB; #10; // Write BB
        wr = 1; data_in = 8'hCC; #10; // Write CC
        wr = 1; data_in = 8'hDD; #10; // Write DD
        wr = 1; data_in = 8'hEE; #10; // Write EE
        wr = 1; data_in = 8'hFF; #10; // Write FF
        wr = 1; data_in = 8'h11; #10; // Write 11
        wr = 1; data_in = 8'h22; #10; // Write 22
        wr = 0; // Stop writing

        // Check if FIFO is full
        if (!full) begin
            $display("FAIL: FIFO should be full after 8 writes");
            $finish;
        end

        // Read from FIFO
        rd = 1; #10; // Read first
        if (data_out !== 8'hAA) begin
            $display("FAIL: Expected data_out = 0xAA, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read second
        if (data_out !== 8'hBB) begin
            $display("FAIL: Expected data_out = 0xBB, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read third
        if (data_out !== 8'hCC) begin
            $display("FAIL: Expected data_out = 0xCC, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read fourth
        if (data_out !== 8'hDD) begin
            $display("FAIL: Expected data_out = 0xDD, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read fifth
        if (data_out !== 8'hEE) begin
            $display("FAIL: Expected data_out = 0xEE, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read sixth
        if (data_out !== 8'hFF) begin
            $display("FAIL: Expected data_out = 0xFF, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read seventh
        if (data_out !== 8'h11) begin
            $display("FAIL: Expected data_out = 0x11, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read eighth
        if (data_out !== 8'h22) begin
            $display("FAIL: Expected data_out = 0x22, got %h", data_out);
            $finish;
        end

        rd = 0; // Stop reading

        // Check if FIFO is empty
        if (!empty) begin
            $display("FAIL: FIFO should be empty after 8 reads");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule