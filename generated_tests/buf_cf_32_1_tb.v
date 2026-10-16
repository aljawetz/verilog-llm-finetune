`timescale 1ns/1ps

module tb_buf_cf_32;

  reg [31:0] inp;
  wire [31:0] out;

  // Instantiate the module under test
  buf_cf_32 uut (
    .inp(inp),
    .out(out)
  );

  initial begin
    // Test case 1: Check with all bits set to 0
    inp = 32'h00000000; 
    #10;
    if (out !== 32'h00000000) begin
      $display("FAIL: Test case 1 failed, expected 0x00000000, got %h", out);
      $finish;
    end

    // Test case 2: Check with all bits set to 1
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

    // Test case 4: Check with a pattern
    inp = 32'h12345678; 
    #10;
    if (out !== 32'h12345678) begin
      $display("FAIL: Test case 4 failed, expected 0x12345678, got %h", out);
      $finish;
    end

    // Test case 5: Check with all bits set to 0x5A
    inp = 32'h5A5A5A5A; 
    #10;
    if (out !== 32'h5A5A5A5A) begin
      $display("FAIL: Test case 5 failed, expected 0x5A5A5A5A, got %h", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule