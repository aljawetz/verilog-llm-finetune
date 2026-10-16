`timescale 1ns/1ps

module tb_Verifier_level3;

  // Inputs
  reg verifier;

  // Outputs
  wire ledr_out;
  wire ledg_out;

  // Instantiate the Unit Under Test (UUT)
  Verifier_level3 uut (
    .verifier(verifier),
    .ledr_out(ledr_out),
    .ledg_out(ledg_out)
  );

  initial begin
    // Test sequence
    // Test case 1: verifier is high
    verifier = 1'b1; // Set verifier high
    #10; // Wait for 10 time units
    if (ledr_out !== 1'b0 || ledg_out !== 1'b1) begin
      $display("FAIL: Test case 1 failed. Expected ledr_out=0, ledg_out=1 but got ledr_out=%b, ledg_out=%b", ledr_out, ledg_out);
      $finish;
    end

    // Test case 2: verifier is low
    verifier = 1'b0; // Set verifier low
    #10; // Wait for 10 time units
    if (ledr_out !== 1'b1 || ledg_out !== 1'b0) begin
      $display("FAIL: Test case 2 failed. Expected ledr_out=1, ledg_out=0 but got ledr_out=%b, ledg_out=%b", ledr_out, ledg_out);
      $finish;
    end

    // Test case 3: verifier toggles
    verifier = 1'b1; // Set verifier high
    #10; // Wait for 10 time units
    if (ledr_out !== 1'b0 || ledg_out !== 1'b1) begin
      $display("FAIL: Test case 3 failed. Expected ledr_out=0, ledg_out=1 but got ledr_out=%b, ledg_out=%b", ledr_out, ledg_out);
      $finish;
    end

    verifier = 1'b0; // Set verifier low
    #10; // Wait for 10 time units
    if (ledr_out !== 1'b1 || ledg_out !== 1'b0) begin
      $display("FAIL: Test case 4 failed. Expected ledr_out=1, ledg_out=0 but got ledr_out=%b, ledg_out=%b", ledr_out, ledg_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule