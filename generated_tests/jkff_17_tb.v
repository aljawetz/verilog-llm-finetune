`timescale 1ns/1ps

module tb_jkff;
  reg clk;
  reg j;
  reg k;
  reg rst;
  wire q;
  wire qb;

  // Instantiate the module under test (uut)
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

    // Test case 1: Reset state
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 2: Set state (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1'b1 || qb !== 1'b0) begin
      $display("FAIL: j=1, k=0 did not set q to 1 and qb to 0");
      $finish;
    end

    // Test case 3: Reset state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: j=0, k=1 did not reset q to 0 and qb to 1");
      $finish;
    end

    // Test case 4: Toggle state (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (q !== 1'b1 || qb !== 1'b0) begin
      $display("FAIL: j=1, k=1 did not set q to 1 and qb to 0");
      $finish;
    end

    // Test case 5: Toggle state again (j=1, k=1)
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: j=1, k=1 did not toggle q to 0 and qb to 1");
      $finish;
    end

    // Test case 6: Check no change (j=0, k=0)
    j = 0; k = 0;
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
      $display("FAIL: j=0, k=0 did not keep q at 0 and qb at 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule