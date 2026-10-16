`timescale 1ns/1ps

module tb_ArbFixedPriorityNAbs;

  reg clk;
  reg rst_n;
  reg [3:0] req;
  wire [3:0] grant;

  // Instantiate the module under test
  ArbFixedPriorityNAbs uut (
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
    rst_n = 0;
    req = 4'b0000;
    #10; // Wait for reset
    rst_n = 1;
    #10;

    // Test case 1: Only req[0] is active
    req = 4'b0001; // req[0] should be granted
    #10;
    if (grant !== 4'b0001) $display("FAIL: Test case 1 failed, expected grant 0001, got %b", grant);

    // Test case 2: Only req[1] is active
    req = 4'b0010; // req[1] should be granted
    #10;
    if (grant !== 4'b0010) $display("FAIL: Test case 2 failed, expected grant 0010, got %b", grant);

    // Test case 3: req[0] and req[1] are active
    req = 4'b0011; // req[0] should be granted
    #10;
    if (grant !== 4'b0001) $display("FAIL: Test case 3 failed, expected grant 0001, got %b", grant);

    // Test case 4: Only req[2] is active
    req = 4'b0100; // req[2] should be granted
    #10;
    if (grant !== 4'b0100) $display("FAIL: Test case 4 failed, expected grant 0100, got %b", grant);

    // Test case 5: req[1] and req[2] are active
    req = 4'b0110; // req[1] should be granted
    #10;
    if (grant !== 4'b0010) $display("FAIL: Test case 5 failed, expected grant 0010, got %b", grant);

    // Test case 6: All requests active
    req = 4'b1111; // req[0] should be granted
    #10;
    if (grant !== 4'b0001) $display("FAIL: Test case 6 failed, expected grant 0001, got %b", grant);

    // Test case 7: Only req[3] is active
    req = 4'b1000; // req[3] should be granted
    #10;
    if (grant !== 4'b1000) $display("FAIL: Test case 7 failed, expected grant 1000, got %b", grant);

    // Test case 8: req[2] and req[3] are active
    req = 4'b1100; // req[2] should be granted
    #10;
    if (grant !== 4'b0100) $display("FAIL: Test case 8 failed, expected grant 0100, got %b", grant);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule