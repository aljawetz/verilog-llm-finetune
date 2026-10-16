`timescale 1ns/1ps

module tb_dec24_al;

  // Inputs
  reg i0;
  reg i1;

  // Outputs
  wire o0;
  wire o1;
  wire o2;
  wire o3;

  // Instantiate the Unit Under Test (UUT)
  dec24_al uut (
    .i0(i0),
    .i1(i1),
    .o0(o0),
    .o1(o1),
    .o2(o2),
    .o3(o3)
  );

  initial begin
    // Test all combinations of inputs
    // Expected outputs: 
    // i0 i1 | o0 o1 o2 o3
    //  0  0 |  0  1  1  1
    //  0  1 |  1  1  0  1
    //  1  0 |  1  0  1  1
    //  1  1 |  1  1  1  0

    // Test case 1: i0 = 0, i1 = 0
    i0 = 0; i1 = 0; #10;
    if (!(~o0 && o1 && o2 && o3)) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: i0 = 0, i1 = 1
    i0 = 0; i1 = 1; #10;
    if (!(o0 && o1 && ~o2 && o3)) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: i0 = 1, i1 = 0
    i0 = 1; i1 = 0; #10;
    if (!(o0 && ~o1 && o2 && o3)) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: i0 = 1, i1 = 1
    i0 = 1; i1 = 1; #10;
    if (!(o0 && o1 && o2 && ~o3)) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule