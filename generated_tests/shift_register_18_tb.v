`timescale 1ns/1ps

module tb_shift_register;

    reg clk;
    reg areset;
    reg load;
    reg ena;
    reg [3:0] data;
    wire [3:0] q;

    // Instantiate the shift_register module
    shift_register uut (
        .clk(clk),
        .areset(areset),
        .load(load),
        .ena(ena),
        .data(data),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        areset = 1;
        load = 0;
        ena = 0;
        data = 4'b0000;

        // Apply asynchronous reset
        #10;
        areset = 0;

        // Test loading data
        data = 4'b1010; // Load 1010
        load = 1;
        #10;
        load = 0;

        // Check if data is loaded correctly
        if (q !== 4'b1010) begin
            $display("FAIL: Load operation failed, expected 1010, got %b", q);
            $finish;
        end

        // Enable shifting
        ena = 1;

        // Shift right once
        #10;
        if (q !== 4'b0101) begin
            $display("FAIL: Shift operation failed, expected 0101, got %b", q);
            $finish;
        end

        // Shift right again
        #10;
        if (q !== 4'b0010) begin
            $display("FAIL: Shift operation failed, expected 0010, got %b", q);
            $finish;
        end

        // Shift right again
        #10;
        if (q !== 4'b0001) begin
            $display("FAIL: Shift operation failed, expected 0001, got %b", q);
            $finish;
        end

        // Shift right again
        #10;
        if (q !== 4'b0000) begin
            $display("FAIL: Shift operation failed, expected 0000, got %b", q);
            $finish;
        end

        // Test asynchronous reset
        #10;
        areset = 1; // Assert reset
        #10;
        areset = 0; // Deassert reset

        // Check if reset works
        if (q !== 4'b0000) begin
            $display("FAIL: Asynchronous reset failed, expected 0000, got %b", q);
            $finish;
        end

        // Test loading new data after reset
        data = 4'b1111; // Load 1111
        load = 1;
        #10;
        load = 0;

        // Check if new data is loaded correctly
        if (q !== 4'b1111) begin
            $display("FAIL: Load operation after reset failed, expected 1111, got %b", q);
            $finish;
        end

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule