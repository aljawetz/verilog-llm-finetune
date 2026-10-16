`timescale 1ns/1ps

module tb_dff_async;

    // Testbench signals
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
        #10; // Wait for 10ns
        rst_n = 1; // Deassert reset
        #10;

        // Test case 1: Check reset functionality
        if (qout !== 0) begin
            $display("FAIL: qout should be 0 after reset");
            $finish;
        end

        // Test case 2: Check data input on clock edge
        data_in = 1; 
        #10; // Wait for one clock cycle
        if (qout !== 1) begin
            $display("FAIL: qout should be 1 after clock edge with data_in = 1");
            $finish;
        end

        // Test case 3: Check data input change on clock edge
        data_in = 0; 
        #10; // Wait for one clock cycle
        if (qout !== 0) begin
            $display("FAIL: qout should be 0 after clock edge with data_in = 0");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst_n = 0; // Assert reset
        #10; // Wait for reset to take effect
        if (qout !== 0) begin
            $display("FAIL: qout should be 0 after reset");
            $finish;
        end

        // Test case 5: Check data input after reset
        rst_n = 1; // Deassert reset
        #10;
        data_in = 1; 
        #10; // Wait for one clock cycle
        if (qout !== 1) begin
            $display("FAIL: qout should be 1 after clock edge with data_in = 1");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule