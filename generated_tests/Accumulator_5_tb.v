`timescale 1ns/1ps

module tb_Accumulator;
    reg clk;
    reg reset;
    reg [3:0] In;
    wire [3:0] Accum;
    wire CarryOut;

    // Instantiate the module under test (uut)
    Accumulator uut (
        .clk(clk),
        .reset(reset),
        .In(In),
        .Accum(Accum),
        .CarryOut(CarryOut)
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
        In = 4'b0000;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Add 3 to 0
        In = 4'b0011; // Input = 3
        #10; // Wait for clock edge
        if (Accum !== 4'b0011 || CarryOut !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Add 5 to 3
        In = 4'b0101; // Input = 5
        #10; // Wait for clock edge
        if (Accum !== 4'b1000 || CarryOut !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Add 8 to 8 (should overflow)
        In = 4'b1000; // Input = 8
        #10; // Wait for clock edge
        if (Accum !== 4'b0000 || CarryOut !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Reset functionality
        reset = 1; // Assert reset
        #10; // Wait for clock edge
        if (Accum !== 4'b0000 || CarryOut !== 1'b0) begin
            $display("FAIL: Reset failed");
            $finish;
        end

        // Test case 5: Add 1 to 0 after reset
        reset = 0; // Release reset
        In = 4'b0001; // Input = 1
        #10; // Wait for clock edge
        if (Accum !== 4'b0001 || CarryOut !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule