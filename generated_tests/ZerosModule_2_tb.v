`timescale 1ns/1ps

module tb_ZerosModule;

  reg [15:0] data_i;
  wire flag_o;
  wire [16:0] codeword_o;

  // Instantiate the module under test (uut)
  ZerosModule uut (
    .data_i(data_i),
    .flag_o(flag_o),
    .codeword_o(codeword_o)
  );

  initial begin
    // Test case 1: Check all zeros input
    data_i = 16'h0000; // Input is all zeros
    #10; // Wait for output
    if (flag_o !== 1'b1 || codeword_o !== 17'h1ffff) begin
      $display("FAIL: Test case 1 failed for input 0x0000");
      $finish;
    end

    // Test case 2: Check non-zero input
    data_i = 16'h1234; // Non-zero input
    #10; // Wait for output
    if (flag_o !== 1'b0 || codeword_o !== {1'b0, 16'h1234}) begin
      $display("FAIL: Test case 2 failed for input 0x1234");
      $finish;
    end

    // Test case 3: Check another non-zero input
    data_i = 16'hFFFF; // Another non-zero input
    #10; // Wait for output
    if (flag_o !== 1'b0 || codeword_o !== {1'b0, 16'hFFFF}) begin
      $display("FAIL: Test case 3 failed for input 0xFFFF");
      $finish;
    end

    // Test case 4: Check another zero input
    data_i = 16'h0000; // Input is all zeros again
    #10; // Wait for output
    if (flag_o !== 1'b1 || codeword_o !== 17'h1ffff) begin
      $display("FAIL: Test case 4 failed for input 0x0000");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule