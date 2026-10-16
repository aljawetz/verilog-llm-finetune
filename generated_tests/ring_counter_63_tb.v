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
        reset_n = 0; // Assert reset
        load = 0;
        d_in = 4'b0000;

        // Release reset
        #10 reset_n = 1;

        // Test case 1: Load a value
        d_in = 4'b1010; // Load value
        load = 1; // Assert load
        #10 load = 0; // Deassert load

        // Check output after loading
        if (q_out !== 4'b1010) begin
            $display("FAIL: Expected q_out = 1010 after load, got %b", q_out);
            $finish;
        end

        // Test case 2: Rotate the bits
        #10; // Wait for one clock cycle
        if (q_out !== 4'b0101) begin
            $display("FAIL: Expected q_out = 0101 after rotation, got %b", q_out);
            $finish;
        end

        // Rotate again
        #10; // Wait for one clock cycle
        if (q_out !== 4'b1010) begin
            $display("FAIL: Expected q_out = 1010 after second rotation, got %b", q_out);
            $finish;
        end

        // Test case 3: Reset functionality
        #10 reset_n = 0; // Assert reset
        #10 reset_n = 1; // Release reset

        // Check output after reset
        if (q_out !== 4'b0000) begin
            $display("FAIL: Expected q_out = 0000 after reset, got %b", q_out);
            $finish;
        end

        // Test case 4: Load another value
        d_in = 4'b1111; // Load value
        load = 1; // Assert load
        #10 load = 0; // Deassert load

        // Check output after loading
        if (q_out !== 4'b1111) begin
            $display("FAIL: Expected q_out = 1111 after load, got %b", q_out);
            $finish;
        end

        // Rotate and check
        #10; // Wait for one clock cycle
        if (q_out !== 4'b1111) begin
            $display("FAIL: Expected q_out = 1111 after rotation, got %b", q_out);
            $finish;
        end

        // Final check
        #10; // Wait for one clock cycle
        if (q_out !== 4'b1111) begin
            $display("FAIL: Expected q_out = 1111 after second rotation, got %b", q_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule