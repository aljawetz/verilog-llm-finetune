`timescale 1ns/1ps

module tb_inv1_32;

  reg [31:0] inp;
  wire [31:0] out_;
  
  // Instantiate the module under test (uut)
  inv1_32 uut (
    .inp(inp),
    .out_(out_)
  );

  initial begin
    // Test case 1: All bits set to 0
    inp = 32'b00000000000000000000000000000000;
    #10;
    if (out_ !== 32'b11111111111111111111111111111111) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: All bits set to 1
    inp = 32'b11111111111111111111111111111111;
    #10;
    if (out_ !== 32'b00000000000000000000000000000000) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Alternating bits
    inp = 32'b10101010101010101010101010101010;
    #10;
    if (out_ !== 32'b01010101010101010101010101010101) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Random value
    inp = 32'b11001100110011001100110011001100;
    #10;
    if (out_ !== 32'b00110011001100110011001100110011) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: All bits set to 0xFFFFFFFF
    inp = 32'hFFFFFFFF;
    #10;
    if (out_ !== 32'h00000000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule