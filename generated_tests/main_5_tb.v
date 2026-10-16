`timescale 1ns/1ps

module tb_main;

    reg x;
    reg clk;
    reg reset;
    wire z;

    // Instantiate the module under test (uut)
    main uut (
        .x(x),
        .clk(clk),
        .reset(reset),
        .z(z)
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
        x = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Shift in 1011
        x = 1; #10; // Shift in 1
        x = 0; #10; // Shift in 0
        x = 1; #10; // Shift in 1
        x = 1; #10; // Shift in 1
        if (z !== 1) begin
            $display("FAIL: Expected z=1 after shifting in 1011");
            $finish;
        end

        // Test case 2: Shift in 0000
        x = 0; #10; // Shift in 0
        x = 0; #10; // Shift in 0
        x = 0; #10; // Shift in 0
        x = 0; #10; // Shift in 0
        if (z !== 0) begin
            $display("FAIL: Expected z=0 after shifting in 0000");
            $finish;
        end

        // Test case 3: Shift in 1101
        x = 1; #10; // Shift in 1
        x = 1; #10; // Shift in 1
        x = 0; #10; // Shift in 0
        x = 1; #10; // Shift in 1
        if (z !== 0) begin
            $display("FAIL: Expected z=0 after shifting in 1101");
            $finish;
        end

        // Test case 4: Shift in 1011 again
        x = 1; #10; // Shift in 1
        x = 0; #10; // Shift in 0
        x = 1; #10; // Shift in 1
        x = 1; #10; // Shift in 1
        if (z !== 1) begin
            $display("FAIL: Expected z=1 after shifting in 1011");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule