`timescale 1ns/1ps

module tb_pattern_decoder;

  reg [1:0] in;
  reg en;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  pattern_decoder uut (
    .in(in),
    .en(en),
    .out(out)
  );

  initial begin
    // Test case 1: Disabled input
    en = 0; in = 2'b00; #10;
    if (out !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 4'b0000, got %b", out);
      $finish;
    end

    // Test case 2: Enabled input for 0
    en = 1; in = 2'b00; #10;
    if (out !== 4'b0001) begin
      $display("FAIL: Test case 2 failed, expected 4'b0001, got %b", out);
      $finish;
    end

    // Test case 3: Enabled input for 1
    in = 2'b01; #10;
    if (out !== 4'b0010) begin
      $display("FAIL: Test case 3 failed, expected 4'b0010, got %b", out);
      $finish;
    end

    // Test case 4: Enabled input for 2
    in = 2'b10; #10;
    if (out !== 4'b0100) begin
      $display("FAIL: Test case 4 failed, expected 4'b0100, got %b", out);
      $finish;
    end

    // Test case 5: Enabled input for undefined value
    in = 2'b11; #10;
    if (out !== 4'bxxxx) begin
      $display("FAIL: Test case 5 failed, expected 4'bxxxx, got %b", out);
      $finish;
    end

    // Test case 6: Check for disabled input again
    en = 0; in = 2'b11; #10;
    if (out !== 4'b0000) begin
      $display("FAIL: Test case 6 failed, expected 4'b0000, got %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule