`timescale 1ns/1ps

module tb_Sqrt_range;

  reg [5:0] exp_f;
  reg [5:0] LZD_Sqrt;
  reg [20:0] y_f;
  wire [20:0] f_temp;

  // Instantiate the module under test
  Sqrt_range uut (
    .exp_f(exp_f),
    .LZD_Sqrt(LZD_Sqrt),
    .y_f(y_f),
    .f_temp(f_temp)
  );

  initial begin
    // Test case 1: exp_f[0] = 0, LZD_Sqrt = 10, y_f = 100000
    exp_f = 6'b000000; LZD_Sqrt = 6'b001010; y_f = 21'b000000110000000000000; // 100000 in binary
    #10;
    if (f_temp !== (y_f >> 1)) $display("FAIL: Test case 1 failed, expected %b, got %b", (y_f >> 1), f_temp);

    // Test case 2: exp_f[0] = 1, LZD_Sqrt = 10, y_f = 100000
    exp_f = 6'b000001; LZD_Sqrt = 6'b001010; y_f = 21'b000000110000000000000; // 100000 in binary
    #10;
    if (f_temp !== (y_f << 1)) $display("FAIL: Test case 2 failed, expected %b, got %b", (y_f << 1), f_temp);

    // Test case 3: exp_f[0] = 0, LZD_Sqrt = 5, y_f = 100000
    exp_f = 6'b000000; LZD_Sqrt = 6'b000101; y_f = 21'b000000110000000000000; // 100000 in binary
    #10;
    if (f_temp !== (y_f >> 0)) $display("FAIL: Test case 3 failed, expected %b, got %b", (y_f >> 0), f_temp);

    // Test case 4: exp_f[0] = 1, LZD_Sqrt = 5, y_f = 100000
    exp_f = 6'b000001; LZD_Sqrt = 6'b000101; y_f = 21'b000000110000000000000; // 100000 in binary
    #10;
    if (f_temp !== (y_f << 0)) $display("FAIL: Test case 4 failed, expected %b, got %b", (y_f << 0), f_temp);

    // Test case 5: exp_f[0] = 0, LZD_Sqrt = 12, y_f = 100000
    exp_f = 6'b000000; LZD_Sqrt = 6'b001100; y_f = 21'b000000110000000000000; // 100000 in binary
    #10;
    if (f_temp !== (y_f >> 3)) $display("FAIL: Test case 5 failed, expected %b, got %b", (y_f >> 3), f_temp);

    // Test case 6: exp_f[0] = 1, LZD_Sqrt = 12, y_f = 100000
    exp_f = 6'b000001; LZD_Sqrt = 6'b001100; y_f = 21'b000000110000000000000; // 100000 in binary
    #10;
    if (f_temp !== (y_f << 3)) $display("FAIL: Test case 6 failed, expected %b, got %b", (y_f << 3), f_temp);

    $display("PASS");
    $finish;
  end

endmodule