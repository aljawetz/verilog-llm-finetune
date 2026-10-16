`timescale 1ns/1ps

module tb_div_by_2;

  reg clk;
  reg rst;
  wire div;

  // Instantiate the module under test (uut)
  div_by_2 uut (
    .clk(clk),
    .rst(rst),
    .div(div)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Hold reset for 10ns
    rst = 0;
    
    // Wait for a few clock cycles and check output
    #10;
    if (div !== 1'b1) begin
      $display("FAIL: Expected div to be 1 after 10ns, got %b", div);
      $finish;
    end

    #10;
    if (div !== 1'b0) begin
      $display("FAIL: Expected div to be 0 after 20ns, got %b", div);
      $finish;
    end

    #10;
    if (div !== 1'b1) begin
      $display("FAIL: Expected div to be 1 after 30ns, got %b", div);
      $finish;
    end

    #10;
    if (div !== 1'b0) begin
      $display("FAIL: Expected div to be 0 after 40ns, got %b", div);
      $finish;
    end

    // Test reset functionality
    rst = 1;
    #10;
    if (div !== 1'b0) begin
      $display("FAIL: Expected div to be 0 after reset, got %b", div);
      $finish;
    end

    rst = 0;
    #10;
    if (div !== 1'b1) begin
      $display("FAIL: Expected div to be 1 after releasing reset, got %b", div);
      $finish;
    end

    // Final checks
    #10;
    if (div !== 1'b0) begin
      $display("FAIL: Expected div to be 0 after 60ns, got %b", div);
      $finish;
    end

    #10;
    if (div !== 1'b1) begin
      $display("FAIL: Expected div to be 1 after 70ns, got %b", div);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule