`timescale 1ns/1ps

module tb_xS;

    reg clk;
    reg [7:0] in;
    wire [7:0] out;

    // Instantiate the module under test
    xS uut (
        .clk(clk),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize input
        in = 8'h00; // Test case for input 0
        #10;
        if (out !== 8'hc6) begin
            $display("FAIL: Expected output for in=0 is 0xc6, got %h", out);
            $finish;
        end

        in = 8'h01; // Test case for input 1
        #10;
        if (out !== 8'hf8) begin
            $display("FAIL: Expected output for in=1 is 0xf8, got %h", out);
            $finish;
        end

        in = 8'h02; // Test case for input 2
        #10;
        if (out !== 8'hee) begin
            $display("FAIL: Expected output for in=2 is 0xee, got %h", out);
            $finish;
        end

        in = 8'h03; // Test case for input 3
        #10;
        if (out !== 8'hf6) begin
            $display("FAIL: Expected output for in=3 is 0xf6, got %h", out);
            $finish;
        end

        in = 8'h04; // Test case for input 4
        #10;
        if (out !== 8'hff) begin
            $display("FAIL: Expected output for in=4 is 0xff, got %h", out);
            $finish;
        end

        // Continue testing other values
        // ...

        // Final test case for maximum input
        in = 8'hff; // Test case for input 255
        #10;
        if (out !== 8'h2c) begin
            $display("FAIL: Expected output for in=255 is 0x2c, got %h", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule