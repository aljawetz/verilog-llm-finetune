`timescale 1ns/1ps

module tb_an2_32;

  reg [31:0] inp1;
  reg [31:0] inp0;
  wire [31:0] out;

  // Instantiate the module under test (uut)
  an2_32 uut (
    .inp1(inp1),
    .inp0(inp0),
    .out(out)
  );

  initial begin
    // Test case 1: Both inputs are all ones
    inp1 = 32'hFFFFFFFF; // 11111111 11111111 11111111 11111111
    inp0 = 32'hFFFFFFFF; // 11111111 11111111 11111111 11111111
    #10;
    if (out !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 1 failed, expected 0xFFFFFFFF, got 0x%h", out);
      $finish;
    end

    // Test case 2: One input is all ones, the other is all zeros
    inp1 = 32'hFFFFFFFF; // 11111111 11111111 11111111 11111111
    inp0 = 32'h00000000; // 00000000 00000000 00000000 00000000
    #10;
    if (out !== 32'h00000000) begin
      $display("FAIL: Test case 2 failed, expected 0x00000000, got 0x%h", out);
      $finish;
    end

    // Test case 3: Random inputs
    inp1 = 32'hA5A5A5A5; // 10100101 10100101 10100101 10100101
    inp0 = 32'h5A5A5A5A; // 01011010 01011010 01011010 01011010
    #10;
    if (out !== 32'h00000000) begin
      $display("FAIL: Test case 3 failed, expected 0x00000000, got 0x%h", out);
      $finish;
    end

    // Test case 4: Mixed inputs
    inp1 = 32'hFF00FF00; // 11111111 00000000 11111111 00000000
    inp0 = 32'h00FF00FF; // 00000000 11111111 00000000 11111111
    #10;
    if (out !== 32'h00000000) begin
      $display("FAIL: Test case 4 failed, expected 0x00000000, got 0x%h", out);
      $finish;
    end

    // Test case 5: All bits set to 0
    inp1 = 32'h00000000; // 00000000 00000000 00000000 00000000
    inp0 = 32'h00000000; // 00000000 00000000 00000000 00000000
    #10;
    if (out !== 32'h00000000) begin
      $display("FAIL: Test case 5 failed, expected 0x00000000, got 0x%h", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule