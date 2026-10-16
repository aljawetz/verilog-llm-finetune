`timescale 1ns/1ps

module tb_demux1x4;

  reg I;
  reg [1:0] S;
  wire [3:0] D;

  // Instantiate the demux1x4 module
  demux1x4 uut (
    .I(I),
    .S(S),
    .D(D)
  );

  initial begin
    // Initialize inputs
    I = 0;
    S = 2'b00;

    // Test case 1: Select 0, expect D[0] = I
    I = 1; S = 2'b00; #10;
    if (D !== 4'b0001) begin
      $display("FAIL: Test case 1 failed, expected D = 0001, got D = %b", D);
      $finish;
    end

    // Test case 2: Select 1, expect D[1] = I
    I = 1; S = 2'b01; #10;
    if (D !== 4'b0010) begin
      $display("FAIL: Test case 2 failed, expected D = 0010, got D = %b", D);
      $finish;
    end

    // Test case 3: Select 2, expect D[2] = I
    I = 1; S = 2'b10; #10;
    if (D !== 4'b0100) begin
      $display("FAIL: Test case 3 failed, expected D = 0100, got D = %b", D);
      $finish;
    end

    // Test case 4: Select 3, expect D[3] = I
    I = 1; S = 2'b11; #10;
    if (D !== 4'b1000) begin
      $display("FAIL: Test case 4 failed, expected D = 1000, got D = %b", D);
      $finish;
    end

    // Test case 5: Check with I = 0, all outputs should be 0
    I = 0; S = 2'b00; #10;
    if (D !== 4'b0000) begin
      $display("FAIL: Test case 5 failed, expected D = 0000, got D = %b", D);
      $finish;
    end

    // Final check with I = 0 and different selects
    S = 2'b01; #10;
    if (D !== 4'b0000) begin
      $display("FAIL: Test case 6 failed, expected D = 0000, got D = %b", D);
      $finish;
    end

    S = 2'b10; #10;
    if (D !== 4'b0000) begin
      $display("FAIL: Test case 7 failed, expected D = 0000, got D = %b", D);
      $finish;
    end

    S = 2'b11; #10;
    if (D !== 4'b0000) begin
      $display("FAIL: Test case 8 failed, expected D = 0000, got D = %b", D);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule