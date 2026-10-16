`timescale 1ns/1ps

module tb_expbot_muxlimd;

  reg [2:0] safunc;
  wire [1:0] muxlimd;

  // Instantiate the module under test (uut)
  expbot_muxlimd uut (
    .safunc(safunc),
    .muxlimd(muxlimd)
  );

  initial begin
    // Test case 1: safunc = 3'b010
    safunc = 3'b010; // Expect muxlimd = 2'b01
    #10;
    if (muxlimd !== 2'b01) begin
      $display("FAIL: Test case 1 failed, expected 2'b01 but got %b", muxlimd);
      $finish;
    end

    // Test case 2: safunc = 3'b111
    safunc = 3'b111; // Expect muxlimd = 2'b00
    #10;
    if (muxlimd !== 2'b00) begin
      $display("FAIL: Test case 2 failed, expected 2'b00 but got %b", muxlimd);
      $finish;
    end

    // Test case 3: safunc = 3'b000
    safunc = 3'b000; // Expect muxlimd = 2'b10
    #10;
    if (muxlimd !== 2'b10) begin
      $display("FAIL: Test case 3 failed, expected 2'b10 but got %b", muxlimd);
      $finish;
    end

    // Test case 4: safunc = 3'b001
    safunc = 3'b001; // Expect muxlimd = 2'b11
    #10;
    if (muxlimd !== 2'b11) begin
      $display("FAIL: Test case 4 failed, expected 2'b11 but got %b", muxlimd);
      $finish;
    end

    // Test case 5: safunc = 3'b011
    safunc = 3'b011; // Expect muxlimd = 2'b11
    #10;
    if (muxlimd !== 2'b11) begin
      $display("FAIL: Test case 5 failed, expected 2'b11 but got %b", muxlimd);
      $finish;
    end

    // Test case 6: safunc = 3'b101
    safunc = 3'b101; // Expect muxlimd = 2'b11
    #10;
    if (muxlimd !== 2'b11) begin
      $display("FAIL: Test case 6 failed, expected 2'b11 but got %b", muxlimd);
      $finish;
    end

    // Test case 7: safunc = 3'b110
    safunc = 3'b110; // Expect muxlimd = 2'b11
    #10;
    if (muxlimd !== 2'b11) begin
      $display("FAIL: Test case 7 failed, expected 2'b11 but got %b", muxlimd);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule