`timescale 1ns/1ps

module tb_reg_set_8;

    // Testbench signals
    reg clk;
    reg rst;
    reg [7:0] d1;
    reg [7:0] d2;
    wire [7:0] q1;
    wire [7:0] q2;

    // Instantiate the module under test (uut)
    reg_set_8 uut (
        .q1(q1),
        .q2(q2),
        .clk(clk),
        .rst(rst),
        .d1(d1),
        .d2(d2)
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
        d1 = 8'h00;
        d2 = 8'h00;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Load values into registers
        d1 = 8'hAA; // 10101010
        d2 = 8'h55; // 01010101
        #10; // Wait for one clock cycle

        if (q1 !== 8'hAA) begin
            $display("FAIL: q1 did not load correctly");
            $finish;
        end
        if (q2 !== 8'h55) begin
            $display("FAIL: q2 did not load correctly");
            $finish;
        end

        // Test case 2: Reset the registers
        rst = 1;
        #10; // Wait for reset to take effect
        rst = 0;

        if (q1 !== 8'h00) begin
            $display("FAIL: q1 did not reset correctly");
            $finish;
        end
        if (q2 !== 8'h00) begin
            $display("FAIL: q2 did not reset correctly");
            $finish;
        end

        // Test case 3: Load new values
        d1 = 8'hFF; // 11111111
        d2 = 8'h0F; // 00001111
        #10; // Wait for one clock cycle

        if (q1 !== 8'hFF) begin
            $display("FAIL: q1 did not load new value correctly");
            $finish;
        end
        if (q2 !== 8'h0F) begin
            $display("FAIL: q2 did not load new value correctly");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule