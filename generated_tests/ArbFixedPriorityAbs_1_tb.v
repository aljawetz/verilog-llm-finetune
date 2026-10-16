`timescale 1ns/1ps

module tb_ArbFixedPriorityAbs;

  reg clk;
  reg rst_n;
  reg [3:0] req;
  wire [3:0] grant;

  // Instantiate the module under test (uut)
  ArbFixedPriorityAbs uut (
    .clk(clk),
    .rst_n(rst_n),
    .req(req),
    .grant(grant)
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
    req = 4'b0000;

    // Apply reset
    #10;
    rst_n = 1;

    // Test case 1: Only req[0] is active
    req = 4'b0001; // req[0] should be granted
    #10;
    if (grant !== 4'b0001) begin
      $display("FAIL: Expected grant 0001, got %b", grant);
      $finish;
    end

    // Test case 2: req[1] is active, req[0] is inactive
    req = 4'b0010; // req[1] should be granted
    #10;
    if (grant !== 4'b0010) begin
      $display("FAIL: Expected grant 0010, got %b", grant);
      $finish;
    end

    // Test case 3: req[0] and req[1] are active
    req = 4'b0011; // req[0] should be granted
    #10;
    if (grant !== 4'b0001) begin
      $display("FAIL: Expected grant 0001, got %b", grant);
      $finish;
    end

    // Test case 4: req[2] is active, req[0] and req[1] are inactive
    req = 4'b0100; // req[2] should be granted
    #10;
    if (grant !== 4'b0100) begin
      $display("FAIL: Expected grant 0100, got %b", grant);
      $finish;
    end

    // Test case 5: req[1] and req[2] are active
    req = 4'b0110; // req[1] should be granted
    #10;
    if (grant !== 4'b0010) begin
      $display("FAIL: Expected grant 0010, got %b", grant);
      $finish;
    end

    // Test case 6: All requests active
    req = 4'b1111; // req[0] should be granted
    #10;
    if (grant !== 4'b0001) begin
      $display("FAIL: Expected grant 0001, got %b", grant);
      $finish;
    end

    // Test case 7: No requests active
    req = 4'b0000; // no grants should be active
    #10;
    if (grant !== 4'b0000) begin
      $display("FAIL: Expected grant 0000, got %b", grant);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule