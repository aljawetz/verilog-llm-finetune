`timescale 1ns/1ps

module tb_ENCODER_4x2;

  // Inputs
  reg D3;
  reg D2;
  reg D1;
  reg D0;

  // Outputs
  wire O2;
  wire O1;

  // Instantiate the Unit Under Test (UUT)
  ENCODER_4x2 uut (
    .D3(D3),
    .D2(D2),
    .D1(D1),
    .D0(D0),
    .O2(O2),
    .O1(O1)
  );

  initial begin
    // Initialize Inputs
    D3 = 0; D2 = 0; D1 = 0; D0 = 0;

    // Test case 1: All inputs low
    #10;
    if (O2 !== 0 || O1 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: D1 high
    D1 = 1; D2 = 0; D3 = 0; D0 = 0;
    #10;
    if (O2 !== 0 || O1 !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: D2 high
    D1 = 0; D2 = 1; D3 = 0; D0 = 0;
    #10;
    if (O2 !== 1 || O1 !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: D3 high
    D1 = 0; D2 = 0; D3 = 1; D0 = 0;
    #10;
    if (O2 !== 1 || O1 !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: D0 high (should not affect outputs)
    D1 = 0; D2 = 0; D3 = 0; D0 = 1;
    #10;
    if (O2 !== 0 || O1 !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: D1 and D3 high
    D1 = 1; D2 = 0; D3 = 1; D0 = 0;
    #10;
    if (O2 !== 1 || O1 !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: D2 and D3 high
    D1 = 0; D2 = 1; D3 = 1; D0 = 0;
    #10;
    if (O2 !== 1 || O1 !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: All inputs high (D0 should not affect)
    D1 = 1; D2 = 1; D3 = 1; D0 = 1;
    #10;
    if (O2 !== 1 || O1 !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule