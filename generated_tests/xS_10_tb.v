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
        in = 8'h00; // Test case for index 0
        #10; // Wait for a negative edge
        if (out !== 8'hc6) begin
            $display("FAIL: Expected 0xC6 for input 0x00, got 0x%h", out);
            $finish;
        end

        in = 8'h01; // Test case for index 1
        #10; // Wait for a negative edge
        if (out !== 8'hf8) begin
            $display("FAIL: Expected 0xF8 for input 0x01, got 0x%h", out);
            $finish;
        end

        in = 8'h02; // Test case for index 2
        #10; // Wait for a negative edge
        if (out !== 8'hee) begin
            $display("FAIL: Expected 0xEE for input 0x02, got 0x%h", out);
            $finish;
        end

        in = 8'h03; // Test case for index 3
        #10; // Wait for a negative edge
        if (out !== 8'hf6) begin
            $display("FAIL: Expected 0xF6 for input 0x03, got 0x%h", out);
            $finish;
        end

        // Add more test cases as needed
        in = 8'hff; // Test case for index 255
        #10; // Wait for a negative edge
        if (out !== 8'h2c) begin
            $display("FAIL: Expected 0x2C for input 0xFF, got 0x%h", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule