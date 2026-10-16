`timescale 1ns/1ps

module tb_op_counter;
    reg reset_n;
    reg clk;
    reg load;
    reg udi;
    reg [3:0] d_in;
    wire [3:0] q_out;

    // Instantiate the module under test (uut)
    op_counter #(4) uut (
        .reset_n(reset_n),
        .clk(clk),
        .load(load),
        .udi(udi),
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
        udi = 0;
        d_in = 4'b0000;

        // Apply reset
        #10 reset_n = 1; // Release reset
        #10;

        // Test loading a value
        d_in = 4'b1010; // Load value 10
        load = 1;
        #10;
        load = 0; // Disable load
        if (q_out !== 4'b1010) begin
            $display("FAIL: Load operation failed, expected 1010, got %b", q_out);
            $finish;
        end

        // Test increment operation
        udi = 1; // Enable increment
        #10;
        if (q_out !== 4'b1011) begin
            $display("FAIL: Increment operation failed, expected 1011, got %b", q_out);
            $finish;
        end

        // Test decrement operation
        udi = 0; // Disable increment
        #10;
        if (q_out !== 4'b1010) begin
            $display("FAIL: Decrement operation failed, expected 1010, got %b", q_out);
            $finish;
        end

        // Test asynchronous reset
        reset_n = 0; // Assert reset
        #10;
        if (q_out !== 4'b0000) begin
            $display("FAIL: Reset operation failed, expected 0000, got %b", q_out);
            $finish;
        end
        reset_n = 1; // Release reset
        #10;

        // Test decrementing from zero
        d_in = 4'b0000; // Load value 0
        load = 1;
        #10;
        load = 0; // Disable load
        udi = 0; // Disable increment
        #10;
        if (q_out !== 4'b1111) begin // Should wrap around to 15
            $display("FAIL: Decrementing from zero failed, expected 1111, got %b", q_out);
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end
endmodule