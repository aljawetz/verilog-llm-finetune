`timescale 1ns/1ps

module tb_good_counter;

    reg clk;
    reg reset;
    wire [1:0] cnt;

    // Instantiate the module under test (uut)
    good_counter uut (
        .clk(clk),
        .reset(reset),
        .cnt(cnt)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Test counting from 0 to 2
        #10; // cnt should be 1
        if (cnt !== 2'b01) begin
            $display("FAIL: Expected cnt to be 01 after 10ns, got %b", cnt);
            $finish;
        end

        #10; // cnt should be 2
        if (cnt !== 2'b10) begin
            $display("FAIL: Expected cnt to be 10 after 20ns, got %b", cnt);
            $finish;
        end

        #10; // cnt should reset to 0
        if (cnt !== 2'b00) begin
            $display("FAIL: Expected cnt to be 00 after 30ns, got %b", cnt);
            $finish;
        end

        // Test counting again
        #10; // cnt should be 1
        if (cnt !== 2'b01) begin
            $display("FAIL: Expected cnt to be 01 after 40ns, got %b", cnt);
            $finish;
        end

        #10; // cnt should be 2
        if (cnt !== 2'b10) begin
            $display("FAIL: Expected cnt to be 10 after 50ns, got %b", cnt);
            $finish;
        end

        #10; // cnt should reset to 0
        if (cnt !== 2'b00) begin
            $display("FAIL: Expected cnt to be 00 after 60ns, got %b", cnt);
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule