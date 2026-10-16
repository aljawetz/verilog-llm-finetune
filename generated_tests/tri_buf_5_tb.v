`timescale 1ns/1ps

module tb_tri_buf;
  reg a;
  reg ctrl;
  wire b;

  // Instantiate the tri-state buffer
  tri_buf uut (
    .a(a),
    .ctrl(ctrl),
    .b(b)
  );

  initial begin
    // Test case 1: ctrl is high, a is 1
    ctrl = 1;
    a = 1;
    #10;
    if (b !== 1) begin
      $display("FAIL: Test case 1 failed, expected b=1 but got b=%b", b);
      $finish;
    end

    // Test case 2: ctrl is high, a is 0
    a = 0;
    #10;
    if (b !== 0) begin
      $display("FAIL: Test case 2 failed, expected b=0 but got b=%b", b);
      $finish;
    end

    // Test case 3: ctrl is low, a is 1
    ctrl = 0;
    a = 1;
    #10;
    if (b !== 1'bz) begin
      $display("FAIL: Test case 3 failed, expected b=Z but got b=%b", b);
      $finish;
    end

    // Test case 4: ctrl is low, a is 0
    a = 0;
    #10;
    if (b !== 1'bz) begin
      $display("FAIL: Test case 4 failed, expected b=Z but got b=%b", b);
      $finish;
    end

    // Test case 5: ctrl is toggled back to high
    ctrl = 1;
    a = 1;
    #10;
    if (b !== 1) begin
      $display("FAIL: Test case 5 failed, expected b=1 but got b=%b", b);
      $finish;
    end

    // Test case 6: ctrl is toggled back to low
    ctrl = 0;
    a = 0;
    #10;
    if (b !== 1'bz) begin
      $display("FAIL: Test case 6 failed, expected b=Z but got b=%b", b);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule