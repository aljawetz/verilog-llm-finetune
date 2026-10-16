`timescale 1ns/1ps

module tb_BCD_E3;

  reg [3:0] b;
  wire [3:0] e;

  // Instantiate the module under test (uut)
  BCD_E3 uut (
    .b(b),
    .e(e)
  );

  initial begin
    // Test case 1: b = 0000 (0 + 3 = 3)
    b = 4'b0000;
    #10;
    if (e !== 4'b0011) begin
      $display("FAIL: Test case 1 failed, expected 0011, got %b", e);
      $finish;
    end

    // Test case 2: b = 0001 (1 + 3 = 4)
    b = 4'b0001;
    #10;
    if (e !== 4'b0100) begin
      $display("FAIL: Test case 2 failed, expected 0100, got %b", e);
      $finish;
    end

    // Test case 3: b = 0010 (2 + 3 = 5)
    b = 4'b0010;
    #10;
    if (e !== 4'b0101) begin
      $display("FAIL: Test case 3 failed, expected 0101, got %b", e);
      $finish;
    end

    // Test case 4: b = 0011 (3 + 3 = 6)
    b = 4'b0011;
    #10;
    if (e !== 4'b0110) begin
      $display("FAIL: Test case 4 failed, expected 0110, got %b", e);
      $finish;
    end

    // Test case 5: b = 0100 (4 + 3 = 7)
    b = 4'b0100;
    #10;
    if (e !== 4'b0111) begin
      $display("FAIL: Test case 5 failed, expected 0111, got %b", e);
      $finish;
    end

    // Test case 6: b = 1000 (8 + 3 = 11, which is 1011 in 4 bits)
    b = 4'b1000;
    #10;
    if (e !== 4'b1011) begin
      $display("FAIL: Test case 6 failed, expected 1011, got %b", e);
      $finish;
    end

    // Test case 7: b = 1111 (15 + 3 = 18, which is 0010 in 4 bits)
    b = 4'b1111;
    #10;
    if (e !== 4'b0010) begin
      $display("FAIL: Test case 7 failed, expected 0010, got %b", e);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule