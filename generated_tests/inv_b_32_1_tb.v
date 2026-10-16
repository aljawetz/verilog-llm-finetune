`timescale 1ns/1ps

module tb_inv_b_32;

  reg  [31:0] inp;
  wire [31:0] out_l;

  // Instantiate the module under test (uut)
  inv_b_32 uut (
    .inp(inp),
    .out_l(out_l)
  );

  initial begin
    // Test case 1: All bits are 0
    inp = 32'b00000000000000000000000000000000;
    #10;
    if (out_l !== 32'b11111111111111111111111111111111) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: All bits are 1
    inp = 32'b11111111111111111111111111111111;
    #10;
    if (out_l !== 32'b00000000000000000000000000000000) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Alternating bits
    inp = 32'b10101010101010101010101010101010;
    #10;
    if (out_l !== 32'b01010101010101010101010101010101) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Random value
    inp = 32'b11001100110011001100110011001100;
    #10;
    if (out_l !== 32'b00110011001100110011001100110011) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: All bits are 0 except one
    inp = 32'b00000000000000000000000000000001;
    #10;
    if (out_l !== 32'b11111111111111111111111111111110) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: All bits are 1 except one
    inp = 32'b11111111111111111111111111111110;
    #10;
    if (out_l !== 32'b00000000000000000000000000000001) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule