`timescale 1ns/1ps

module tb_pos_edge_dec;

    reg clk;
    reg sig;
    wire out;

    // Instantiate the module under test (uut)
    pos_edge_dec uut (
        .clk(clk),
        .sig(sig),
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
        sig = 0;

        // Wait for a few clock cycles
        #10;

        // Test case 1: No rising edge
        sig = 0;
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0 when sig = 0");
            $finish;
        end

        // Test case 2: Rising edge
        sig = 1; // Rising edge at next clock
        #10;
        if (out !== 1) begin
            $display("FAIL: Expected out = 1 on rising edge");
            $finish;
        end

        // Test case 3: No change, should remain low
        sig = 1; // No change
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0 when sig remains high");
            $finish;
        end

        // Test case 4: Falling edge
        sig = 0; // Falling edge at next clock
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0 on falling edge");
            $finish;
        end

        // Test case 5: Another rising edge
        sig = 1; // Rising edge at next clock
        #10;
        if (out !== 1) begin
            $display("FAIL: Expected out = 1 on second rising edge");
            $finish;
        end

        // Test case 6: No change
        sig = 1; // No change
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0 when sig remains high again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule