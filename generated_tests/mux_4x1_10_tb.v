`timescale 1ns/1ps

module tb_mux_4x1;

  reg [3:0] in;
  reg [1:0] sel;
  wire out;

  // Instantiate the module under test (uut)
  mux_4x1 uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: Select input 0
    in = 4'b1010; // Input vector
    sel = 2'b00; // Select line for input 0
    #10;
    if (out !== in[0]) $display("FAIL: Test case 1 failed, expected %b but got %b", in[0], out);

    // Test case 2: Select input 1
    sel = 2'b01; // Select line for input 1
    #10;
    if (out !== in[1]) $display("FAIL: Test case 2 failed, expected %b but got %b", in[1], out);

    // Test case 3: Select input 2
    sel = 2'b10; // Select line for input 2
    #10;
    if (out !== in[2]) $display("FAIL: Test case 3 failed, expected %b but got %b", in[2], out);

    // Test case 4: Select input 3
    sel = 2'b11; // Select line for input 3
    #10;
    if (out !== in[3]) $display("FAIL: Test case 4 failed, expected %b but got %b", in[3], out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule