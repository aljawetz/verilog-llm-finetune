`timescale 1ns/1ps

module tb_sync_fifo;

    reg [7:0] data;
    reg clk;
    reg reset;
    reg rd;
    reg wr;
    wire empty;
    wire full;
    wire [3:0] count;
    wire [7:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    sync_fifo uut (
        .data(data),
        .clk(clk),
        .reset(reset),
        .rd(rd),
        .wr(wr),
        .empty(empty),
        .full(full),
        .count(count),
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
        reset = 1;
        wr = 0;
        rd = 0;
        data = 8'h00;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test writing to FIFO
        wr = 1; data = 8'h01; #10; // Write 1
        wr = 1; data = 8'h02; #10; // Write 2
        wr = 1; data = 8'h03; #10; // Write 3
        wr = 1; data = 8'h04; #10; // Write 4
        wr = 1; data = 8'h05; #10; // Write 5
        wr = 1; data = 8'h06; #10; // Write 6
        wr = 1; data = 8'h07; #10; // Write 7
        wr = 1; data = 8'h08; #10; // Write 8
        wr = 0; #10; // Stop writing

        // Check full condition
        if (!full) begin
            $display("FAIL: FIFO should be full after 8 writes");
            $finish;
        end

        // Test reading from FIFO
        rd = 1; #10; // Read 1
        if (data_out !== 8'h01) begin
            $display("FAIL: Expected data_out = 1, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read 2
        if (data_out !== 8'h02) begin
            $display("FAIL: Expected data_out = 2, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read 3
        if (data_out !== 8'h03) begin
            $display("FAIL: Expected data_out = 3, got %h", data_out);
            $finish;
        end

        rd = 0; #10; // Stop reading

        // Check empty condition
        rd = 1; #10; // Read 4
        if (data_out !== 8'h04) begin
            $display("FAIL: Expected data_out = 4, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read 5
        if (data_out !== 8'h05) begin
            $display("FAIL: Expected data_out = 5, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read 6
        if (data_out !== 8'h06) begin
            $display("FAIL: Expected data_out = 6, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read 7
        if (data_out !== 8'h07) begin
            $display("FAIL: Expected data_out = 7, got %h", data_out);
            $finish;
        end

        rd = 1; #10; // Read 8
        if (data_out !== 8'h08) begin
            $display("FAIL: Expected data_out = 8, got %h", data_out);
            $finish;
        end
        
        rd = 0; #10; // Stop reading

        // Check empty condition
        if (!empty) begin
            $display("FAIL: FIFO should be empty after reading all data");
            $finish;
        end

        // Final check for count
        if (count !== 0) begin
            $display("FAIL: Expected count = 0, got %d", count);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule