`timescale 1ns/1ps

module tb_func6;

    reg clk;
    reg reset;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    func6 uut (
        .clk(clk),
        .reset(reset),
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
        // Initialize signals
        reset = 1;
        in = 0;
        #10; // Wait for a few clock cycles

        // Release reset
        reset = 0;
        #10;

        // Test case 1: No rising edge
        in = 0; #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got %b", out);
            $finish;
        end

        // Test case 2: Rising edge detected
        in = 1; #10; // Rising edge occurs here
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got %b", out);
            $finish;
        end

        // Test case 3: No rising edge
        in = 0; #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got %b", out);
            $finish;
        end

        // Test case 4: Another rising edge detected
        in = 1; #10; // Rising edge occurs here
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got %b", out);
            $finish;
        end

        // Test case 5: No rising edge
        in = 1; #10; // No change
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got %b", out);
            $finish;
        end

        // Test case 6: Reset functionality
        reset = 1; #10; // Assert reset
        reset = 0; #10; // Release reset
        in = 0; #10; // Ensure output is 0 after reset
        if (out !== 0) begin
            $display("FAIL: Expected out = 0 after reset, got %b", out);
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule