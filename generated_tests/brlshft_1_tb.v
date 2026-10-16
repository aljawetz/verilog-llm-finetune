`timescale 1ns/1ps

module tb_brlshft;

  reg l_r;
  reg rot;
  reg sv0;
  reg sv1;
  reg [3:0] in;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  brlshft uut (
    .l_r(l_r),
    .rot(rot),
    .sv0(sv0),
    .sv1(sv1),
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: No shift, input should be the same
    l_r = 1'b1; rot = 1'b0; sv0 = 1'b0; sv1 = 1'b0; in = 4'b1010; #10;
    if (out !== 4'b1010) $display("FAIL: Test case 1 failed"); 

    // Test case 2: Left shift by 1
    l_r = 1'b1; rot = 1'b0; sv0 = 1'b1; sv1 = 1'b0; in = 4'b1010; #10;
    if (out !== 4'b0100) $display("FAIL: Test case 2 failed"); 

    // Test case 3: Right shift by 1
    l_r = 1'b0; rot = 1'b0; sv0 = 1'b1; sv1 = 1'b0; in = 4'b1010; #10;
    if (out !== 4'b0101) $display("FAIL: Test case 3 failed"); 

    // Test case 4: Left rotate by 1
    l_r = 1'b1; rot = 1'b1; sv0 = 1'b1; sv1 = 1'b0; in = 4'b1010; #10;
    if (out !== 4'b0101) $display("FAIL: Test case 4 failed"); 

    // Test case 5: Right rotate by 1
    l_r = 1'b0; rot = 1'b1; sv0 = 1'b1; sv1 = 1'b0; in = 4'b1010; #10;
    if (out !== 4'b0101) $display("FAIL: Test case 5 failed"); 

    // Test case 6: Left shift by 2
    l_r = 1'b1; rot = 1'b0; sv0 = 1'b0; sv1 = 1'b1; in = 4'b1010; #10;
    if (out !== 4'b1000) $display("FAIL: Test case 6 failed"); 

    // Test case 7: Right shift by 2
    l_r = 1'b0; rot = 1'b0; sv0 = 1'b0; sv1 = 1'b1; in = 4'b1010; #10;
    if (out !== 4'b0010) $display("FAIL: Test case 7 failed"); 

    // Test case 8: Left rotate by 2
    l_r = 1'b1; rot = 1'b1; sv0 = 1'b0; sv1 = 1'b1; in = 4'b1010; #10;
    if (out !== 4'b0101) $display("FAIL: Test case 8 failed"); 

    // Test case 9: Right rotate by 2
    l_r = 1'b0; rot = 1'b1; sv0 = 1'b0; sv1 = 1'b1; in = 4'b1010; #10;
    if (out !== 4'b1010) $display("FAIL: Test case 9 failed"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule