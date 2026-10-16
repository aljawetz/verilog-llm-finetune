`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg arst;
    reg ce;
    wire [3:0] count;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .arst(arst),
        .ce(ce),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        arst = 1; // Assert reset
        ce = 0;
        #10; // Wait for 10ns
        arst = 0; // Deassert reset

        // Test 1: Check reset functionality
        if (count !== 4'b0000) begin
            $display("FAIL: Count should be 0 after reset");
            $finish;
        end

        // Test 2: Enable counting
        ce = 1;
        #10; // Wait for 10ns
        if (count !== 4'b0001) begin
            $display("FAIL: Count should be 1 after 1 clock cycle with ce=1");
            $finish;
        end

        // Test 3: Count up to 5
        #40; // Wait for 40ns (4 more clock cycles)
        if (count !== 4'b0101) begin
            $display("FAIL: Count should be 5 after 5 clock cycles with ce=1");
            $finish;
        end

        // Test 4: Disable counting
        ce = 0;
        #10; // Wait for 10ns
        if (count !== 4'b0101) begin
            $display("FAIL: Count should remain 5 when ce=0");
            $finish;
        end

        // Test 5: Re-enable counting
        ce = 1;
        #30; // Wait for 30ns (3 more clock cycles)
        if (count !== 4'b1000) begin
            $display("FAIL: Count should be 8 after 3 more clock cycles with ce=1");
            $finish;
        end

        // Test 6: Assert reset again
        arst = 1;
        #10; // Wait for 10ns
        if (count !== 4'b0000) begin
            $display("FAIL: Count should be 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule