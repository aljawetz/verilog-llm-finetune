`timescale 1ns/1ps

module tb_sipo;
    reg clk;
    reg rst;
    reg si;
    wire [3:0] po;

    // Instantiate the module under test (uut)
    sipo uut (
        .clk(clk),
        .rst(rst),
        .si(si),
        .po(po)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        si = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test shifting in bits
        si = 1; #10; // Shift in 1
        if (po !== 4'b0001) begin
            $display("FAIL: Expected po = 0001, got po = %b", po);
            $finish;
        end

        si = 0; #10; // Shift in 0
        if (po !== 4'b0010) begin
            $display("FAIL: Expected po = 0010, got po = %b", po);
            $finish;
        end

        si = 1; #10; // Shift in 1
        if (po !== 4'b0101) begin
            $display("FAIL: Expected po = 0101, got po = %b", po);
            $finish;
        end

        si = 1; #10; // Shift in 1
        if (po !== 4'b1011) begin
            $display("FAIL: Expected po = 1011, got po = %b", po);
            $finish;
        end

        si = 0; #10; // Shift in 0
        if (po !== 4'b0110) begin
            $display("FAIL: Expected po = 0110, got po = %b", po);
            $finish;
        end

        // Assert reset functionality
        rst = 1; #10; // Assert reset
        if (po !== 4'b0000) begin
            $display("FAIL: Expected po = 0000 after reset, got po = %b", po);
            $finish;
        end

        // Release reset and shift in more bits
        rst = 0; #10;
        si = 1; #10; // Shift in 1
        si = 1; #10; // Shift in 1
        si = 0; #10; // Shift in 0
        si = 1; #10; // Shift in 1
        if (po !== 4'b1101) begin
            $display("FAIL: Expected po = 1101, got po = %b", po);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule