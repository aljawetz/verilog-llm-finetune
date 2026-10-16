`timescale 1ns/1ps

module tb_mod_counter;

parameter N = 10; // Parameter for the counter
reg clk;
reg reset_n;
reg en;
wire [$clog2(N-1)-1:0] Q;

// Instantiate the module under test (uut)
mod_counter #(N) uut (
    .clk(clk),
    .reset_n(reset_n),
    .en(en),
    .Q(Q)
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
    en = 0;

    // Apply reset
    #10;
    reset_n = 1; // Release reset

    // Test 1: Check reset functionality
    #10;
    if (Q !== 0) begin
        $display("FAIL: Reset did not set Q to 0");
        $finish;
    end

    // Test 2: Enable counter and check counting
    en = 1;
    #10;
    if (Q !== 1) begin
        $display("FAIL: Q did not increment to 1");
        $finish;
    end

    #10;
    if (Q !== 2) begin
        $display("FAIL: Q did not increment to 2");
        $finish;
    end

    // Test 3: Check wrap around
    for (integer i = 3; i < N; i = i + 1) begin
        #10;
        if (Q !== i) begin
            $display("FAIL: Q did not increment to %0d", i);
            $finish;
        end
    end

    // Test 4: Check wrap around to 0
    #10;
    if (Q !== 0) begin
        $display("FAIL: Q did not wrap around to 0");
        $finish;
    end

    // Test 5: Disable counter and check that Q remains the same
    en = 0;
    #10;
    if (Q !== 0) begin
        $display("FAIL: Q changed when counter was disabled");
        $finish;
    end

    // Test 6: Re-enable counter and check counting
    en = 1;
    #10;
    if (Q !== 1) begin
        $display("FAIL: Q did not increment to 1 after re-enabling");
        $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
end

endmodule