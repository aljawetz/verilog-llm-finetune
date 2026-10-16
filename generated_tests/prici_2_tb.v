`timescale 1ns/1ps

module tb_prici;

  reg [7:0] i;
  wire [7:0] h;
  wire idle;

  // Instantiate the module under test (uut)
  prici uut (
    .i(i),
    .h(h),
    .idle(idle)
  );

  initial begin
    // Test case 1: All bits are zero
    i = 8'b00000000; #10;
    if (h !== 8'b00000000 || idle !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Only the least significant bit is set
    i = 8'b00000001; #10;
    if (h !== 8'b00000001 || idle !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Only the second least significant bit is set
    i = 8'b00000010; #10;
    if (h !== 8'b00000010 || idle !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Only the most significant bit is set
    i = 8'b10000000; #10;
    if (h !== 8'b10000000 || idle !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Middle bit set
    i = 8'b00100000; #10;
    if (h !== 8'b00100000 || idle !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Multiple bits set, only the MSB should be passed
    i = 8'b01100000; #10;
    if (h !== 8'b01000000 || idle !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: All bits set
    i = 8'b11111111; #10;
    if (h !== 8'b10000000 || idle !== 0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule