`timescale 1ns/1ps

module tb_rcon;

  reg [3:0] in;
  wire [31:0] out;

  // Instantiate the module under test (uut)
  rcon uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test cases
    in = 4'h0; #10;
    if (out !== 32'h01000000) begin
      $display("FAIL: Expected 0x01000000 for input 0x0, got %h", out);
      $finish;
    end

    in = 4'h1; #10;
    if (out !== 32'h02000000) begin
      $display("FAIL: Expected 0x02000000 for input 0x1, got %h", out);
      $finish;
    end

    in = 4'h2; #10;
    if (out !== 32'h04000000) begin
      $display("FAIL: Expected 0x04000000 for input 0x2, got %h", out);
      $finish;
    end

    in = 4'h3; #10;
    if (out !== 32'h08000000) begin
      $display("FAIL: Expected 0x08000000 for input 0x3, got %h", out);
      $finish;
    end

    in = 4'h4; #10;
    if (out !== 32'h10000000) begin
      $display("FAIL: Expected 0x10000000 for input 0x4, got %h", out);
      $finish;
    end

    in = 4'h5; #10;
    if (out !== 32'h20000000) begin
      $display("FAIL: Expected 0x20000000 for input 0x5, got %h", out);
      $finish;
    end

    in = 4'h6; #10;
    if (out !== 32'h40000000) begin
      $display("FAIL: Expected 0x40000000 for input 0x6, got %h", out);
      $finish;
    end

    in = 4'h7; #10;
    if (out !== 32'h80000000) begin
      $display("FAIL: Expected 0x80000000 for input 0x7, got %h", out);
      $finish;
    end

    in = 4'h8; #10;
    if (out !== 32'h1b000000) begin
      $display("FAIL: Expected 0x1b000000 for input 0x8, got %h", out);
      $finish;
    end

    in = 4'h9; #10;
    if (out !== 32'h36000000) begin
      $display("FAIL: Expected 0x36000000 for input 0x9, got %h", out);
      $finish;
    end

    in = 4'hA; #10; // Test default case
    if (out !== 32'h00000000) begin
      $display("FAIL: Expected 0x00000000 for input 0xA, got %h", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule