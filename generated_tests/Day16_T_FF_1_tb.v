`timescale 1ns/1ps

module tb_Day16_T_FF;

  reg clk;
  reg [3:0] in;
  reg rst;
  wire [3:0] t_out;

  // Instantiate the module under test (uut)
  Day16_T_FF uut (
    .clk(clk),
    .in(in),
    .rst(rst),
    .t_out(t_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1; // Assert reset
    in = 4'b1010; // Example input

    // Wait for a clock edge
    #10;
    if (t_out !== 4'b0000) begin
      $display("FAIL: t_out should be 0000 after reset");
      $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for a clock edge

    // Check output for in = 4'b1010
    in = 4'b1010;
    #10; // Wait for a clock edge
    if (t_out !== ~in) begin
      $display("FAIL: t_out should be %b for in = %b", ~in, in);
      $finish;
    end

    // Check output for in = 4'b0001
    in = 4'b0001;
    #10; // Wait for a clock edge
    if (t_out !== ~in) begin
      $display("FAIL: t_out should be %b for in = %b", ~in, in);
      $finish;
    end

    // Check output for in = 4'b1111
    in = 4'b1111;
    #10; // Wait for a clock edge
    if (t_out !== ~in) begin
      $display("FAIL: t_out should be %b for in = %b", ~in, in);
      $finish;
    end

    // Assert reset again
    rst = 1;
    #10; // Wait for a clock edge
    if (t_out !== 4'b0000) begin
      $display("FAIL: t_out should be 0000 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule