`timescale 1ns/1ps

module tb_shiftleftreg;

    reg clk;
    reg rst;
    reg a;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    shiftleftreg uut (
        .clk(clk),
        .rst(rst),
        .a(a),
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
        rst = 1;
        a = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test shifting with a = 0
        a = 0;
        #10; // Check output
        if (out !== 4'b0000) begin
            $display("FAIL: Expected out = 0000, got out = %b", out);
            $finish;
        end

        // Shift in 1
        a = 1;
        #10; // Check output
        if (out !== 4'b0001) begin
            $display("FAIL: Expected out = 0001, got out = %b", out);
            $finish;
        end

        // Shift in 0
        a = 0;
        #10; // Check output
        if (out !== 4'b0010) begin
            $display("FAIL: Expected out = 0010, got out = %b", out);
            $finish;
        end

        // Shift in 1
        a = 1;
        #10; // Check output
        if (out !== 4'b0101) begin
            $display("FAIL: Expected out = 0101, got out = %b", out);
            $finish;
        end

        // Shift in 0
        a = 0;
        #10; // Check output
        if (out !== 4'b1010) begin
            $display("FAIL: Expected out = 1010, got out = %b", out);
            $finish;
        end

        // Reset the register
        rst = 1;
        #10; // Wait for reset
        rst = 0;
        #10; // Check output after reset
        if (out !== 4'b0000) begin
            $display("FAIL: Expected out = 0000 after reset, got out = %b", out);
            $finish;
        end

        // Final check with a = 1
        a = 1;
        #10; // Check output
        if (out !== 4'b0001) begin
            $display("FAIL: Expected out = 0001 after reset and input 1, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule