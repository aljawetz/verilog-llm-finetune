`timescale 1ns/1ps

module tb_priority_ckt_4_2;

  reg [3:0] i;
  wire [3:0] h;
  wire idle;

  // Instantiate the module under test (uut)
  priority_ckt_4_2 uut (
    .i(i),
    .h(h),
    .idle(idle)
  );

  initial begin
    // Test case 1: All inputs low
    i = 4'b0000; #10;
    if (h !== 4'b0000 || idle !== 1) begin
      $display("FAIL: Test case 1 failed (All inputs low)");
      $finish;
    end

    // Test case 2: Only the least significant bit is high
    i = 4'b0001; #10;
    if (h !== 4'b0001 || idle !== 0) begin
      $display("FAIL: Test case 2 failed (Only LSB high)");
      $finish;
    end

    // Test case 3: Second bit is high
    i = 4'b0010; #10;
    if (h !== 4'b0010 || idle !== 0) begin
      $display("FAIL: Test case 3 failed (Second bit high)");
      $finish;
    end

    // Test case 4: Third bit is high
    i = 4'b0100; #10;
    if (h !== 4'b0100 || idle !== 0) begin
      $display("FAIL: Test case 4 failed (Third bit high)");
      $finish;
    end

    // Test case 5: Most significant bit is high
    i = 4'b1000; #10;
    if (h !== 4'b1000 || idle !== 0) begin
      $display("FAIL: Test case 5 failed (MSB high)");
      $finish;
    end

    // Test case 6: Multiple bits high (highest priority should be selected)
    i = 4'b1100; #10;
    if (h !== 4'b1000 || idle !== 0) begin
      $display("FAIL: Test case 6 failed (Multiple bits high)");
      $finish;
    end

    // Test case 7: All bits high
    i = 4'b1111; #10;
    if (h !== 4'b1000 || idle !== 0) begin
      $display("FAIL: Test case 7 failed (All bits high)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule