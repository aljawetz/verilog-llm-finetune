`timescale 1ns/1ps

module tb_detector;
    reg clk;
    reg rstn;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    detector uut (
        .clk(clk),
        .rstn(rstn),
        .in(in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0;
        in = 0;

        // Apply reset
        #10;
        rstn = 1; // Release reset

        // Test sequence to reach state S5
        // Input sequence: 0, 1, 0, 1, 0, 1
        // Expected state transitions: S0 -> S2 -> S1 -> S3 -> S5
        #10 in = 0; // S0 -> S2
        #10 if (uut.cs !== 3'b010) $display("FAIL: Expected state S2, got %b", uut.cs);
        #10 in = 1; // S2 -> S1
        #10 if (uut.cs !== 3'b001) $display("FAIL: Expected state S1, got %b", uut.cs);
        #10 in = 0; // S1 -> S3
        #10 if (uut.cs !== 3'b011) $display("FAIL: Expected state S3, got %b", uut.cs);
        #10 in = 1; // S3 -> S5
        #10 if (uut.cs !== 3'b101) $display("FAIL: Expected state S5, got %b", uut.cs);
        #10 if (uut.out !== 1) $display("FAIL: Output should be 1 when in state S5");

        // Reset the FSM
        #10 rstn = 0; // Assert reset
        #10 rstn = 1; // Release reset

        // Test with different input sequence to ensure reset works
        #10 in = 1; // S0 -> S1
        #10 in = 0; // S1 -> S3
        #10 if (uut.cs !== 3'b011) $display("FAIL: Expected state S3 after reset, got %b", uut.cs);
        #10 in = 1; // S3 -> S5
        #10 if (uut.cs !== 3'b101) $display("FAIL: Expected state S5, got %b", uut.cs);
        #10 if (uut.out !== 1) $display("FAIL: Output should be 1 when in state S5");

        // Final check
        #10 in = 0; // S5 -> S4
        #10 if (uut.cs !== 3'b100) $display("FAIL: Expected state S4, got %b", uut.cs);
        
        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule