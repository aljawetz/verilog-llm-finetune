`timescale 1ns/1ps

module tb_tff;

reg clk;
reg rst;
reg t;
wire q;
wire qb;

// Instantiate the T flip-flop module
tff uut (
    .clk(clk),
    .rst(rst),
    .t(t),
    .q(q),
    .qb(qb)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    t = 0;

    // Test reset functionality
    rst = 1; #10;
    if (q !== 0 || qb !== 1) begin
        $display("FAIL: Reset did not set Q to 0 and QB to 1");
        $finish;
    end

    // Release reset
    rst = 0; #10;

    // Test toggling behavior with T = 1
    t = 1; #10; // First toggle
    if (q !== 1 || qb !== 0) begin
        $display("FAIL: Q did not toggle to 1 when T=1");
        $finish;
    end

    #10; // Wait for next clock
    if (q !== 0 || qb !== 1) begin
        $display("FAIL: Q did not toggle to 0 on next clock with T=1");
        $finish;
    end

    // Test holding state with T = 0
    t = 0; #10; // Should hold state
    if (q !== 0 || qb !== 1) begin
        $display("FAIL: Q changed when T=0");
        $finish;
    end

    // Test toggling again with T = 1
    t = 1; #10; // Toggle to 1
    if (q !== 1 || qb !== 0) begin
        $display("FAIL: Q did not toggle to 1 when T=1 again");
        $finish;
    end

    // Final check with reset
    rst = 1; #10;
    if (q !== 0 || qb !== 1) begin
        $display("FAIL: Reset did not set Q to 0 and QB to 1 again");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule