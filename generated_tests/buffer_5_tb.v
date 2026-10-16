`timescale 1ns/1ps

module tb_buffer;

    parameter DATA_WIDTH = 64;
    parameter BUFFER_DEPTH = 64;
    parameter ADDR_WIDTH = 64;

    reg clk;
    reg rstn;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] data_in;
    reg [ADDR_WIDTH-1:0] rd_addr;
    reg [ADDR_WIDTH-1:0] wr_addr;
    wire [DATA_WIDTH-1:0] data_out;
    wire ready;

    // Instantiate the buffer module
    buffer #(
        .DATA_WIDTH(DATA_WIDTH),
        .BUFFER_DEPTH(BUFFER_DEPTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) uut (
        .clk(clk),
        .rstn(rstn),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .rd_addr(rd_addr),
        .wr_addr(wr_addr),
        .data_out(data_out),
        .ready(ready)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Reset the module
        rstn = 0;
        #10;
        rstn = 1;
        #10;

        // Test 1: Write and Read
        wr_en = 1;
        rd_en = 0;
        wr_addr = 10;
        data_in = 64'hDEADBEEFDEADBEEF;
        #10;

        // Check if ready is asserted after write
        if (!ready) begin
            $display("FAIL: Ready not asserted after write");
            $finish;
        end

        // Test 2: Read the written data
        wr_en = 0;
        rd_en = 1;
        rd_addr = 10;
        #10;

        // Check if the read data is correct
        if (data_out !== 64'hDEADBEEFDEADBEEF) begin
            $display("FAIL: Read data mismatch, expected 0xDEADBEEFDEADBEEF, got 0x%h", data_out);
            $finish;
        end

        // Test 3: Write to another address
        wr_en = 1;
        rd_en = 0;
        wr_addr = 20;
        data_in = 64'hCAFEBABECAFEBABE;
        #10;

        // Check if ready is asserted after write
        if (!ready) begin
            $display("FAIL: Ready not asserted after second write");
            $finish;
        end

        // Test 4: Read the new data
        wr_en = 0;
        rd_en = 1;
        rd_addr = 20;
        #10;

        // Check if the read data is correct
        if (data_out !== 64'hCAFEBABECAFEBABE) begin
            $display("FAIL: Read data mismatch, expected 0xCAFEBABECAFEBABE, got 0x%h", data_out);
            $finish;
        end

        // Test 5: Read from an uninitialized address
        rd_addr = 30; // This address has not been written to
        #10;

        // Check if the read data is zero
        if (data_out !== 0) begin
            $display("FAIL: Read from uninitialized address, expected 0x0, got 0x%h", data_out);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule