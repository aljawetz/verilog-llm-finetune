`timescale 1ns/1ps

module tb_jk_latch;

reg j, k, en;
wire q, qb;

// Instantiate the module under test
jk_latch uut (
    .j(j),
    .k(k),
    .en(en),
    .q(q),
    .qb(qb)
);

initial begin
    // Initialize inputs
    j = 0; k = 0; en = 0;

    // Test case 1: Set Q to 1 (j=1, k=0)
    j = 1; k = 0; en = 1; #10;
    if (q !== 1'b1 || qb !== 1'b0) $display("FAIL: Test case 1 failed");
    
    // Test case 2: Set Q to 0 (j=0, k=1)
    j = 0; k = 1; en = 1; #10;
    if (q !== 1'b0 || qb !== 1'b1) $display("FAIL: Test case 2 failed");
    
    // Test case 3: No change (j=0, k=0)
    j = 0; k = 0; en = 1; #10;
    if (q !== 1'b0 || qb !== 1'b1) $display("FAIL: Test case 3 failed");
    
    // Test case 4: No change (j=1, k=1)
    j = 1; k = 1; en = 1; #10;
    if (q !== 1'b0 || qb !== 1'b1) $display("FAIL: Test case 4 failed");
    
    // Test case 5: Set Q to 1 again (j=1, k=0)
    j = 1; k = 0; en = 1; #10;
    if (q !== 1'b1 || qb !== 1'b0) $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule