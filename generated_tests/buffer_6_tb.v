`timescale 1ns/1ps

module tb_buffer;

    // Parameters
    parameter DATA_WIDTH = 128;
    parameter BUFFER_DEPTH = 2;
    parameter ADDR_WIDTH = 1;

    // Inputs
    reg clk;
    reg rstn;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] data_in;
    reg [ADDR_WIDTH-1:0] rd_addr;
    reg [ADDR_WIDTH-1:0] wr_addr;

    // Outputs
    wire [DATA_WIDTH-1:0] data_out;
    wire ready;

    // Instantiate the Unit Under Test (UUT)
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
        // Initialize inputs
        rstn = 0;
        wr_en = 0;
        rd_en = 0;
        data_in = 0;
        rd_addr = 0;
        wr_addr = 0;

        // Reset the UUT
        #10;
        rstn = 1; // Release reset
        #10;

        // Test write operation
        wr_addr = 0;
        data_in = 128'hDEADBEEFDEADBEEFDEADBEEFDEADBEEF; // Sample data
        wr_en = 1; // Enable write
        #10;
        wr_en = 0; // Disable write
        #10;

        // Check if ready signal is asserted
        if (!ready) begin
            $display("FAIL: Ready signal not asserted after write");
            $finish;
        end

        // Test read operation
        rd_addr = 0;
        rd_en = 1; // Enable read
        #10;
        rd_en = 0; // Disable read

        // Check if the output data matches the written data
        if (data_out !== 128'hDEADBEEFDEADBEEFDEADBEEFDEADBEEF) begin
            $display("FAIL: Read data does not match written data");
            $finish;
        end

        // Test write to another address
        wr_addr = 1;
        data_in = 128'hCAFEBABECAFEBABECAFEBABECAFEBABE; // Another sample data
        wr_en = 1; // Enable write
        #10;
        wr_en = 0; // Disable write
        #10;

        // Check if ready signal is asserted again
        if (!ready) begin
            $display("FAIL: Ready signal not asserted after second write");
            $finish;
        end

        // Test read from the second address
        rd_addr = 1;
        rd_en = 1; // Enable read
        #10;
        rd_en = 0; // Disable read

        // Check if the output data matches the second written data
        if (data_out !== 128'hCAFEBABECAFEBABECAFEBABECAFEBABE) begin
            $display("FAIL: Read data from second address does not match written data");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule