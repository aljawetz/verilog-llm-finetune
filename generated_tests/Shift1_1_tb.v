`timescale 1ns/1ps

module tb_Shift1;

  reg [31:0] data_i;
  wire [31:0] data_o;

  // Instantiate the module under test (uut)
  Shift1 uut (
    .data_i(data_i),
    .data_o(data_o)
  );

  initial begin
    // Test case 1: Shift a value with all bits set
    data_i = 32'hFFFFFFFF; // Input: 11111111111111111111111111111111
    #10;
    if (data_o !== 32'hFFFFFFFE) begin
      $display("FAIL: Test case 1 failed. Expected 0xFFFFFFFE, got 0x%h", data_o);
      $finish;
    end

    // Test case 2: Shift a value with only the MSB set
    data_i = 32'h80000000; // Input: 10000000000000000000000000000000
    #10;
    if (data_o !== 32'h00000000) begin
      $display("FAIL: Test case 2 failed. Expected 0x00000000, got 0x%h", data_o);
      $finish;
    end

    // Test case 3: Shift a value with a single bit set in the middle
    data_i = 32'h00000004; // Input: 00000000000000000000000000000100
    #10;
    if (data_o !== 32'h00000008) begin
      $display("FAIL: Test case 3 failed. Expected 0x00000008, got 0x%h", data_o);
      $finish;
    end

    // Test case 4: Shift a value with the least significant bit set
    data_i = 32'h00000001; // Input: 00000000000000000000000000000001
    #10;
    if (data_o !== 32'h00000002) begin
      $display("FAIL: Test case 4 failed. Expected 0x00000002, got 0x%h", data_o);
      $finish;
    end

    // Test case 5: Shift a value with all bits cleared
    data_i = 32'h00000000; // Input: 00000000000000000000000000000000
    #10;
    if (data_o !== 32'h00000000) begin
      $display("FAIL: Test case 5 failed. Expected 0x00000000, got 0x%h", data_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule