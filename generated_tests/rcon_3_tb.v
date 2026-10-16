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
    // Test input 0
    in = 4'h0; #10;
    if (out !== 32'h01000000) begin
      $display("FAIL: Expected 0x01000000 for input 0, got %h", out);
      $finish;
    end

    // Test input 1
    in = 4'h1; #10;
    if (out !== 32'h02000000) begin
      $display("FAIL: Expected 0x02000000 for input 1, got %h", out);
      $finish;
    end

    // Test input 2
    in = 4'h2; #10;
    if (out !== 32'h04000000) begin
      $display("FAIL: Expected 0x04000000 for input 2, got %h", out);
      $finish;
    end

    // Test input 3
    in = 4'h3; #10;
    if (out !== 32'h08000000) begin
      $display("FAIL: Expected 0x08000000 for input 3, got %h", out);
      $finish;
    end

    // Test input 4
    in = 4'h4; #10;
    if (out !== 32'h10000000) begin
      $display("FAIL: Expected 0x10000000 for input 4, got %h", out);
      $finish;
    end

    // Test input 5
    in = 4'h5; #10;
    if (out !== 32'h20000000) begin
      $display("FAIL: Expected 0x20000000 for input 5, got %h", out);
      $finish;
    end

    // Test input 6
    in = 4'h6; #10;
    if (out !== 32'h40000000) begin
      $display("FAIL: Expected 0x40000000 for input 6, got %h", out);
      $finish;
    end

    // Test input 7
    in = 4'h7; #10;
    if (out !== 32'h80000000) begin
      $display("FAIL: Expected 0x80000000 for input 7, got %h", out);
      $finish;
    end

    // Test input 8
    in = 4'h8; #10;
    if (out !== 32'h1b000000) begin
      $display("FAIL: Expected 0x1b000000 for input 8, got %h", out);
      $finish;
    end

    // Test input 9
    in = 4'h9; #10;
    if (out !== 32'h36000000) begin
      $display("FAIL: Expected 0x36000000 for input 9, got %h", out);
      $finish;
    end

    // Test invalid input
    in = 4'hA; #10;
    if (out !== 32'h00000000) begin
      $display("FAIL: Expected 0x00000000 for invalid input A, got %h", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule