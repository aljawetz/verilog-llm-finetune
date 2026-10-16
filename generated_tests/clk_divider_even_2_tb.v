`timescale 1ns/1ps

module tb_clk_divider_even;

    parameter integer DIV_PARAM = 10;
    reg clk;
    reg rstn;
    wire clk_div;

    // Instantiate the module under test (uut)
    clk_divider_even #(.DIV_PARAM(DIV_PARAM)) uut (
        .clk(clk),
        .rstn(rstn),
        .clk_div(clk_div)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        rstn = 0; // Assert reset
        #10;
        rstn = 1; // Deassert reset
        #100; // Wait for some time to observe clk_div

        // Check the clk_div output
        if (clk_div !== 1'b0) begin
            $display("FAIL: clk_div should be 0 after reset");
            $finish;
        end

        // Wait for enough cycles to check clk_div toggling
        #((DIV_PARAM/2) * 10); // Wait for DIV_PARAM/2 clock cycles

        // Check the clk_div output again
        if (clk_div !== 1'b1) begin
            $display("FAIL: clk_div should be 1 after DIV_PARAM/2 cycles");
            $finish;
        end

        #((DIV_PARAM/2) * 10); // Wait for another DIV_PARAM/2 clock cycles

        // Check the clk_div output again
        if (clk_div !== 1'b0) begin
            $display("FAIL: clk_div should be 0 after another DIV_PARAM/2 cycles");
            $finish;
        end

        // Additional checks for multiple cycles
        #((DIV_PARAM/2) * 10); // Wait for another DIV_PARAM/2 clock cycles
        if (clk_div !== 1'b1) begin
            $display("FAIL: clk_div should be 1 after another DIV_PARAM/2 cycles");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule