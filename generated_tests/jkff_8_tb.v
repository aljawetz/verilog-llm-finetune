`timescale 1ns/1ps

module tb_jkff;

reg j, k, clk, rst;
wire q, qb;

// Instantiate the JK flip-flop
jkff uut (
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
    j = 0; k = 0; rst = 1; #10; // Apply reset
    rst = 0; #10; // Release reset

    // Test case 1: No change (j=0, k=0)
    j = 0; k = 0; #10;
    if (q !== 0) begin
        $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 2: Set (j=1, k=0)
    j = 1; k = 0; #10;
    if (q !== 1) begin
        $display("FAIL: Test case 2 failed, expected q=1, got q=%b", q);
        $finish;
    end

    // Test case 3: Reset (j=0, k=1)
    j = 0; k = 1; #10;
    if (q !== 0) begin
        $display("FAIL: Test case 3 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 4: Toggle (j=1, k=1)
    j = 1; k = 1; #10;
    if (q !== 1) begin
        $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);
        $finish;
    end
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: Test case 4 failed on toggle, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 5: Asynchronous reset
    rst = 1; #10; // Apply reset
    if (q !== 0) begin
        $display("FAIL: Test case 5 failed, expected q=0 after reset, got q=%b", q);
        $finish;
    end
    rst = 0; #10; // Release reset

    // Final state check
    j = 1; k = 0; #10; // Set
    if (q !== 1) begin
        $display("FAIL: Final state check failed, expected q=1, got q=%b", q);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule