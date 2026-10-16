`timescale 1ns/1ps

module tb_synchronizer;

    parameter STAGES = 2;
    reg clk;
    reg reset_n;
    reg D;
    wire Q;

    // Instantiate the module under test (uut)
    synchronizer #(STAGES) uut (
        .clk(clk),
        .reset_n(reset_n),
        .D(D),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset_n = 0;
        D = 0;

        // Apply reset
        #10;
        reset_n = 1; // Release reset
        #10;

        // Test case 1: Check output when D is 0
        D = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0, got Q = %b", Q);
            $finish;
        end

        // Test case 2: Check output when D is 1
        D = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0, got Q = %b", Q);
            $finish;
        end

        // Allow for metastability to settle
        #10;

        // Test case 3: Check output after D has been 1 for two clock cycles
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1, got Q = %b", Q);
            $finish;
        end

        // Test case 4: Check output when D goes back to 0
        D = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1, got Q = %b", Q);
            $finish;
        end

        // Allow for metastability to settle
        #10;

        // Test case 5: Check output after D has been 0 for two clock cycles
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0, got Q = %b", Q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule