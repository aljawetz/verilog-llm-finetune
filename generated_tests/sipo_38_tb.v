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
        // Initialize signals
        rst = 1; // Assert reset
        si = 0;
        #10; // Wait for 10ns
        rst = 0; // Deassert reset

        // Test shifting in bits
        si = 1; #10; // Shift in 1
        if (po !== 4'b0001) $display("FAIL: Expected po = 0001, got po = %b", po);

        si = 0; #10; // Shift in 0
        if (po !== 4'b0010) $display("FAIL: Expected po = 0010, got po = %b", po);

        si = 1; #10; // Shift in 1
        if (po !== 4'b0101) $display("FAIL: Expected po = 0101, got po = %b", po);

        si = 1; #10; // Shift in 1
        if (po !== 4'b1011) $display("FAIL: Expected po = 1011, got po = %b", po);

        si = 0; #10; // Shift in 0
        if (po !== 4'b0110) $display("FAIL: Expected po = 0110, got po = %b", po);

        // Assert reset and check
        rst = 1; #10; // Assert reset
        if (po !== 4'b0000) $display("FAIL: Expected po = 0000 after reset, got po = %b", po);

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule