`timescale 1ns/1ps

module tb_mux_81;
  reg [7:0] i;
  reg [2:0] s;
  wire y;

  // Instantiate the module under test (uut)
  mux_81 uut (
    .i(i),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select 0, expect y = i[0]
    i = 8'b10101010; s = 3'b000; #10;
    if (y !== i[0]) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", i[0], y);
      $finish;
    end

    // Test case 2: Select 1, expect y = i[1]
    s = 3'b001; #10;
    if (y !== i[1]) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", i[1], y);
      $finish;
    end

    // Test case 3: Select 2, expect y = i[2]
    s = 3'b010; #10;
    if (y !== i[2]) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", i[2], y);
      $finish;
    end

    // Test case 4: Select 3, expect y = i[3]
    s = 3'b011; #10;
    if (y !== i[3]) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", i[3], y);
      $finish;
    end

    // Test case 5: Select 4, expect y = i[4]
    s = 3'b100; #10;
    if (y !== i[4]) begin
      $display("FAIL: Test case 5 failed, expected %b, got %b", i[4], y);
      $finish;
    end

    // Test case 6: Select 5, expect y = i[5]
    s = 3'b101; #10;
    if (y !== i[5]) begin
      $display("FAIL: Test case 6 failed, expected %b, got %b", i[5], y);
      $finish;
    end

    // Test case 7: Select 6, expect y = i[6]
    s = 3'b110; #10;
    if (y !== i[6]) begin
      $display("FAIL: Test case 7 failed, expected %b, got %b", i[6], y);
      $finish;
    end

    // Test case 8: Select 7, expect y = i[7]
    s = 3'b111; #10;
    if (y !== i[7]) begin
      $display("FAIL: Test case 8 failed, expected %b, got %b", i[7], y);
      $finish;
    end

    // Test case 9: Default case, expect high impedance (not directly testable)
    s = 3'bxxx; #10; // Invalid select
    if (y !== 1'bz) begin
      $display("FAIL: Default case failed, expected high impedance, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule