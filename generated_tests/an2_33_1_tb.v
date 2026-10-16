`timescale 1ns/1ps

module tb_an2_33;

  reg [32:0] inp1;
  reg [32:0] inp0;
  wire [32:0] out;

  // Instantiate the module under test
  an2_33 uut (
    .inp1(inp1),
    .inp0(inp0),
    .out(out)
  );

  initial begin
    // Test case 1: Both inputs are all ones
    inp1 = 33'hFFFFFFFF;
    inp0 = 33'hFFFFFFFF;
    #10;
    if (out !== 33'hFFFFFFFF) begin
      $display("FAIL: Test case 1 failed, expected FFFFFFFF, got %h", out);
      $finish;
    end

    // Test case 2: One input is all ones, the other is all zeros
    inp1 = 33'hFFFFFFFF;
    inp0 = 33'h00000000;
    #10;
    if (out !== 33'h00000000) begin
      $display("FAIL: Test case 2 failed, expected 00000000, got %h", out);
      $finish;
    end

    // Test case 3: Random inputs
    inp1 = 33'hA5A5A5A5;
    inp0 = 33'h5A5A5A5A;
    #10;
    if (out !== 33'h00000000) begin
      $display("FAIL: Test case 3 failed, expected 00000000, got %h", out);
      $finish;
    end

    // Test case 4: Mixed inputs
    inp1 = 33'hFFFFFFFF;
    inp0 = 33'h12345678;
    #10;
    if (out !== 33'h12345678) begin
      $display("FAIL: Test case 4 failed, expected 12345678, got %h", out);
      $finish;
    end

    // Test case 5: All zeros
    inp1 = 33'h00000000;
    inp0 = 33'h00000000;
    #10;
    if (out !== 33'h00000000) begin
      $display("FAIL: Test case 5 failed, expected 00000000, got %h", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule