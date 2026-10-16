`timescale 1ns/1ps

module tb_exp_1_block_16;

    parameter data_size = 16;
    reg clock_i;
    reg reset_n_i;
    reg [data_size-1:0] exp_data_i;
    reg exp_data_valid_i;
    wire exp_done_o;
    wire exp_data_valid_o;
    wire [data_size-1:0] exp_data_o;

    // Instantiate the module under test (uut)
    exp_1_block_16 #(.data_size(data_size)) uut (
        .clock_i(clock_i),
        .reset_n_i(reset_n_i),
        .exp_data_i(exp_data_i),
        .exp_data_valid_i(exp_data_valid_i),
        .exp_done_o(exp_done_o),
        .exp_data_valid_o(exp_data_valid_o),
        .exp_data_o(exp_data_o)
    );

    // Clock generation
    initial begin
        clock_i = 0;
        forever #5 clock_i = ~clock_i; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset_n_i = 0;
        exp_data_i = 0;
        exp_data_valid_i = 0;

        // Apply reset
        #10;
        reset_n_i = 1;

        // Test case 1: Send valid data
        exp_data_i = 16'b0000_0000_0000_0001; // Input 1
        exp_data_valid_i = 1;
        #10;
        exp_data_valid_i = 0; // Clear valid signal

        // Wait for done signal
        wait(exp_done_o);
        if (exp_data_o !== 16'b0000_0000_0000_0000) begin
            $display("FAIL: Expected output for input 1 not matched.");
            $finish;
        end

        // Test case 2: Send another valid data
        exp_data_i = 16'b0000_0000_0000_0010; // Input 2
        exp_data_valid_i = 1;
        #10;
        exp_data_valid_i = 0; // Clear valid signal

        // Wait for done signal
        wait(exp_done_o);
        if (exp_data_o !== 16'b0000_0000_0000_0000) begin
            $display("FAIL: Expected output for input 2 not matched.");
            $finish;
        end

        // Test case 3: Send multiple valid data
        exp_data_i = 16'b0000_0000_0000_0011; // Input 3
        exp_data_valid_i = 1;
        #10;
        exp_data_valid_i = 0; // Clear valid signal

        // Wait for done signal
        wait(exp_done_o);
        if (exp_data_o !== 16'b0000_0000_0000_0000) begin
            $display("FAIL: Expected output for input 3 not matched.");
            $finish;
        end

        // Final check
        if (exp_done_o) begin
            $display("PASS");
        end else begin
            $display("FAIL: Done signal not asserted.");
        end

        // End simulation
        $finish;
    end

endmodule