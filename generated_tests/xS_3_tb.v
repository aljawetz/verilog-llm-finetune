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
        // Initialize inputs
        in = 8'h00; // Test case for input 0
        #10;
        if (out !== 8'hc6) begin
            $display("FAIL: Expected out = 8'hc6 for in = 8'h00, got out = %h", out);
            $finish;
        end

        in = 8'h01; // Test case for input 1
        #10;
        if (out !== 8'hf8) begin
            $display("FAIL: Expected out = 8'hf8 for in = 8'h01, got out = %h", out);
            $finish;
        end

        in = 8'h02; // Test case for input 2
        #10;
        if (out !== 8'hee) begin
            $display("FAIL: Expected out = 8'hee for in = 8'h02, got out = %h", out);
            $finish;
        end

        in = 8'h03; // Test case for input 3
        #10;
        if (out !== 8'hf6) begin
            $display("FAIL: Expected out = 8'hf6 for in = 8'h03, got out = %h", out);
            $finish;
        end

        in = 8'h04; // Test case for input 4
        #10;
        if (out !== 8'hff) begin
            $display("FAIL: Expected out = 8'hff for in = 8'h04, got out = %h", out);
            $finish;
        end

        // Continue testing other inputs...
        in = 8'h05; // Test case for input 5
        #10;
        if (out !== 8'hd6) begin
            $display("FAIL: Expected out = 8'hd6 for in = 8'h05, got out = %h", out);
            $finish;
        end

        in = 8'h06; // Test case for input 6
        #10;
        if (out !== 8'hde) begin
            $display("FAIL: Expected out = 8'hde for in = 8'h06, got out = %h", out);
            $finish;
        end

        in = 8'h07; // Test case for input 7
        #10;
        if (out !== 8'h91) begin
            $display("FAIL: Expected out = 8'h91 for in = 8'h07, got out = %h", out);
            $finish;
        end

        in = 8'h08; // Test case for input 8
        #10;
        if (out !== 8'h60) begin
            $display("FAIL: Expected out = 8'h60 for in = 8'h08, got out = %h", out);
            $finish;
        end

        // Add more test cases as needed...

        // Final test case for input 255
        in = 8'hff; // Test case for input 255
        #10;
        if (out !== 8'h2c) begin
            $display("FAIL: Expected out = 8'h2c for in = 8'hff, got out = %h", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule