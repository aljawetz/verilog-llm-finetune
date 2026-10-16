`timescale 1ns/1ps

module tb_dff_sync;

reg d;
reg clk;
reg rst;
wire q;
wire qb;

// Instantiate the module under test (uut)
dff_sync uut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qb(qb)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    d = 0;
    rst = 0;

    // Test 1: Reset the flip-flop
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 0 || qb !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qb to 1");
        $finish;
    end

    // Test 2: Set d to 1 and clock
    rst = 0; // Deactivate reset
    d = 1; // Set input
    #10; // Wait for one clock cycle
    if (q !== 1 || qb !== 0) begin
        $display("FAIL: q did not update to 1 and qb to 0");
        $finish;
    end

    // Test 3: Change d to 0 and clock
    d = 0; // Change input
    #10; // Wait for one clock cycle
    if (q !== 0 || qb !== 1) begin
        $display("FAIL: q did not update to 0 and qb to 1");
        $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 0 || qb !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qb to 1");
        $finish;
    end

    // Test 5: Set d to 1 again and clock
    rst = 0; // Deactivate reset
    d = 1; // Set input
    #10; // Wait for one clock cycle
    if (q !== 1 || qb !== 0) begin
        $display("FAIL: q did not update to 1 and qb to 0");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule