`timescale 1ns/1ps

module tb_or1200_fpu_fcmp;

  reg [31:0] opa;
  reg [31:0] opb;
  wire unordered;
  wire altb;
  wire blta;
  wire aeqb;
  wire inf;
  wire zero;

  // Instantiate the module under test (uut)
  or1200_fpu_fcmp uut (
    .opa(opa),
    .opb(opb),
    .unordered(unordered),
    .altb(altb),
    .blta(blta),
    .aeqb(aeqb),
    .inf(inf),
    .zero(zero)
  );

  initial begin
    // Test case 1: Normal comparison (1.0 vs 2.0)
    opa = 32'h3F800000; // 1.0
    opb = 32'h40000000; // 2.0
    #10;
    if (altb !== 1'b1 || blta !== 1'b0 || aeqb !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: Equal comparison (1.0 vs 1.0)
    opa = 32'h3F800000; // 1.0
    opb = 32'h3F800000; // 1.0
    #10;
    if (altb !== 1'b0 || blta !== 1'b0 || aeqb !== 1'b1) 
      $display("FAIL: Test case 2 failed");

    // Test case 3: Less than comparison (-1.0 vs 1.0)
    opa = 32'hBF800000; // -1.0
    opb = 32'h3F800000; // 1.0
    #10;
    if (altb !== 1'b0 || blta !== 1'b1 || aeqb !== 1'b0) 
      $display("FAIL: Test case 3 failed");

    // Test case 4: Infinity comparison (inf vs 1.0)
    opa = 32'h7F800000; // +inf
    opb = 32'h3F800000; // 1.0
    #10;
    if (altb !== 1'b0 || blta !== 1'b0 || aeqb !== 1'b0) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: NaN comparison
    opa = 32'h7FC00000; // NaN
    opb = 32'h3F800000; // 1.0
    #10;
    if (unordered !== 1'b1) 
      $display("FAIL: Test case 5 failed");

    // Test case 6: Zero comparison (0.0 vs -0.0)
    opa = 32'h00000000; // 0.0
    opb = 32'h80000000; // -0.0
    #10;
    if (altb !== 1'b0 || blta !== 1'b0 || aeqb !== 1'b1) 
      $display("FAIL: Test case 6 failed");

    // Test case 7: Both operands are zero
    opa = 32'h00000000; // 0.0
    opb = 32'h00000000; // 0.0
    #10;
    if (altb !== 1'b0 || blta !== 1'b0 || aeqb !== 1'b1) 
      $display("FAIL: Test case 7 failed");

    // Test case 8: Negative infinity comparison
    opa = 32'hFF800000; // -inf
    opb = 32'h3F800000; // 1.0
    #10;
    if (altb !== 1'b1 || blta !== 1'b0 || aeqb !== 1'b0) 
      $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule