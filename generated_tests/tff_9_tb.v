`timescale 1ns/1ps

module tb_tff;

reg t;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the T flip-flop
tff uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    t = 0;
    rst = 1; // Start with reset active
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test case 1: T = 0, output should hold
    t = 0;
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Expected q=0 when T=0 and rst=0, got q=%b", q);
        $finish;
    end

    // Test case 2: T = 1, output should toggle
    t = 1;
    #10; // Wait for 10ns
    if (q !== 1) begin
        $display("FAIL: Expected q=1 when T=1, got q=%b", q);
        $finish;
    end

    // Test case 3: Toggle again
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after toggle, got q=%b", q);
        $finish;
    end

    // Test case 4: T = 0, output should hold
    t = 0;
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Expected q=0 when T=0, got q=%b", q);
        $finish;
    end

    // Test case 5: T = 1, output should toggle
    t = 1;
    #10; // Wait for 10ns
    if (q !== 1) begin
        $display("FAIL: Expected q=1 when T=1, got q=%b", q);
        $finish;
    end

    // Test case 6: Reset the flip-flop
    rst = 1; // Activate reset
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Expected q=0 after reset, got q=%b", q);
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule