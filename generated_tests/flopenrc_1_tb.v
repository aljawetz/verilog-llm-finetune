`timescale 1ns/1ps

module tb_flopenrc;

    parameter WIDTH = 8;
    reg clk;
    reg rst;
    reg en;
    reg clear;
    reg [WIDTH-1:0] d;
    wire [WIDTH-1:0] q;

    // Instantiate the module under test (uut)
    flopenrc #(WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .clear(clear),
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
        rst = 1;
        en = 0;
        clear = 0;
        d = 8'h00;

        // Wait for a clock edge
        #10;

        // Release reset
        rst = 0;

        // Test case 1: Check reset functionality
        #10;
        if (q !== 8'h00) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Test clear functionality
        en = 1;
        d = 8'hAA; // Load some data
        #10; // Wait for clock edge
        if (q !== 8'hAA) begin
            $display("FAIL: q did not load data correctly");
            $finish;
        end

        clear = 1; // Activate clear
        #10; // Wait for clock edge
        if (q !== 8'h00) begin
            $display("FAIL: Clear did not set q to 0");
            $finish;
        end

        // Test case 3: Test enable functionality
        clear = 0; // Deactivate clear
        d = 8'h55; // Load new data
        #10; // Wait for clock edge
        if (q !== 8'h55) begin
            $display("FAIL: q did not load new data correctly after clear");
            $finish;
        end

        // Test case 4: Check that q does not change when enable is low
        en = 0;
        d = 8'hFF; // Load new data
        #10; // Wait for clock edge
        if (q !== 8'h55) begin
            $display("FAIL: q changed when enable was low");
            $finish;
        end

        // Test case 5: Check reset functionality again
        rst = 1; // Activate reset
        #10; // Wait for clock edge
        if (q !== 8'h00) begin
            $display("FAIL: Reset did not set q to 0 on second check");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule