`timescale 1ns/1ps

module tb_D_flipflop;

    reg data_in;
    reg clk;
    reg reset_n;
    wire q_out;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .data_in(data_in),
        .clk(clk),
        .reset_n(reset_n),
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
        data_in = 0;
        reset_n = 0;

        // Apply reset
        #10;
        reset_n = 1; // Release reset
        #10;

        // Test case 1: Check output after setting data_in
        data_in = 1;
        #10;
        if (q_out !== 1) begin
            $display("FAIL: Expected q_out to be 1 after setting data_in to 1");
            $finish;
        end

        // Test case 2: Check output on clock edge
        data_in = 0;
        #10;
        if (q_out !== 0) begin
            $display("FAIL: Expected q_out to be 0 after setting data_in to 0");
            $finish;
        end

        // Test case 3: Apply reset again
        reset_n = 0;
        #10;
        if (q_out !== 0) begin
            $display("FAIL: Expected q_out to be 0 after applying reset");
            $finish;
        end
        reset_n = 1; // Release reset
        #10;

        // Test case 4: Check output after setting data_in again
        data_in = 1;
        #10;
        if (q_out !== 1) begin
            $display("FAIL: Expected q_out to be 1 after setting data_in to 1 again");
            $finish;
        end

        // Test case 5: Check output on clock edge with data_in = 0
        data_in = 0;
        #10;
        if (q_out !== 0) begin
            $display("FAIL: Expected q_out to be 0 after setting data_in to 0 again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule