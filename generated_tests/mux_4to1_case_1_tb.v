`timescale 1ns/1ps

module tb_mux_4to1_case;

  reg [3:0] a;
  reg [3:0] b;
  reg [3:0] c;
  reg [3:0] d;
  reg [1:0] sel;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  mux_4to1_case uut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Initialize inputs
    a = 4'b0001; // Input a
    b = 4'b0010; // Input b
    c = 4'b0100; // Input c
    d = 4'b1000; // Input d

    // Test case 1: Select input a
    sel = 2'b00;
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", a, out);
      $finish;
    end

    // Test case 2: Select input b
    sel = 2'b01;
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", b, out);
      $finish;
    end

    // Test case 3: Select input c
    sel = 2'b10;
    #10;
    if (out !== c) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", c, out);
      $finish;
    end

    // Test case 4: Select input d
    sel = 2'b11;
    #10;
    if (out !== d) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", d, out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule