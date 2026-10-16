`timescale 1ns/1ps

module tb_sequence_8421;

    reg [3:0] d_in;
    reg clk;
    reg load;
    reg rst;
    wire [3:0] q_out;

    // Instantiate the module under test (uut)
    sequence_8421 uut (
        .d_in(d_in),
        .clk(clk),
        .load(load),
        .rst(rst),
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
        rst = 1;
        load = 0;
        d_in = 4'b0000;

        // Reset the module
        #2 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Test loading data
        d_in = 4'b1010; // Load value 10
        load = 1; // Assert load
        #10 load = 0; // Deassert load

        // Check if the output is correct
        if (q_out !== 4'b1010) begin
            $display("FAIL: Output after load is incorrect, got %b, expected 1010", q_out);
            $finish;
        end

        // Rotate the value
        #10; // Wait for one clock cycle
        if (q_out !== 4'b0101) begin
            $display("FAIL: Output after first rotation is incorrect, got %b, expected 0101", q_out);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q_out !== 4'b1010) begin
            $display("FAIL: Output after second rotation is incorrect, got %b, expected 1010", q_out);
            $finish;
        end

        // Test reset functionality
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Check if the output is reset
        if (q_out !== 4'b0000) begin
            $display("FAIL: Output after reset is incorrect, got %b, expected 0000", q_out);
            $finish;
        end

        // Load a new value
        d_in = 4'b1111; // Load value 15
        load = 1; // Assert load
        #10 load = 0; // Deassert load

        // Check if the output is correct
        if (q_out !== 4'b1111) begin
            $display("FAIL: Output after loading new value is incorrect, got %b, expected 1111", q_out);
            $finish;
        end

        // Rotate the value multiple times
        #10; // Wait for one clock cycle
        if (q_out !== 4'b1111) begin
            $display("FAIL: Output after rotation is incorrect, got %b, expected 1111", q_out);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q_out !== 4'b1111) begin
            $display("FAIL: Output after second rotation is incorrect, got %b, expected 1111", q_out);
            $finish;
        end

        // Final check
        #10; // Wait for another clock cycle
        if (q_out !== 4'b1111) begin
            $display("FAIL: Output after third rotation is incorrect, got %b, expected 1111", q_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule