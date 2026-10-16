`timescale 1ns/1ps

module tb_lfsr_counter;

    reg rst;
    reg clk;
    reg Tj_Trig;
    reg [127:0] data;
    wire [19:0] lfsr;

    // Instantiate the module under test (uut)
    lfsr_counter uut (
        .rst(rst),
        .clk(clk),
        .Tj_Trig(Tj_Trig),
        .data(data),
        .lfsr(lfsr)
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
        Tj_Trig = 0;
        data = 128'h00000000000000000000000000000001; // Initial LFSR value

        // Wait for a clock cycle
        #10;

        // Release reset
        rst = 0;
        #10;

        // Check initial LFSR value
        if (lfsr !== 20'h00001) begin
            $display("FAIL: Initial LFSR value is incorrect");
            $finish;
        end

        // Trigger LFSR update
        Tj_Trig = 1;
        #10;
        Tj_Trig = 0;

        // Check LFSR value after one update
        if (lfsr === 20'h00001) begin
            $display("FAIL: LFSR did not update as expected");
            $finish;
        end

        // Trigger LFSR update again
        Tj_Trig = 1;
        #10;
        Tj_Trig = 0;

        // Check LFSR value after second update
        if (lfsr === 20'h00001) begin
            $display("FAIL: LFSR did not update as expected");
            $finish;
        end

        // Reset the LFSR
        rst = 1;
        #10;
        rst = 0;

        // Check LFSR value after reset
        if (lfsr !== 20'h00001) begin
            $display("FAIL: LFSR value after reset is incorrect");
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule