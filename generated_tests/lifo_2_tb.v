`timescale 1ns/1ps

module tb_lifo;

    reg [7:0] datain;
    reg clk;
    reg resetn;
    reg re;
    reg we;
    wire [7:0] dataout;
    wire full;
    wire empty;

    // Instantiate the LIFO module
    lifo uut (
        .datain(datain),
        .clk(clk),
        .resetn(resetn),
        .re(re),
        .we(we),
        .dataout(dataout),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        resetn = 0;
        we = 0;
        re = 0;
        datain = 8'h00;

        // Apply reset
        #10;
        resetn = 1;

        // Test pushing data
        for (integer i = 0; i < 16; i = i + 1) begin
            datain = i;
            we = 1; // Enable write
            #10; // Wait for clock edge
            we = 0; // Disable write
            #10; // Wait for next clock edge
        end

        // Check if full signal is asserted
        if (!full) begin
            $display("FAIL: Expected full signal to be high after pushing 16 items");
            $finish;
        end

        // Test popping data
        for (integer i = 15; i >= 0; i = i - 1) begin
            re = 1; // Enable read
            #10; // Wait for clock edge
            re = 0; // Disable read
            #10; // Wait for next clock edge

            // Check if dataout matches expected value
            if (dataout !== i) begin
                $display("FAIL: Expected dataout to be %d, got %d", i, dataout);
                $finish;
            end
        end

        // Check if empty signal is asserted
        if (!empty) begin
            $display("FAIL: Expected empty signal to be high after popping all items");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule