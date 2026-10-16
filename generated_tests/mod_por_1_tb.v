`timescale 1ns/1ps

module tb_mod_por;

  reg [1:0] sel;
  reg [31:0] in0, in1, in2, in3;
  wire [31:0] out;

  // Instantiate the module under test (uut)
  mod_por uut (
    .sel(sel),
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out(out)
  );

  initial begin
    // Initialize inputs
    in0 = 32'hAAAA5555;
    in1 = 32'h5555AAAA;
    in2 = 32'hFFFFFFFF;
    in3 = 32'h00000000;

    // Test case 1: sel = 00
    sel = 2'b00;
    #10;
    if (out !== in0) begin
      $display("FAIL: Expected %h, got %h for sel = %b", in0, out, sel);
      $finish;
    end

    // Test case 2: sel = 01
    sel = 2'b01;
    #10;
    if (out !== in1) begin
      $display("FAIL: Expected %h, got %h for sel = %b", in1, out, sel);
      $finish;
    end

    // Test case 3: sel = 10
    sel = 2'b10;
    #10;
    if (out !== in2) begin
      $display("FAIL: Expected %h, got %h for sel = %b", in2, out, sel);
      $finish;
    end

    // Test case 4: sel = 11
    sel = 2'b11;
    #10;
    if (out !== in3) begin
      $display("FAIL: Expected %h, got %h for sel = %b", in3, out, sel);
      $finish;
    end

    // Test case 5: sel = 00 (default case)
    sel = 2'bxx; // Invalid case
    #10;
    if (out !== 32'h00000000) begin
      $display("FAIL: Expected 00000000, got %h for sel = %b", out, sel);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule