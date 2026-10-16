`timescale 1ns/1ps

module tb_del1_32;

  reg  [31:0] inp;
  wire [31:0] out;

  // Instantiate the module under test (uut)
  del1_32 uut (
    .inp(inp),
    .out(out)
  );

  initial begin
    // Initialize input
    inp = 32'h00000000;

    // Test case 1: Check with all bits low
    #10;
    if (out !== 32'h00000000) begin
      $display("FAIL: Test case 1 failed, expected 0x00000000, got %h", out);
      $finish;
    end

    // Test case 2: Check with all bits high
    inp = 32'hFFFFFFFF;
    #10;
    if (out !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 2 failed, expected 0xFFFFFFFF, got %h", out);
      $finish;
    end

    // Test case 3: Check with alternating bits
    inp = 32'hAAAAAAAA;
    #10;
    if (out !== 32'hAAAAAAAA) begin
      $display("FAIL: Test case 3 failed, expected 0xAAAAAAAA, got %h", out);
      $finish;
    end

    // Test case 4: Check with a specific pattern
    inp = 32'h12345678;
    #10;
    if (out !== 32'h12345678) begin
      $display("FAIL: Test case 4 failed, expected 0x12345678, got %h", out);
      $finish;
    end

    // Test case 5: Check with zero
    inp = 32'h00000001;
    #10;
    if (out !== 32'h00000001) begin
      $display("FAIL: Test case 5 failed, expected 0x00000001, got %h", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule