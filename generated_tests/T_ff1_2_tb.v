`timescale 1ns/1ps

module tb_T_ff1;

reg T;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the module under test (uut)
T_ff1 uut (
    .T(T),
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
    T = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test case 1: Check reset functionality
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1");
        $finish;
    end

    // Test case 2: T = 0, q should remain unchanged
    #10; // Wait for 10ns
    T = 0; // T is low
    #10; // Wait for 10ns
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: q should remain 0 when T is 0");
        $finish;
    end

    // Test case 3: T = 1, q should toggle
    #10; // Wait for 10ns
    T = 1; // T is high
    #10; // Wait for 10ns
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: q should toggle to 1 when T is 1");
        $finish;
    end

    // Test case 4: T = 1, q should toggle again
    #10; // Wait for 10ns
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: q should toggle back to 0 when T is still 1");
        $finish;
    end

    // Test case 5: Assert reset again
    #10; // Wait for 10ns
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
        $finish;
    end

    // Test case 6: T = 1 after reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset
    T = 1; // T is high
    #10; // Wait for 10ns
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: q should toggle to 1 after reset when T is 1");
        $finish;
    end

    // Final check: Toggle q once more
    #10; // Wait for 10ns
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: q should toggle back to 0 when T is still 1");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule