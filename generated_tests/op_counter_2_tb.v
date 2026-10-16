`timescale 1ns/1ps

module tb_op_counter;
    reg reset_n;
    reg clk;
    reg load;
    reg udi;
    reg [3:0] d_in;
    wire [3:0] q_out;

    // Instantiate the module under test
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
        load = 0; // Release load

        // Check if loaded value is correct
        if (q_out !== 4'b1010) begin
            $display("FAIL: Load value test failed");
            $finish;
        end

        // Test incrementing
        udi = 1; // Assert increment
        #10;
        if (q_out !== 4'b1011) begin
            $display("FAIL: Increment test failed");
            $finish;
        end

        // Test decrementing
        udi = 0; // Deassert increment
        #10;
        if (q_out !== 4'b1010) begin
            $display("FAIL: Decrement test failed");
            $finish;
        end

        // Test decrementing again
        #10;
        if (q_out !== 4'b1001) begin
            $display("FAIL: Decrement test failed");
            $finish;
        end

        // Test asynchronous reset
        reset_n = 0; // Assert reset
        #10;
        if (q_out !== 4'b0000) begin
            $display("FAIL: Asynchronous reset test failed");
            $finish;
        end
        reset_n = 1; // Release reset

        // Test loading another value
        d_in = 4'b0011; // Load value 3
        load = 1;
        #10;
        load = 0; // Release load

        // Check if loaded value is correct
        if (q_out !== 4'b0011) begin
            $display("FAIL: Load value test failed");
            $finish;
        end

        // Final checks
        udi = 1; // Increment
        #10;
        if (q_out !== 4'b0100) begin
            $display("FAIL: Increment test failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule