`timescale 1ns/1ps

module tb_jkff;

reg clk;
reg j;
reg k;
reg rst;
wire q;
wire qb;

// Instantiate the module under test
jkff uut (
    .clk(clk),
    .j(j),
    .k(k),
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
    rst = 1; j = 0; k = 0;
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test case 1: Reset functionality
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: Reset did not set q to 0 and qb to 1");
        $finish;
    end

    // Test case 2: J = 0, K = 0 (no change)
    j = 0; k = 0;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: No change expected with J=0, K=0");
        $finish;
    end

    // Test case 3: J = 0, K = 1 (reset q)
    j = 0; k = 1;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: Expected q=0, qb=1 with J=0, K=1");
        $finish;
    end

    // Test case 4: J = 1, K = 0 (set q)
    j = 1; k = 0;
    #10;
    if (q !== 1'b1 || qb !== 1'b0) begin
        $display("FAIL: Expected q=1, qb=0 with J=1, K=0");
        $finish;
    end

    // Test case 5: J = 1, K = 1 (toggle q)
    j = 1; k = 1;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: Expected q=0, qb=1 after toggle with J=1, K=1");
        $finish;
    end

    // Test case 6: J = 1, K = 1 (toggle again)
    #10;
    if (q !== 1'b1 || qb !== 1'b0) begin
        $display("FAIL: Expected q=1, qb=0 after toggle with J=1, K=1");
        $finish;
    end

    // Test case 7: Reset again
    rst = 1;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: Reset did not set q to 0 and qb to 1");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule