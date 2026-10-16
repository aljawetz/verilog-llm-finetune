`timescale 1ns/1ps

module tb_pipo;

  reg [3:0] pi;
  reg clk;
  reg rst;
  wire [3:0] po;

  // Instantiate the module under test (uut)
  pipo uut (
    .pi(pi),
    .clk(clk),
    .rst(rst),
    .po(po)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; // Assert reset
    pi = 4'b0000;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Load value 4'b1010
    pi = 4'b1010;
    #10; // Wait for clock edge
    if (po !== 4'b1010) begin
      $display("FAIL: Expected po = 4'b1010, got po = %b", po);
      $finish;
    end

    // Test case 2: Load value 4'b1100
    pi = 4'b1100;
    #10; // Wait for clock edge
    if (po !== 4'b1100) begin
      $display("FAIL: Expected po = 4'b1100, got po = %b", po);
      $finish;
    end

    // Test case 3: Assert reset
    rst = 1;
    #10; // Wait for clock edge
    if (po !== 4'b0000) begin
      $display("FAIL: Expected po = 4'b0000 after reset, got po = %b", po);
      $finish;
    end

    // Test case 4: Load value 4'b0011
    rst = 0;
    pi = 4'b0011;
    #10; // Wait for clock edge
    if (po !== 4'b0011) begin
      $display("FAIL: Expected po = 4'b0011, got po = %b", po);
      $finish;
    end

    // Test case 5: Load value 4'b1111
    pi = 4'b1111;
    #10; // Wait for clock edge
    if (po !== 4'b1111) begin
      $display("FAIL: Expected po = 4'b1111, got po = %b", po);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule