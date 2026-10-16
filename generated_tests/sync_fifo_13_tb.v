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

        // Release reset
        #10 reset = 0;

        // Test 1: Check empty and full status
        if (!empty) $display("FAIL: FIFO should be empty after reset");
        if (full) $display("FAIL: FIFO should not be full after reset");

        // Test 2: Write data into FIFO
        wr = 1;
        data = 8'hAA; // Write 0xAA
        #10;
        if (count != 1) $display("FAIL: Count should be 1 after one write");
        if (empty) $display("FAIL: FIFO should not be empty after one write");
        if (full) $display("FAIL: FIFO should not be full after one write");

        // Test 3: Read data from FIFO
        wr = 0;
        rd = 1;
        #10;
        if (data_out != 8'hAA) $display("FAIL: Data out should be 0xAA after read");
        if (count != 0) $display("FAIL: Count should be 0 after one read");
        if (!empty) $display("FAIL: FIFO should be empty after one read");
        if (full) $display("FAIL: FIFO should not be full after one read");

        // Test 4: Fill the FIFO
        wr = 1;
        data = 8'hBB; // Write 0xBB
        #10;
        data = 8'hCC; // Write 0xCC
        #10;
        data = 8'hDD; // Write 0xDD
        #10;
        data = 8'hEE; // Write 0xEE
        #10;
        data = 8'hFF; // Write 0xFF
        #10;
        data = 8'h11; // Write 0x11
        #10;
        data = 8'h22; // Write 0x22
        #10;
        data = 8'h33; // Write 0x33
        #10;
        if (count != 8) $display("FAIL: Count should be 8 after filling FIFO");
        if (empty) $display("FAIL: FIFO should not be empty after filling");
        if (!full) $display("FAIL: FIFO should be full after filling");

        // Test 5: Attempt to write when full
        data = 8'h44; // Write 0x44
        #10;
        if (count != 8) $display("FAIL: Count should remain 8 when trying to write to full FIFO");

        // Test 6: Read all data from FIFO
        rd = 1;
        #10;
        if (data_out != 8'hBB) $display("FAIL: Data out should be 0xBB");
        #10;
        if (data_out != 8'hCC) $display("FAIL: Data out should be 0xCC");
        #10;
        if (data_out != 8'hDD) $display("FAIL: Data out should be 0xDD");
        #10;
        if (data_out != 8'hEE) $display("FAIL: Data out should be 0xEE");
        #10;
        if (data_out != 8'hFF) $display("FAIL: Data out should be 0xFF");
        #10;
        if (data_out != 8'h11) $display("FAIL: Data out should be 0x11");
        #10;
        if (data_out != 8'h22) $display("FAIL: Data out should be 0x22");
        #10;
        if (data_out != 8'h33) $display("FAIL: Data out should be 0x33");
        #10;

        if (count != 0) $display("FAIL: Count should be 0 after reading all data");
        if (!empty) $display("FAIL: FIFO should be empty after reading all data");
        if (full) $display("FAIL: FIFO should not be full after reading all data");

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule