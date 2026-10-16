`timescale 1ns/1ps

module tb_d_ff;

    parameter Bitwidth = 8;
    reg [Bitwidth-1:0] in;
    reg clk;
    reg rst;
    wire [Bitwidth-1:0] out;

    // Instantiate the D flip-flop
    d_ff #(Bitwidth) uut (
        .in(in),
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        in = 8'h00;
        rst = 1;

        // Apply reset
        #10;
        if (out !== 8'h00) begin
            $display("FAIL: Output not reset to 8'h00");
            $finish;
        end

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check output after setting input
        in = 8'hAB; // Set input to 8'hAB
        #10; // Wait for clock edge
        if (out !== 8'hAB) begin
            $display("FAIL: Output not equal to 8'hAB after clock edge");
            $finish;
        end

        // Test case 2: Check output after changing input
        in = 8'hCD; // Change input to 8'hCD
        #10; // Wait for clock edge
        if (out !== 8'hCD) begin
            $display("FAIL: Output not equal to 8'hCD after clock edge");
            $finish;
        end

        // Test case 3: Assert reset again
        rst = 1;
        #10;
        if (out !== 8'h00) begin
            $display("FAIL: Output not reset to 8'h00 on reset");
            $finish;
        end

        // Test case 4: Check output after reset and new input
        rst = 0;
        in = 8'hFF; // Set input to 8'hFF
        #10; // Wait for clock edge
        if (out !== 8'hFF) begin
            $display("FAIL: Output not equal to 8'hFF after clock edge");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule