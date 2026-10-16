`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg rst;
    reg [7:0] d;
    wire [7:0] q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .rst(rst),
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
        d = 8'b00000000;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Check reset functionality
        #10;
        if (q !== 8'b00000000) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Check data input
        d = 8'b10101010; // Set data
        #10; // Wait for one clock cycle
        if (q !== 8'b10101010) begin
            $display("FAIL: q did not match d after clock edge");
            $finish;
        end

        // Test case 3: Check another data input
        d = 8'b11110000; // Change data
        #10; // Wait for one clock cycle
        if (q !== 8'b11110000) begin
            $display("FAIL: q did not match d after clock edge");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (q !== 8'b00000000) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 5: Check data input after reset
        rst = 0; // Deassert reset
        d = 8'b00001111; // Set data
        #10; // Wait for one clock cycle
        if (q !== 8'b00001111) begin
            $display("FAIL: q did not match d after clock edge");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule