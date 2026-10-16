`timescale 1ns/1ps

module tb_dff_async;

    reg data_in;
    reg clk;
    reg rst_n;
    wire qout;

    // Instantiate the D flip-flop
    dff_async uut (
        .data_in(data_in),
        .clk(clk),
        .rst_n(rst_n),
        .qout(qout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        data_in = 0;
        rst_n = 0; // Assert reset

        // Wait for a few clock cycles
        #10;
        
        // Release reset
        rst_n = 1;
        #10;

        // Test case 1: Check reset functionality
        if (qout !== 0) begin
            $display("FAIL: Reset did not set qout to 0");
            $finish;
        end

        // Test case 2: Check data input on clock edge
        data_in = 1;
        #10; // Wait for a clock edge
        if (qout !== 1) begin
            $display("FAIL: qout did not update to data_in on clock edge");
            $finish;
        end

        // Test case 3: Change data input and check output
        data_in = 0;
        #10; // Wait for a clock edge
        if (qout !== 0) begin
            $display("FAIL: qout did not update to data_in on clock edge");
            $finish;
        end

        // Test case 4: Assert reset again
        rst_n = 0; // Assert reset
        #10;
        if (qout !== 0) begin
            $display("FAIL: Reset did not set qout to 0");
            $finish;
        end

        // Test case 5: Release reset and check output
        rst_n = 1;
        data_in = 1;
        #10; // Wait for a clock edge
        if (qout !== 1) begin
            $display("FAIL: qout did not update to data_in on clock edge after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule