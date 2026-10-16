`timescale 1ns/1ps

module tb_modncounter;

    parameter N = 8;
    parameter length = 3;
    
    reg clk;
    reg reset;
    wire [length-1:0] dataout;

    // Instantiate the module under test (uut)
    modncounter #(N, length) uut (
        .clk(clk),
        .reset(reset),
        .dataout(dataout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Test counting from 0 to N-1
        for (integer i = 0; i < N; i = i + 1) begin
            @(posedge clk);
            if (dataout !== i) begin
                $display("FAIL: Expected dataout = %0d, got %0d at count %0d", i, dataout, i);
                $finish;
            end
        end

        // Check reset functionality
        @(posedge clk);
        reset = 1; // Assert reset
        @(posedge clk);
        reset = 0; // Deassert reset
        if (dataout !== 0) begin
            $display("FAIL: Expected dataout = 0 after reset, got %0d", dataout);
            $finish;
        end

        // Test counting again after reset
        for (integer i = 0; i < N; i = i + 1) begin
            @(posedge clk);
            if (dataout !== i) begin
                $display("FAIL: Expected dataout = %0d, got %0d at count %0d", i, dataout, i);
                $finish;
            end
        end

        // Final check for wrap around
        @(posedge clk);
        if (dataout !== 0) begin
            $display("FAIL: Expected dataout = 0 after reaching N-1, got %0d", dataout);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule