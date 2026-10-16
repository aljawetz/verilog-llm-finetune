`timescale 1ns/1ps

module tb_base_decoder;

  reg [1:0] in;
  reg en;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  base_decoder uut (
    .in(in),
    .en(en),
    .out(out)
  );

  initial begin
    // Test case 1: Enable is low, output should be 0000
    en = 0; in = 2'b00; #10;
    if (out !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", out);
      $finish;
    end

    // Test case 2: Enable is high, input is 00, output should be 0001
    en = 1; in = 2'b00; #10;
    if (out !== 4'b0001) begin
      $display("FAIL: Test case 2 failed, expected 0001, got %b", out);
      $finish;
    end

    // Test case 3: Enable is high, input is 01, output should be 0010
    in = 2'b01; #10;
    if (out !== 4'b0010) begin
      $display("FAIL: Test case 3 failed, expected 0010, got %b", out);
      $finish;
    end

    // Test case 4: Enable is high, input is 10, output should be 0100
    in = 2'b10; #10;
    if (out !== 4'b0100) begin
      $display("FAIL: Test case 4 failed, expected 0100, got %b", out);
      $finish;
    end

    // Test case 5: Enable is high, input is 11, output should be 1000
    in = 2'b11; #10;
    if (out !== 4'b1000) begin
      $display("FAIL: Test case 5 failed, expected 1000, got %b", out);
      $finish;
    end

    // Test case 6: Enable is high, input is invalid (default case), output should be xxxx
    in = 2'bxx; #10;
    if (out !== 4'bxxxx) begin
      $display("FAIL: Test case 6 failed, expected xxxx, got %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule