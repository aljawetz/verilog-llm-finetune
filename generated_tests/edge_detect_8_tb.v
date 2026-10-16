`timescale 1ns/1ps

module tb_edge_detect;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg a;
    wire rise;
    wire down;

    // Instantiate the module under test (uut)
    edge_detect uut (
        .clk(clk),
        .rst_n(rst_n),
        .a(a),
        .rise(rise),
        .down(down)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        a = 0;

        // Apply reset
        #10;
        rst_n = 1;

        // Test rising edge detection
        #10; a = 1; // a goes high
        #10; if (rise !== 1 || down !== 0) $display("FAIL: Rising edge not detected correctly");
        #10; if (rise !== 0 || down !== 0) $display("FAIL: Rise pulse not cleared");

        // Test falling edge detection
        #10; a = 0; // a goes low
        #10; if (down !== 1 || rise !== 0) $display("FAIL: Falling edge not detected correctly");
        #10; if (down !== 0 || rise !== 0) $display("FAIL: Down pulse not cleared");

        // Test no edge condition
        #10; a = 0; // no change
        #10; if (rise !== 0 || down !== 0) $display("FAIL: No edge condition failed");

        // Test another rising edge
        #10; a = 1; // a goes high
        #10; if (rise !== 1 || down !== 0) $display("FAIL: Second rising edge not detected correctly");
        #10; if (rise !== 0 || down !== 0) $display("FAIL: Second rise pulse not cleared");

        // Test another falling edge
        #10; a = 0; // a goes low
        #10; if (down !== 1 || rise !== 0) $display("FAIL: Second falling edge not detected correctly");
        #10; if (down !== 0 || rise !== 0) $display("FAIL: Second down pulse not cleared");

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule