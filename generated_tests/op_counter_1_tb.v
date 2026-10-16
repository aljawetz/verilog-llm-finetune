`timescale 1ns/1ps

module tb_op_counter;

    reg reset_n;
    reg clk;
    reg load;
    reg udi;
    reg [3:0] d_in;
    wire [3:0] q_out;

    // Instantiate the module under test (uut)
    op_counter uut (
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
        #10;
        reset_n = 1; // Release reset

        // Test case 1: Load value
        d_in = 4'b1010; // Load 10
        load = 1; 
        #10;
        load = 0; // Disable load
        if (q_out !== 4'b1010) begin
            $display("FAIL: Expected q_out = 1010 after load, got %b", q_out);
            $finish;
        end

        // Test case 2: Increment
        udi = 1; // Enable increment
        #10;
        if (q_out !== 4'b1011) begin
            $display("FAIL: Expected q_out = 1011 after increment, got %b", q_out);
            $finish;
        end

        // Test case 3: Decrement
        udi = 0; // Disable increment
        #10;
        if (q_out !== 4'b1010) begin
            $display("FAIL: Expected q_out = 1010 after decrement, got %b", q_out);
            $finish;
        end

        // Test case 4: Decrement again
        #10;
        if (q_out !== 4'b1001) begin
            $display("FAIL: Expected q_out = 1001 after decrement, got %b", q_out);
            $finish;
        end

        // Test case 5: Reset functionality
        reset_n = 0; // Assert reset
        #10;
        reset_n = 1; // Release reset
        if (q_out !== 4'b0000) begin
            $display("FAIL: Expected q_out = 0000 after reset, got %b", q_out);
            $finish;
        end

        // Test case 6: Load new value after reset
        d_in = 4'b0111; // Load 7
        load = 1; 
        #10;
        load = 0; // Disable load
        if (q_out !== 4'b0111) begin
            $display("FAIL: Expected q_out = 0111 after load, got %b", q_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule