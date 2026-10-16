`timescale 1ns/1ps

module tb_IC7408;

  // Inputs
  reg P1, P2, P4, P5, P9, P10, P12, P13;
  reg P7, P14; // SUPPLY

  // Outputs
  wire P3, P6, P8, P11;

  // Instantiate the Unit Under Test (UUT)
  IC7408 uut (
    .P1(P1), .P2(P2), .P3(P3),
    .P4(P4), .P5(P5), .P6(P6),
    .P7(P7), .P8(P8), .P9(P9),
    .P10(P10), .P11(P11), .P12(P12),
    .P13(P13), .P14(P14)
  );

  initial begin
    // Initialize inputs
    P1 = 0; P2 = 0; P4 = 0; P5 = 0; 
    P9 = 0; P10 = 0; P12 = 0; P13 = 0;
    P7 = 1; P14 = 1; // SUPPLY

    // Test case 1: All inputs low
    #10;
    if (P3 !== 0 || P6 !== 0 || P8 !== 0 || P11 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: First AND gate high
    P1 = 1; P2 = 1;
    #10;
    if (P3 !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Second AND gate high
    P4 = 1; P5 = 1;
    #10;
    if (P6 !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Third AND gate high
    P9 = 1; P10 = 1;
    #10;
    if (P8 !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Fourth AND gate high
    P12 = 1; P13 = 1;
    #10;
    if (P11 !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Mixed inputs
    P1 = 1; P2 = 0; P4 = 1; P5 = 0; 
    P9 = 1; P10 = 0; P12 = 1; P13 = 0;
    #10;
    if (P3 !== 0 || P6 !== 0 || P8 !== 0 || P11 !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule