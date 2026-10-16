`timescale 1ns/1ps

module tb_xS;
    reg clk;
    reg [7:0] in;
    wire [7:0] out;

    // Instantiate the module under test (uut)
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
        // Test case 1: Check output for in = 8'h00
        in = 8'h00; #10;
        if (out !== 8'hc6) begin
            $display("FAIL: Expected 8'hc6 for in = 8'h00, got %h", out);
            $finish;
        end

        // Test case 2: Check output for in = 8'h01
        in = 8'h01; #10;
        if (out !== 8'hf8) begin
            $display("FAIL: Expected 8'hf8 for in = 8'h01, got %h", out);
            $finish;
        end

        // Test case 3: Check output for in = 8'h02
        in = 8'h02; #10;
        if (out !== 8'hee) begin
            $display("FAIL: Expected 8'hee for in = 8'h02, got %h", out);
            $finish;
        end

        // Test case 4: Check output for in = 8'h03
        in = 8'h03; #10;
        if (out !== 8'hf6) begin
            $display("FAIL: Expected 8'hf6 for in = 8'h03, got %h", out);
            $finish;
        end

        // Test case 5: Check output for in = 8'h04
        in = 8'h04; #10;
        if (out !== 8'hff) begin
            $display("FAIL: Expected 8'hff for in = 8'h04, got %h", out);
            $finish;
        end

        // Test case 6: Check output for in = 8'h7f
        in = 8'h7f; #10;
        if (out !== 8'hbf) begin
            $display("FAIL: Expected 8'hbf for in = 8'h7f, got %h", out);
            $finish;
        end

        // Test case 7: Check output for in = 8'hff
        in = 8'hff; #10;
        if (out !== 8'h2c) begin
            $display("FAIL: Expected 8'h2c for in = 8'hff, got %h", out);
            $finish;
        end

        // Test case 8: Check output for in = 8'h80
        in = 8'h80; #10;
        if (out !== 8'h81) begin
            $display("FAIL: Expected 8'h81 for in = 8'h80, got %h", out);
            $finish;
        end

        // Test case 9: Check output for in = 8'h40
        in = 8'h40; #10;
        if (out !== 8'h12) begin
            $display("FAIL: Expected 8'h12 for in = 8'h40, got %h", out);
            $finish;
        end

        // Test case 10: Check output for in = 8'h20
        in = 8'h20; #10;
        if (out !== 8'h75) begin
            $display("FAIL: Expected 8'h75 for in = 8'h20, got %h", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule