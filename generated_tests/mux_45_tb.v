`timescale 1ns/1ps

module tb_mux;

  reg A;
  reg B;
  reg S;
  wire Y;

  // Instantiate the module under test (uut)
  mux uut (
    .A(A),
    .B(B),
    .S(S),
    .Y(Y)
  );

  initial begin
    // Test case 1: A = 0, B = 0, S = 0 => Y should be 0
    A = 0; B = 0; S = 0;
    #10;
    if (Y !== 0) begin
      $display("FAIL: Test case 1 failed, expected Y=0, got Y=%b", Y);
      $finish;
    end

    // Test case 2: A = 0, B = 1, S = 0 => Y should be 0
    A = 0; B = 1; S = 0;
    #10;
    if (Y !== 0) begin
      $display("FAIL: Test case 2 failed, expected Y=0, got Y=%b", Y);
      $finish;
    end

    // Test case 3: A = 1, B = 0, S = 0 => Y should be 1
    A = 1; B = 0; S = 0;
    #10;
    if (Y !== 1) begin
      $display("FAIL: Test case 3 failed, expected Y=1, got Y=%b", Y);
      $finish;
    end

    // Test case 4: A = 0, B = 1, S = 1 => Y should be 1
    A = 0; B = 1; S = 1;
    #10;
    if (Y !== 1) begin
      $display("FAIL: Test case 4 failed, expected Y=1, got Y=%b", Y);
      $finish;
    end

    // Test case 5: A = 1, B = 1, S = 0 => Y should be 1
    A = 1; B = 1; S = 0;
    #10;
    if (Y !== 1) begin
      $display("FAIL: Test case 5 failed, expected Y=1, got Y=%b", Y);
      $finish;
    end

    // Test case 6: A = 1, B = 1, S = 1 => Y should be 1
    A = 1; B = 1; S = 1;
    #10;
    if (Y !== 1) begin
      $display("FAIL: Test case 6 failed, expected Y=1, got Y=%b", Y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule