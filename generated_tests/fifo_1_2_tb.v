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
        // Reset the FIFO
        rst = 1;
        wr = 0;
        rd = 0;
        data_in = 8'b0;
        #10;
        rst = 0;

        // Test 1: Check initial empty and full status
        if (!empty || full) begin
            $display("FAIL: Initial status incorrect");
            $finish;
        end

        // Test 2: Write data into FIFO
        wr = 1;
        data_in = 8'hAA; // Write 0xAA
        #10;
        wr = 0;

        // Check FIFO count after one write
        if (fifo_cnt != 4'd1) begin
            $display("FAIL: FIFO count incorrect after one write");
            $finish;
        end

        // Test 3: Read data from FIFO
        rd = 1;
        #10;
        rd = 0;

        // Check data output and FIFO count after one read
        if (data_out != 8'hAA || fifo_cnt != 4'd0) begin
            $display("FAIL: Data output or FIFO count incorrect after one read");
            $finish;
        end

        // Test 4: Fill the FIFO
        wr = 1;
        data_in = 8'hBB; // Write 0xBB
        #10;
        data_in = 8'hCC; // Write 0xCC
        #10;
        data_in = 8'hDD; // Write 0xDD
        #10;
        data_in = 8'hEE; // Write 0xEE
        #10;
        data_in = 8'hFF; // Write 0xFF
        #10;
        wr = 0;

        // Check FIFO count after multiple writes
        if (fifo_cnt != 4'd5) begin
            $display("FAIL: FIFO count incorrect after multiple writes");
            $finish;
        end

        // Test 5: Read all data from FIFO
        rd = 1;
        #10; // Read 0xBB
        if (data_out != 8'hBB) begin
            $display("FAIL: Data output incorrect on first read");
            $finish;
        end
        #10; // Read 0xCC
        if (data_out != 8'hCC) begin
            $display("FAIL: Data output incorrect on second read");
            $finish;
        end
        #10; // Read 0xDD
        if (data_out != 8'hDD) begin
            $display("FAIL: Data output incorrect on third read");
            $finish;
        end
        #10; // Read 0xEE
        if (data_out != 8'hEE) begin
            $display("FAIL: Data output incorrect on fourth read");
            $finish;
        end
        #10; // Read 0xFF
        if (data_out != 8'hFF || fifo_cnt != 4'd0) begin
            $display("FAIL: Data output incorrect on fifth read or FIFO count incorrect");
            $finish;
        end
        rd = 0;

        // Test 6: Check full status
        wr = 1;
        data_in = 8'h11; // Write 0x11
        #10;
        data_in = 8'h22; // Write 0x22
        #10;
        data_in = 8'h33; // Write 0x33
        #10;
        data_in = 8'h44; // Write 0x44
        #10;
        data_in = 8'h55; // Write 0x55
        #10;
        data_in = 8'h66; // Write 0x66
        #10;
        data_in = 8'h77; // Write 0x77
        #10;
        data_in = 8'h88; // Write 0x88
        #10;
        wr = 0;

        // Check full status
        if (!full) begin
            $display("FAIL: FIFO should be full after 8 writes");
            $finish;
        end

        // Test 7: Attempt to write when full
        wr = 1;
        data_in = 8'h99; // Write 0x99
        #10;
        wr = 0;

        // Check FIFO count should remain full
        if (fifo_cnt != 4'd8) begin
            $display("FAIL: FIFO count incorrect after write attempt when full");
            $finish;
        end

        // Test 8: Reset FIFO
        rst = 1;
        #10;
        rst = 0;

        // Check FIFO status after reset
        if (!empty || full || fifo_cnt != 4'd0) begin
            $display("FAIL: FIFO status incorrect after reset");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule