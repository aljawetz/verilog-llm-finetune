`timescale 1ns/1ps

module tb_operator_B;

  // Inputs
  reg P;
  reg G;
  reg P1;
  reg G1;

  // Outputs
  wire Po;
  wire Go;

  // Instantiate the Unit Under Test (UUT)
  operator_B uut (
    .P(P),
    .G(G),
    .P1(P1),
    .G1(G1),
    .Po(Po),
    .Go(Go)
  );

  initial begin
    // Initialize Inputs
    P = 0; G = 0; P1 = 0; G1 = 0;

    // Test case 1: P=0, P1=0, G=0, G1=0
    #10;
    if (Po !== 0 || Go !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: P=1, P1=1, G=0, G1=0
    P = 1; P1 = 1; G = 0; G1 = 0;
    #10;
    if (Po !== 1 || Go !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: P=1, P1=1, G=1, G1=0
    P = 1; P1 = 1; G = 1; G1 = 0;
    #10;
    if (Po !== 1 || Go !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: P=1, P1=0, G=1, G1=1
    P = 1; P1 = 0; G = 1; G1 = 1;
    #10;
    if (Po !== 0 || Go !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: P=0, P1=1, G=1, G1=1
    P = 0; P1 = 1; G = 1; G1 = 1;
    #10;
    if (Po !== 0 || Go !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: P=1, P1=1, G=0, G1=1
    P = 1; P1 = 1; G = 0; G1 = 1;
    #10;
    if (Po !== 1 || Go !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule