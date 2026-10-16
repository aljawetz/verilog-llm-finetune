`timescale 1ns/1ps

module tb_sync_rst;

    // Testbench signals
    reg in;
    reg clk;
    reg rst;
    wire out;

    // Instantiate the module under test (uut)
    sync_rst uut (
        .in(in),
        .clk(clk),
        .rst(rst),
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
        in = 0;
        rst = 0;

        // Apply reset
        #3 rst = 0; // Hold reset low for 3ns
        #2 rst = 1; // Release reset

        // Test case 1: Check output when in is 1
        in = 1;
        #10; // Wait for 1 clock cycle
        if (out !== 1) begin
            $display("FAIL: Expected out to be 1 when in is 1 after reset");
            $finish;
        end

        // Test case 2: Check output when in is 0
        in = 0;
        #10; // Wait for 1 clock cycle
        if (out !== 0) begin
            $display("FAIL: Expected out to be 0 when in is 0");
            $finish;
        end

        // Test case 3: Check output after reset
        rst = 0; // Assert reset
        #10; // Wait for 1 clock cycle
        if (out !== 0) begin
            $display("FAIL: Expected out to be 0 during reset");
            $finish;
        end

        // Release reset and check output
        rst = 1;
        #10; // Wait for 1 clock cycle
        if (out !== 0) begin
            $display("FAIL: Expected out to be 0 after reset released with in = 0");
            $finish;
        end

        // Test case 4: Check output when in changes after reset
        in = 1;
        #10; // Wait for 1 clock cycle
        if (out !== 1) begin
            $display("FAIL: Expected out to be 1 after in changes to 1");
            $finish;
        end

        // Test case 5: Check output stability
        in = 0;
        #10; // Wait for 1 clock cycle
        if (out !== 0) begin
            $display("FAIL: Expected out to be 0 after in changes to 0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule