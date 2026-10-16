`timescale 1ns/1ps

module tb_BLOCK2;

  // Inputs
  reg PIN1;
  reg PIN2;
  reg GIN1;
  reg GIN2;
  reg PHI;

  // Outputs
  wire POUT;
  wire GOUT;

  // Instantiate the module under test (uut)
  BLOCK2 uut (
    .PIN1(PIN1),
    .PIN2(PIN2),
    .GIN1(GIN1),
    .GIN2(GIN2),
    .PHI(PHI),
    .POUT(POUT),
    .GOUT(GOUT)
  );

  // Clock generation
  initial begin
    PHI = 0;
    forever #5 PHI = ~PHI; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Test case 1
    PIN1 = 0; PIN2 = 0; GIN1 = 0; GIN2 = 0; #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2
    PIN1 = 0; PIN2 = 0; GIN1 = 0; GIN2 = 1; #10;
    if (POUT !== 1'b1 || GOUT !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3
    PIN1 = 0; PIN2 = 1; GIN1 = 0; GIN2 = 0; #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4
    PIN1 = 1; PIN2 = 0; GIN1 = 0; GIN2 = 0; #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5
    PIN1 = 1; PIN2 = 1; GIN1 = 0; GIN2 = 0; #10;
    if (POUT !== 1'b0 || GOUT !== 1'b1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6
    PIN1 = 1; PIN2 = 1; GIN1 = 1; GIN2 = 0; #10;
    if (POUT !== 1'b0 || GOUT !== 1'b0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7
    PIN1 = 1; PIN2 = 1; GIN1 = 0; GIN2 = 1; #10;
    if (POUT !== 1'b0 || GOUT !== 1'b0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8
    PIN1 = 0; PIN2 = 1; GIN1 = 1; GIN2 = 1; #10;
    if (POUT !== 1'b1 || GOUT !== 1'b0) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule