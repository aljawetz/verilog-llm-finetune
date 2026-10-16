`timescale 1ns/1ps

module tb_T_FF;

reg clock;
reg rst;
reg t;
wire q;
wire q_bar;

// Instantiate the T_FF module
T_FF uut (
    .clock(clock),
    .rst(rst),
    .t(t),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
always begin
    #5 clock = ~clock; // 10ns clock period
end

initial begin
    // Initialize signals
    clock = 0;
    rst = 0;
    t = 0;

    // Test 1: Reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and q_bar to 1");
        $finish;
    end

    // Deassert reset
    rst = 0;
    #10; // Wait for one clock cycle

    // Test 2: T = 0, q should remain unchanged
    t = 0;
    #10; // Wait for one clock cycle
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: q should remain 0 and q_bar should remain 1 when t is 0");
        $finish;
    end

    // Test 3: T = 1, q should toggle
    t = 1;
    #10; // Wait for one clock cycle
    if (q !== 1 || q_bar !== 0) begin
        $display("FAIL: q should toggle to 1 and q_bar should toggle to 0 when t is 1");
        $finish;
    end

    // Test 4: T = 1, q should toggle again
    #10; // Wait for one clock cycle
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: q should toggle back to 0 and q_bar should toggle back to 1");
        $finish;
    end

    // Test 5: T = 0, q should remain unchanged
    t = 0;
    #10; // Wait for one clock cycle
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: q should remain 0 and q_bar should remain 1 when t is 0");
        $finish;
    end

    // Test 6: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and q_bar to 1");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule