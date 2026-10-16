`timescale 1ns/1ps

module tb_counter_mod;

    parameter MOD_N = 46;
    parameter WIDTH = $clog2(MOD_N);
    
    reg clk;
    reg rst;
    wire [WIDTH-1:0] count;

    // Instantiate the module under test
    counter_mod #(.MOD_N(MOD_N)) uut (
        .count(count),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        rst = 1; // Assert reset
        #10;     // Wait for 10ns
        rst = 0; // Deassert reset

        // Wait for the counter to reach MOD_N
        #((MOD_N + 1) * 10); // Wait enough time for counter to reach MOD_N

        // Check the count value
        if (count !== 0) begin
            $display("FAIL: Count did not reset to 0 after reaching MOD_N");
            $finish;
        end

        // Test reset functionality
        rst = 1; // Assert reset
        #10;     // Wait for 10ns
        rst = 0; // Deassert reset

        // Allow the counter to increment a few times
        #((MOD_N / 2) * 10); // Wait for half the modulus

        // Check the count value
        if (count !== (MOD_N / 2)) begin
            $display("FAIL: Count is not as expected after half the modulus");
            $finish;
        end

        // Assert reset again
        rst = 1; // Assert reset
        #10;     // Wait for 10ns
        rst = 0; // Deassert reset

        // Allow the counter to increment to MOD_N
        #((MOD_N + 1) * 10); // Wait enough time for counter to reach MOD_N

        // Final check
        if (count !== 0) begin
            $display("FAIL: Count did not reset to 0 after reaching MOD_N");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule