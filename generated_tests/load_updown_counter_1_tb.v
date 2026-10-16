`timescale 1ns/1ps

module tb_load_updown_counter;

    reg up_down;
    reg clk;
    reg rst;
    reg load;
    reg [3:0] d_in;
    wire [3:0] q_out;

    // Instantiate the module under test (uut)
    load_updown_counter #(4) uut (
        .up_down(up_down),
        .clk(clk),
        .rst(rst),
        .load(load),
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
        rst = 1;
        up_down = 0;
        load = 0;
        d_in = 4'b0000;

        // Apply reset
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Test loading value
        load = 1; 
        d_in = 4'b1010; // Load 10
        #10 load = 0; // Disable load

        // Test counting up
        up_down = 1; // Set to count up
        #30; // Wait for 3 clock cycles (should count to 13)
        if (q_out !== 4'b1101) begin
            $display("FAIL: Expected q_out = 13, got %b", q_out);
            $finish;
        end

        // Test counting down
        up_down = 0; // Set to count down
        #20; // Wait for 2 clock cycles (should count down to 11)
        if (q_out !== 4'b1011) begin
            $display("FAIL: Expected q_out = 11, got %b", q_out);
            $finish;
        end

        // Test loading another value
        load = 1; 
        d_in = 4'b0011; // Load 3
        #10 load = 0; // Disable load

        // Test counting up again
        up_down = 1; // Set to count up
        #20; // Wait for 2 clock cycles (should count to 5)
        if (q_out !== 4'b0101) begin
            $display("FAIL: Expected q_out = 5, got %b", q_out);
            $finish;
        end

        // Test counting down again
        up_down = 0; // Set to count down
        #20; // Wait for 2 clock cycles (should count down to 3)
        if (q_out !== 4'b0011) begin
            $display("FAIL: Expected q_out = 3, got %b", q_out);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule