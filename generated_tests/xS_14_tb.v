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
        in = 8'h00; // Test case for index 0
        #10; // Wait for a clock edge
        if (out !== 8'hc6) begin
            $display("FAIL: Expected 8'hc6 for input 8'h00, got %h", out);
            $finish;
        end

        in = 8'h01; // Test case for index 1
        #10; // Wait for a clock edge
        if (out !== 8'hf8) begin
            $display("FAIL: Expected 8'hf8 for input 8'h01, got %h", out);
            $finish;
        end

        in = 8'h02; // Test case for index 2
        #10; // Wait for a clock edge
        if (out !== 8'hee) begin
            $display("FAIL: Expected 8'hee for input 8'h02, got %h", out);
            $finish;
        end

        in = 8'h03; // Test case for index 3
        #10; // Wait for a clock edge
        if (out !== 8'hf6) begin
            $display("FAIL: Expected 8'hf6 for input 8'h03, got %h", out);
            $finish;
        end

        // Continue testing other values
        in = 8'h04; // Test case for index 4
        #10;
        if (out !== 8'hff) begin
            $display("FAIL: Expected 8'hff for input 8'h04, got %h", out);
            $finish;
        end

        // Test the last input value
        in = 8'hff; // Test case for index 255
        #10;
        if (out !== 8'h2c) begin
            $display("FAIL: Expected 8'h2c for input 8'hff, got %h", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule