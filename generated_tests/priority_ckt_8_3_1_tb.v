`timescale 1ns/1ps

module tb_priority_ckt_8_3;

  reg [7:0] i;
  wire [7:0] h;
  wire idle;

  // Instantiate the Unit Under Test (UUT)
  priority_ckt_8_3 uut (
    .i(i),
    .h(h),
    .idle(idle)
  );

  initial begin
    // Test case 1: All inputs low
    i = 8'b00000000; #10;
    if (h !== 8'b00000000 || idle !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Only the least significant bit is high
    i = 8'b00000001; #10;
    if (h !== 8'b00000001 || idle !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Only the second least significant bit is high
    i = 8'b00000010; #10;
    if (h !== 8'b00000010 || idle !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Middle bit high
    i = 8'b00010000; #10;
    if (h !== 8'b00010000 || idle !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Most significant bit high
    i = 8'b10000000; #10;
    if (h !== 8'b10000000 || idle !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Multiple bits high (should still prioritize)
    i = 8'b11000000; #10;
    if (h !== 8'b10000000 || idle !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: All bits high
    i = 8'b11111111; #10;
    if (h !== 8'b10000000 || idle !== 0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: Random pattern
    i = 8'b10101010; #10;
    if (h !== 8'b10000000 || idle !== 0) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule