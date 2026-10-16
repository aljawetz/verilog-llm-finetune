`timescale 1ns/1ps

module tb_pipo;

    reg [5:0] RIN;
    reg clk;
    reg rst;
    wire [5:0] ROUT;

    // Instantiate the module under test (uut)
    pipo uut (
        .RIN(RIN),
        .clk(clk),
        .rst(rst),
        .ROUT(ROUT)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        RIN = 6'b000000;
        rst = 0; // Start with reset low

        // Wait for a few clock cycles
        #10;

        // Assert that ROUT is reset to 0
        if (ROUT !== 6'b000000) begin
            $display("FAIL: ROUT should be 0 when rst is low");
            $finish;
        end

        // Release reset
        rst = 1;
        #10;

        // Load a value into RIN and check ROUT
        RIN = 6'b101010;
        #10; // Wait for one clock cycle

        if (ROUT !== 6'b101010) begin
            $display("FAIL: ROUT should be 101010 after loading RIN");
            $finish;
        end

        // Change RIN and check ROUT again
        RIN = 6'b111111;
        #10; // Wait for one clock cycle

        if (ROUT !== 6'b111111) begin
            $display("FAIL: ROUT should be 111111 after loading new RIN");
            $finish;
        end

        // Test reset functionality again
        rst = 0;
        #10;

        if (ROUT !== 6'b000000) begin
            $display("FAIL: ROUT should be 0 when rst is low again");
            $finish;
        end

        // End the simulation
        $display("PASS");
        $finish;
    end

endmodule