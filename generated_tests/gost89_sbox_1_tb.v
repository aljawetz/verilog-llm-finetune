`timescale 1ns/1ps

module tb_gost89_sbox;

  reg [63:0] sbox;
  reg [3:0] in;
  wire [3:0] out;

  // Instantiate the Unit Under Test (UUT)
  gost89_sbox uut (
    .sbox(sbox),
    .in(in),
    .out(out)
  );

  initial begin
    // Initialize sbox with some values
    sbox = 64'h0123456789ABCDEF;

    // Test all input values
    in = 4'h0; #10;
    if (out !== sbox[63:60]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[63:60], out, in);
      $finish;
    end

    in = 4'h1; #10;
    if (out !== sbox[59:56]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[59:56], out, in);
      $finish;
    end

    in = 4'h2; #10;
    if (out !== sbox[55:52]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[55:52], out, in);
      $finish;
    end

    in = 4'h3; #10;
    if (out !== sbox[51:48]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[51:48], out, in);
      $finish;
    end

    in = 4'h4; #10;
    if (out !== sbox[47:44]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[47:44], out, in);
      $finish;
    end

    in = 4'h5; #10;
    if (out !== sbox[43:40]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[43:40], out, in);
      $finish;
    end

    in = 4'h6; #10;
    if (out !== sbox[39:36]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[39:36], out, in);
      $finish;
    end

    in = 4'h7; #10;
    if (out !== sbox[35:32]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[35:32], out, in);
      $finish;
    end

    in = 4'h8; #10;
    if (out !== sbox[31:28]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[31:28], out, in);
      $finish;
    end

    in = 4'h9; #10;
    if (out !== sbox[27:24]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[27:24], out, in);
      $finish;
    end

    in = 4'hA; #10;
    if (out !== sbox[23:20]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[23:20], out, in);
      $finish;
    end

    in = 4'hB; #10;
    if (out !== sbox[19:16]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[19:16], out, in);
      $finish;
    end

    in = 4'hC; #10;
    if (out !== sbox[15:12]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[15:12], out, in);
      $finish;
    end

    in = 4'hD; #10;
    if (out !== sbox[11:8]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[11:8], out, in);
      $finish;
    end

    in = 4'hE; #10;
    if (out !== sbox[7:4]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[7:4], out, in);
      $finish;
    end

    in = 4'hF; #10;
    if (out !== sbox[3:0]) begin
      $display("FAIL: Expected %h, got %h for input %h", sbox[3:0], out, in);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule