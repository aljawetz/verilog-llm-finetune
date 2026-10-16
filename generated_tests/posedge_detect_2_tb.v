`timescale 1ns/1ps

module tb_posedge_detect;

    // Testbench signals
    reg clk;
    reg reset;
    reg in;
    wire ped;

    // Instantiate the module under test (uut)
    posedge_detect uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .ped(ped)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        in = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check ped when in is 0
        in = 0;
        #10;
        if (ped !== 0) begin
            $display("FAIL: ped should be 0 when in is 0");
            $finish;
        end

        // Test case 2: Check ped when in transitions from 0 to 1
        in = 1;
        #10;
        if (ped !== 1) begin
            $display("FAIL: ped should be 1 when in transitions from 0 to 1");
            $finish;
        end

        // Test case 3: Check ped when in goes back to 0
        in = 0;
        #10;
        if (ped !== 0) begin
            $display("FAIL: ped should be 0 when in is 0 again");
            $finish;
        end

        // Test case 4: Check ped when in transitions from 0 to 1 again
        in = 1;
        #10;
        if (ped !== 1) begin
            $display("FAIL: ped should be 1 when in transitions from 0 to 1 again");
            $finish;
        end

        // Test case 5: Check ped when reset is activated
        reset = 1;
        #10;
        if (ped !== 0) begin
            $display("FAIL: ped should be 0 after reset");
            $finish;
        end

        // Test case 6: Check ped after reset and in is 1
        reset = 0;
        in = 1;
        #10;
        if (ped !== 1) begin
            $display("FAIL: ped should be 1 after reset and in is 1");
            $finish;
        end

        // Test case 7: Check ped when in goes back to 0 after reset
        in = 0;
        #10;
        if (ped !== 0) begin
            $display("FAIL: ped should be 0 when in is 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule