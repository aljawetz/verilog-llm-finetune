`timescale 1ns/1ps

module tb_AM_Transmission;

    reg [127:0] key;
    reg clk;
    reg rst;
    reg Tj_Trig;
    wire Antena;

    // Instantiate the module under test (uut)
    AM_Transmission uut (
        .key(key),
        .clk(clk),
        .rst(rst),
        .Tj_Trig(Tj_Trig),
        .Antena(Antena)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        key = 128'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5;
        rst = 1;
        Tj_Trig = 0;

        // Wait for a few clock cycles
        #10;

        // Release reset
        rst = 0;

        // Trigger the transmission
        Tj_Trig = 1;
        #10; // Hold trigger for one clock cycle
        Tj_Trig = 0;

        // Wait for a few cycles to observe Antena output
        #100;

        // Check Antena output after key load
        if (Antena !== 1'b0) begin
            $display("FAIL: Antena should be low after key load");
            $finish;
        end

        // Simulate Baud8GeneratorACC incrementing
        #200;

        // Check Antena output after some time
        if (Antena !== 1'b0) begin
            $display("FAIL: Antena should still be low");
            $finish;
        end

        // Trigger again to shift the register
        Tj_Trig = 1;
        #10; // Hold trigger for one clock cycle
        Tj_Trig = 0;

        // Wait for a few cycles to observe Antena output
        #100;

        // Check Antena output after second trigger
        if (Antena !== 1'b0) begin
            $display("FAIL: Antena should be low after second key load");
            $finish;
        end

        // Wait for Baud8GeneratorACC to reach a certain state
        #200;

        // Check Antena output after some time
        if (Antena !== 1'b0) begin
            $display("FAIL: Antena should still be low");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule