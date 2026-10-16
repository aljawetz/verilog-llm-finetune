`timescale 1ns/1ps

module tb_auto7seg;
    reg clk;
    reg rst;
    wire [6:0] z;

    // Instantiate the module under test
    auto7seg uut (
        .clk(clk),
        .rst(rst),
        .z(z)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 1;
        #10; // Hold reset for 10ns
        rst = 0;

        // Wait for a few clock cycles and check outputs
        #10;
        if (z !== 7'b1111110) begin
            $display("FAIL: Expected z = 7'b1111110 for counter 0, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b0110000) begin
            $display("FAIL: Expected z = 7'b0110000 for counter 1, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b1101101) begin
            $display("FAIL: Expected z = 7'b1101101 for counter 2, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b1111001) begin
            $display("FAIL: Expected z = 7'b1111001 for counter 3, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b0110011) begin
            $display("FAIL: Expected z = 7'b0110011 for counter 4, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b1011011) begin
            $display("FAIL: Expected z = 7'b1011011 for counter 5, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b1011111) begin
            $display("FAIL: Expected z = 7'b1011111 for counter 6, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b1110000) begin
            $display("FAIL: Expected z = 7'b1110000 for counter 7, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b1111111) begin
            $display("FAIL: Expected z = 7'b1111111 for counter 8, got z = %b", z);
            $finish;
        end

        #10;
        if (z !== 7'b1111011) begin
            $display("FAIL: Expected z = 7'b1111011 for counter 9, got z = %b", z);
            $finish;
        end

        // Test reset functionality
        rst = 1;
        #10;
        if (z !== 7'b0000000) begin
            $display("FAIL: Expected z = 7'b0000000 after reset, got z = %b", z);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end
endmodule