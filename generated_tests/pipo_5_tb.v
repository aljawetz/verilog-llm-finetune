`timescale 1ns/1ps

module tb_pipo;
    reg clk;
    reg reset;
    reg [3:0] d;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    pipo uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 4'b0000;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Load value 4'b1010
        d = 4'b1010;
        #10;
        if (q !== 4'b1010) begin
            $display("FAIL: Expected q = 4'b1010, got q = %b", q);
            $finish;
        end

        // Test case 2: Load value 4'b1111
        d = 4'b1111;
        #10;
        if (q !== 4'b1111) begin
            $display("FAIL: Expected q = 4'b1111, got q = %b", q);
            $finish;
        end

        // Test case 3: Reset the register
        reset = 1;
        #10;
        if (q !== 4'b0000) begin
            $display("FAIL: Expected q = 4'b0000 after reset, got q = %b", q);
            $finish;
        end

        // Test case 4: Load value 4'b0011 after reset
        reset = 0;
        d = 4'b0011;
        #10;
        if (q !== 4'b0011) begin
            $display("FAIL: Expected q = 4'b0011, got q = %b", q);
            $finish;
        end

        // Test case 5: Load value 4'b0101
        d = 4'b0101;
        #10;
        if (q !== 4'b0101) begin
            $display("FAIL: Expected q = 4'b0101, got q = %b", q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule