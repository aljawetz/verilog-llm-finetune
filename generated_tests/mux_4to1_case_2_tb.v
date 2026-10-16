`timescale 1ns/1ps

module tb_mux_4to1_case;

  // Inputs
  reg [3:0] a;
  reg [3:0] b;
  reg [3:0] c;
  reg [3:0] d;
  reg [1:0] sel;

  // Output
  wire [3:0] out;

  // Instantiate the Unit Under Test (UUT)
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
    a = 4'b0001; // 1
    b = 4'b0010; // 2
    c = 4'b0100; // 4
    d = 4'b1000; // 8
    sel = 2'b00; // Select a

    // Wait for a short time to stabilize
    #10;
    if (out !== a) begin
      $display("FAIL: Output is not equal to a when sel = 00");
      $finish;
    end

    sel = 2'b01; // Select b
    #10;
    if (out !== b) begin
      $display("FAIL: Output is not equal to b when sel = 01");
      $finish;
    end

    sel = 2'b10; // Select c
    #10;
    if (out !== c) begin
      $display("FAIL: Output is not equal to c when sel = 10");
      $finish;
    end

    sel = 2'b11; // Select d
    #10;
    if (out !== d) begin
      $display("FAIL: Output is not equal to d when sel = 11");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule