`timescale 1ns/1ps

module tb_mux4x1;

  // Inputs
  reg [3:0] in;
  reg [1:0] sel;

  // Output
  wire out;

  // Instantiate the module under test (uut)
  mux4x1 uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: Select input 0
    in = 4'b1010; // in = 10
    sel = 2'b00;  // Select in[0]
    #10;
    if (out !== in[0]) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);
      $finish;
    end

    // Test case 2: Select input 1
    sel = 2'b01;  // Select in[1]
    #10;
    if (out !== in[1]) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);
      $finish;
    end

    // Test case 3: Select input 2
    sel = 2'b10;  // Select in[2]
    #10;
    if (out !== in[2]) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);
      $finish;
    end

    // Test case 4: Select input 3
    sel = 2'b11;  // Select in[3]
    #10;
    if (out !== in[3]) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);
      $finish;
    end

    // Test case 5: Check default case (not applicable here but for completeness)
    sel = 2'bxx;  // Invalid selection
    #10;
    if (out !== 1'bx) begin
      $display("FAIL: Test case 5 failed, expected x, got %b", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule