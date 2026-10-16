`timescale 1ns/1ps

module tb_jkff_negedge;

reg j, k, clk, rst;
wire q, qb;

// Instantiate the module under test (uut)
jkff_negedge uut (
    .j(j),
    .k(k),
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
    // Initialize inputs
    j = 0; k = 0; rst = 1; // Reset state
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test hold state
    #10; j = 0; k = 0; // Hold
    #10; if (q !== 0) $display("FAIL: Expected q=0 in hold state, got q=%b", q);

    // Test set state
    #10; j = 1; k = 0; // Set
    #10; if (q !== 1) $display("FAIL: Expected q=1 in set state, got q=%b", q);

    // Test toggle state
    #10; j = 1; k = 1; // Toggle
    #10; if (q !== 0) $display("FAIL: Expected q=0 after toggle, got q=%b", q);
    #10; if (q !== 1) $display("FAIL: Expected q=1 after toggle, got q=%b", q);

    // Test reset state
    #10; j = 0; k = 1; // Reset
    #10; if (q !== 0) $display("FAIL: Expected q=0 in reset state, got q=%b", q);

    // Final check for complementary output
    #10; if (qb !== 1) $display("FAIL: Expected qb=1, got qb=%b", qb);

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule