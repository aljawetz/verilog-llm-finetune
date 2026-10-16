`timescale 1ns/1ps

module tb_mux;
  reg [7:0] in;
  reg [2:0] sel;
  wire out;

  // Instantiate the module under test (uut)
  mux uut (
    .in(in),
    .out(out),
    .sel(sel)
  );

  initial begin
    // Test case 1: Select 0
    in = 8'b10101010; // Input pattern
    sel = 3'b000;    // Select first bit
    #10;
    if (out !== in[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);

    // Test case 2: Select 1
    sel = 3'b001;    // Select second bit
    #10;
    if (out !== in[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);

    // Test case 3: Select 2
    sel = 3'b010;    // Select third bit
    #10;
    if (out !== in[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);

    // Test case 4: Select 3
    sel = 3'b011;    // Select fourth bit
    #10;
    if (out !== in[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);

    // Test case 5: Select 4
    sel = 3'b100;    // Select fifth bit
    #10;
    if (out !== in[4]) $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], out);

    // Test case 6: Select 5
    sel = 3'b101;    // Select sixth bit
    #10;
    if (out !== in[5]) $display("FAIL: Test case 6 failed, expected %b, got %b", in[5], out);

    // Test case 7: Select 6
    sel = 3'b110;    // Select seventh bit
    #10;
    if (out !== in[6]) $display("FAIL: Test case 7 failed, expected %b, got %b", in[6], out);

    // Test case 8: Select 7
    sel = 3'b111;    // Select eighth bit
    #10;
    if (out !== in[7]) $display("FAIL: Test case 8 failed, expected %b, got %b", in[7], out);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule