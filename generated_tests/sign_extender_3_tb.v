`timescale 1ns/1ps

module tb_sign_extender;

  reg [7:0] original;
  wire [15:0] sign_extended_original;

  // Instantiate the module under test (uut)
  sign_extender uut (
    .original(original),
    .sign_extended_original(sign_extended_original)
  );

  initial begin
    // Test case 1: Positive number
    original = 8'b01111111; // 127 in decimal
    #10;
    if (sign_extended_original !== 16'b0000000001111111) begin
      $display("FAIL: Test case 1 failed for input 01111111");
      $finish;
    end

    // Test case 2: Negative number
    original = 8'b10000000; // -128 in decimal
    #10;
    if (sign_extended_original !== 16'b1111111110000000) begin
      $display("FAIL: Test case 2 failed for input 10000000");
      $finish;
    end

    // Test case 3: Zero
    original = 8'b00000000; // 0 in decimal
    #10;
    if (sign_extended_original !== 16'b0000000000000000) begin
      $display("FAIL: Test case 3 failed for input 00000000");
      $finish;
    end

    // Test case 4: All ones (negative number)
    original = 8'b11111111; // -1 in decimal
    #10;
    if (sign_extended_original !== 16'b1111111111111111) begin
      $display("FAIL: Test case 4 failed for input 11111111");
      $finish;
    end

    // Test case 5: Mixed value
    original = 8'b00101010; // 42 in decimal
    #10;
    if (sign_extended_original !== 16'b0000000000101010) begin
      $display("FAIL: Test case 5 failed for input 00101010");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule