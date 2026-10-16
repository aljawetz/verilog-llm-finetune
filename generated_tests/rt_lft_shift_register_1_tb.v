`timescale 1ns/1ps

module tb_rt_lft_shift_register;

    reg clk;
    reg rst;
    reg load;
    reg dir_in;
    reg [3:0] d_in;
    wire [3:0] q_out;

    // Instantiate the module under test
    rt_lft_shift_register #(4) uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .dir_in(dir_in),
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
        load = 0;
        dir_in = 0;
        d_in = 4'b0000;

        // Apply reset
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Test parallel load
        d_in = 4'b1010; // Load value
        load = 1; // Enable load
        #10 load = 0; // Disable load

        // Check if loaded correctly
        if (q_out !== 4'b1010) begin
            $display("FAIL: Expected q_out = 1010, got %b", q_out);
            $finish;
        end

        // Test right shift
        dir_in = 1; // Set direction to right
        #10; // Wait for clock
        if (q_out !== 4'b0101) begin
            $display("FAIL: Expected q_out = 0101 after right shift, got %b", q_out);
            $finish;
        end

        // Test left shift
        dir_in = 0; // Set direction to left
        #10; // Wait for clock
        if (q_out !== 4'b1010) begin
            $display("FAIL: Expected q_out = 1010 after left shift, got %b", q_out);
            $finish;
        end

        // Test multiple shifts
        dir_in = 1; // Right shift
        #10; // Wait for clock
        if (q_out !== 4'b0101) begin
            $display("FAIL: Expected q_out = 0101 after right shift, got %b", q_out);
            $finish;
        end

        #10; // Wait for clock
        if (q_out !== 4'b0010) begin
            $display("FAIL: Expected q_out = 0010 after right shift, got %b", q_out);
            $finish;
        end

        // Test reset functionality
        rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset
        #10; // Wait for clock
        if (q_out !== 4'b0000) begin
            $display("FAIL: Expected q_out = 0000 after reset, got %b", q_out);
            $finish;
        end

        // Final checks
        d_in = 4'b1111; // Load value
        load = 1; // Enable load
        #10 load = 0; // Disable load
        dir_in = 0; // Set direction to left
        #10; // Wait for clock
        if (q_out !== 4'b1110) begin
            $display("FAIL: Expected q_out = 1110 after left shift, got %b", q_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule