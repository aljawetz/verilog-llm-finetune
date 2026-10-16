`timescale 1ns/1ps

module tb_FIFO_BUFFER;

    parameter DATA_WIDTH = 8;
    parameter FIFO_DEPTH = 8;
    parameter ADDRESS_BITS = 3;

    reg W_CLK;
    reg W_RST;
    reg WINC;
    reg W_FULL;
    reg [DATA_WIDTH-1:0] W_DATA;
    reg [ADDRESS_BITS-1:0] W_ADDRESS;
    reg [ADDRESS_BITS-1:0] R_ADDRESS;
    wire [DATA_WIDTH-1:0] R_DATA;

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

    initial begin
        W_CLK = 0;
        W_RST = 0;
        WINC = 0;
        W_FULL = 0;
        W_DATA = 8'h00;
        W_ADDRESS = 3'b000;
        R_ADDRESS = 3'b000;

        // Reset the FIFO
        #5 W_RST = 1; // Release reset
        #5 W_RST = 0; // Assert reset
        #5 W_RST = 1; // Release reset

        // Test writing to FIFO
        W_ADDRESS = 3'b000;
        W_DATA = 8'hAA;
        WINC = 1;
        #10; // Wait for clock edge
        WINC = 0;

        // Read from FIFO
        R_ADDRESS = 3'b000;
        #10;
        if (R_DATA !== 8'hAA) begin
            $display("FAIL: Expected R_DATA to be 0xAA, got 0x%h", R_DATA);
            $finish;
        end

        // Test writing to another address
        W_ADDRESS = 3'b001;
        W_DATA = 8'h55;
        WINC = 1;
        #10; // Wait for clock edge
        WINC = 0;

        // Read from the second address
        R_ADDRESS = 3'b001;
        #10;
        if (R_DATA !== 8'h55) begin
            $display("FAIL: Expected R_DATA to be 0x55, got 0x%h", R_DATA);
            $finish;
        end

        // Test writing when FIFO is full
        W_FULL = 1; // Simulate full condition
        W_ADDRESS = 3'b010;
        W_DATA = 8'hFF;
        WINC = 1;
        #10; // Wait for clock edge
        WINC = 0;

        // Ensure no write occurs
        R_ADDRESS = 3'b010;
        #10;
        if (R_DATA !== 8'h00) begin
            $display("FAIL: Expected R_DATA to be 0x00, got 0x%h", R_DATA);
            $finish;
        end

        // Release full condition and write again
        W_FULL = 0;
        W_ADDRESS = 3'b010;
        W_DATA = 8'hFF;
        WINC = 1;
        #10; // Wait for clock edge
        WINC = 0;

        // Read from the third address
        R_ADDRESS = 3'b010;
        #10;
        if (R_DATA !== 8'hFF) begin
            $display("FAIL: Expected R_DATA to be 0xFF, got 0x%h", R_DATA);
            $finish;
        end

        $display("PASS");
        $finish;
    end

    always #5 W_CLK = ~W_CLK; // Clock generation

endmodule