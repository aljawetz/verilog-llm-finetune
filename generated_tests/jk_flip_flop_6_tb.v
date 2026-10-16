`timescale 1ns/1ps

module tb_jk_flip_flop;
  reg j, k, clk, rst;
  wire q, qbar;

  // Instantiate the JK flip-flop
  jk_flip_flop uut (
    .j(j),
    .k(k),
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
    // Initialize
    rst = 1; j = 0; k = 0;
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test case 1: Maintain state (J=0, K=0)
    #10; // Wait for a clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Initial state should be 0, q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 2: Reset (J=0, K=1)
    j = 0; k = 1;
    #10; // Wait for a clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: After reset, q should be 0, q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 3: Set (J=1, K=0)
    j = 1; k = 0;
    #10; // Wait for a clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: After set, q should be 1, q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 4: Toggle (J=1, K=1)
    j = 1; k = 1;
    #10; // Wait for a clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: After toggle, q should be 0, q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 5: Toggle again (J=1, K=1)
    #10; // Wait for a clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: After toggle, q should be 1, q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // Test case 6: Asynchronous reset (J=0, K=0, rst=1)
    rst = 1;
    #10; // Wait for a clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: After async reset, q should be 0, q=%b, qbar=%b", q, qbar);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end
endmodule