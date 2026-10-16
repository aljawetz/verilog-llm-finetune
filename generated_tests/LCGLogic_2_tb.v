`timescale 1ns/1ps

module testbench;
  reg [3:0] P;
  reg [3:0] G;
  reg cin;
  wire [4:1] C;

  // Instantiate the module under test
  LCGLogic uut (
    .P(P),
    .G(G),
    .cin(cin),
    .C(C)
  );

  initial begin
    // Test case 1: All propagate and generate signals are 0, cin = 0
    P = 4'b0000; G = 4'b0000; cin = 0;
    #10;
    if (C !== 4'b0000) $display("FAIL: Test case 1 failed, expected C = 0000, got C = %b", C);

    // Test case 2: All propagate and generate signals are 1, cin = 0
    P = 4'b1111; G = 4'b1111; cin = 0;
    #10;
    if (C !== 4'b1111) $display("FAIL: Test case 2 failed, expected C = 1111, got C = %b", C);

    // Test case 3: Mixed propagate and generate signals, cin = 1
    P = 4'b1010; G = 4'b0101; cin = 1;
    #10;
    if (C !== 4'b1111) $display("FAIL: Test case 3 failed, expected C = 1111, got C = %b", C);

    // Test case 4: Mixed propagate and generate signals, cin = 0
    P = 4'b1100; G = 4'b0011; cin = 0;
    #10;
    if (C !== 4'b0011) $display("FAIL: Test case 4 failed, expected C = 0011, got C = %b", C);

    // Test case 5: All propagate signals are 1, generate signals are 0, cin = 1
    P = 4'b1111; G = 4'b0000; cin = 1;
    #10;
    if (C !== 4'b1111) $display("FAIL: Test case 5 failed, expected C = 1111, got C = %b", C);

    // Test case 6: Random values
    P = 4'b0110; G = 4'b1001; cin = 0;
    #10;
    if (C !== 4'b1001) $display("FAIL: Test case 6 failed, expected C = 1001, got C = %b", C);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule