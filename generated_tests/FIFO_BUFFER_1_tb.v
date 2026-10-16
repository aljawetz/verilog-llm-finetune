`timescale 1ns/1ps

module tb_FIFO_BUFFER;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 8;
    parameter ADDRESS_BITS = 3;

    // Inputs
    reg W_CLK;
    reg W_RST;
    reg WINC;
    reg W_FULL;
    reg [DATA_WIDTH-1:0] W_DATA;
    reg [ADDRESS_BITS-1:0] W_ADDRESS;
    reg [ADDRESS_BITS-1:0] R_ADDRESS;

    // Outputs
    wire [DATA_WIDTH-1:0] R_DATA;

    // Instantiate the FIFO_BUFFER module
    FIFO_BUFFER #(DATA_WIDTH, FIFO_DEPTH, ADDRESS_BITS) uut (
        .W_CLK(W_CLK),
        .W_RST(W_RST),
        .WINC(WINC),
        .W_FULL(W_FULL),
        .W_DATA(W_DATA),
        .W_ADDRESS(W_ADDRESS),
        .R_ADDRESS(R_ADDRESS),
        .R_DATA(R_DATA)
    );

    // Clock generation
    initial begin
        W_CLK = 0;
        forever #5 W_CLK = ~W_CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        W_RST = 1;
        WINC = 0;
        W_FULL = 0;
        W_DATA = 8'h00;
        W_ADDRESS = 3'b000;
        R_ADDRESS = 3'b000;

        // Reset the FIFO
        #10 W_RST = 0; // Assert reset
        #10 W_RST = 1; // Deassert reset

        // Test writing to FIFO
        W_DATA = 8'hAA; W_ADDRESS = 3'b000; WINC = 1; #10 WINC = 0; // Write 0xAA to address 0
        W_DATA = 8'hBB; W_ADDRESS = 3'b001; WINC = 1; #10 WINC = 0; // Write 0xBB to address 1

        // Test reading from FIFO
        R_ADDRESS = 3'b000; #10;
        if (R_DATA !== 8'hAA) begin
            $display("FAIL: Expected R_DATA = 0xAA, got R_DATA = %h", R_DATA);
            $finish;
        end

        R_ADDRESS = 3'b001; #10;
        if (R_DATA !== 8'hBB) begin
            $display("FAIL: Expected R_DATA = 0xBB, got R_DATA = %h", R_DATA);
            $finish;
        end

        // Test writing when FIFO is full
        W_FULL = 1; // Simulate FIFO full condition
        W_DATA = 8'hCC; W_ADDRESS = 3'b010; WINC = 1; #10 WINC = 0; // Attempt to write 0xCC
        R_ADDRESS = 3'b010; #10;
        if (R_DATA === 8'hCC) begin
            $display("FAIL: Expected no write to occur when FIFO is full");
            $finish;
        end

        // Reset FIFO and check if it clears
        W_RST = 0; #10; W_RST = 1; #10;
        R_ADDRESS = 3'b000; #10;
        if (R_DATA !== 8'h00) begin
            $display("FAIL: Expected R_DATA = 0x00 after reset, got R_DATA = %h", R_DATA);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule