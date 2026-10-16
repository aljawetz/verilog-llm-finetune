`timescale 1ns/1ps

module tb_mx3_1;

  reg [2:0] inp;
  reg [1:0] sel;
  wire out;

  // Instantiate the module under test (uut)
  mx3_1 uut (
    .inp(inp),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 00, expect out = inp[0]
    inp = 3'b101; sel = 2'b00; #10;
    if (out !== inp[0]) begin
      $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", inp[0], out);
      $finish;
    end

    // Test case 2: sel = 01, expect out = inp[0]
    inp = 3'b110; sel = 2'b01; #10;
    if (out !== inp[0]) begin
      $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", inp[0], out);
      $finish;
    end

    // Test case 3: sel = 10, expect out = inp[1]
    inp = 3'b011; sel = 2'b10; #10;
    if (out !== inp[1]) begin
      $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", inp[1], out);
      $finish;
    end

    // Test case 4: sel = 11, expect out = inp[2]
    inp = 3'b001; sel = 2'b11; #10;
    if (out !== inp[2]) begin
      $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", inp[2], out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule