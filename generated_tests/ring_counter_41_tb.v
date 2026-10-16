`timescale 1ns/1ps

module tb_ring_counter;

    reg load;
    reg clk;
    reg reset_n;
    reg [3:0] d_in;
    wire [3:0] q_out;

    // Instantiate the ring_counter module
    ring_counter uut (
        .load(load),
        .clk(clk),
        .reset_n(reset_n),
        .d_in(d_in),
        .q_out(q_out)
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
        load = 0;
        d_in = 4'b0000;

        // Apply reset
        #10;
        reset_n = 1; // Release reset
        #10;

        // Test loading data
        d_in = 4'b1010; // Load pattern
        load = 1; // Enable load
        #10;
        load = 0; // Disable load

        // Check output after loading
        if (q_out !== 4'b1010) begin
            $display("FAIL: Output after load is incorrect, got %b, expected 1010", q_out);
            $finish;
        end

        // Shift operation
        #10; // Wait for one clock cycle
        if (q_out !== 4'b0101) begin
            $display("FAIL: Output after first shift is incorrect, got %b, expected 0101", q_out);
            $finish;
        end

        #10; // Wait for second clock cycle
        if (q_out !== 4'b1010) begin
            $display("FAIL: Output after second shift is incorrect, got %b, expected 1010", q_out);
            $finish;
        end

        #10; // Wait for third clock cycle
        if (q_out !== 4'b0101) begin
            $display("FAIL: Output after third shift is incorrect, got %b, expected 0101", q_out);
            $finish;
        end

        // Test reset functionality
        #10;
        reset_n = 0; // Assert reset
        #10;
        reset_n = 1; // Release reset

        // Check output after reset
        if (q_out !== 4'b0000) begin
            $display("FAIL: Output after reset is incorrect, got %b, expected 0000", q_out);
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule