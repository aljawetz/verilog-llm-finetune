`timescale 1ns/1ps

module tb_counter_12;

  reg rst_n;
  reg clk;
  reg valid_count;
  wire [3:0] out;

  // Instantiate the counter_12 module
  counter_12 uut (
    .rst_n(rst_n),
    .clk(clk),
    .valid_count(valid_count),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    valid_count = 0;
    #10; // Wait for some time

    // Release reset
    rst_n = 1;
    #10;

    // Test counting from 0 to 11
    valid_count = 1;
    repeat (12) @(posedge clk);
    
    // Check output after counting to 11
    if (out !== 4'd11) begin
      $display("FAIL: Expected out to be 11 after counting, got %d", out);
      $finish;
    end

    // Check wrap around
    @(posedge clk);
    if (out !== 4'd0) begin
      $display("FAIL: Expected out to be 0 after wrap around, got %d", out);
      $finish;
    end

    // Test reset functionality
    rst_n = 0;
    @(posedge clk);
    if (out !== 4'd0) begin
      $display("FAIL: Expected out to be 0 after reset, got %d", out);
      $finish;
    end

    // Release reset and count again
    rst_n = 1;
    #10;
    valid_count = 1;
    repeat (12) @(posedge clk);

    // Check output after counting to 11 again
    if (out !== 4'd11) begin
      $display("FAIL: Expected out to be 11 after counting again, got %d", out);
      $finish;
    end

    // Check wrap around again
    @(posedge clk);
    if (out !== 4'd0) begin
      $display("FAIL: Expected out to be 0 after wrap around again, got %d", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule