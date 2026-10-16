`timescale 1ns/1ps

module tb_j_k_flipflop;
  reg j, k, clk, reset;
  wire q;

  // Instantiate the J-K flip-flop
  j_k_flipflop uut (
    .j(j),
    .k(k),
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1; j = 0; k = 0;
    #10; // Wait for 10ns
    reset = 0;

    // Test case 1: No change (j=0, k=0)
    #10; 
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 2: Reset (j=0, k=1)
    j = 0; k = 1;
    #10; 
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: Set (j=1, k=0)
    j = 1; k = 0;
    #10; 
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 4: Toggle (j=1, k=1)
    j = 1; k = 1;
    #10; 
    if (q !== 0) begin
      $display("FAIL: Expected q=0 after toggle, got q=%b", q);
      $finish;
    end

    #10; 
    if (q !== 1) begin
      $display("FAIL: Expected q=1 after toggle, got q=%b", q);
      $finish;
    end

    // Test case 5: Reset again (j=0, k=1)
    j = 0; k = 1;
    #10; 
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 6: No change (j=0, k=0)
    j = 0; k = 0;
    #10; 
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 7: Set (j=1, k=0)
    j = 1; k = 0;
    #10; 
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 8: Toggle (j=1, k=1)
    j = 1; k = 1;
    #10; 
    if (q !== 0) begin
      $display("FAIL: Expected q=0 after toggle, got q=%b", q);
      $finish;
    end

    #10; 
    if (q !== 1) begin
      $display("FAIL: Expected q=1 after toggle, got q=%b", q);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule