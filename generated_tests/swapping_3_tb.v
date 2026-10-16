`timescale 1ns/1ps

module tb_swapping;

  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] a_out;
  wire [7:0] b_out;

  // Instantiate the module under test (uut)
  swapping uut (
    .a(a),
    .b(b),
    .a_out(a_out),
    .b_out(b_out)
  );

  initial begin
    // Test case 1: Swap two different values
    a = 8'hAA; // 170 in decimal
    b = 8'h55; // 85 in decimal
    #10; // Wait for a short time
    if (a_out !== b || b_out !== a) begin
      $display("FAIL: Test case 1 failed. Expected a_out=%h, b_out=%h but got a_out=%h, b_out=%h", b, a, a_out, b_out);
      $finish;
    end

    // Test case 2: Swap two equal values
    a = 8'hFF; // 255 in decimal
    b = 8'hFF; // 255 in decimal
    #10; // Wait for a short time
    if (a_out !== b || b_out !== a) begin
      $display("FAIL: Test case 2 failed. Expected a_out=%h, b_out=%h but got a_out=%h, b_out=%h", b, a, a_out, b_out);
      $finish;
    end

    // Test case 3: Swap zero and a value
    a = 8'h00; // 0 in decimal
    b = 8'h1A; // 26 in decimal
    #10; // Wait for a short time
    if (a_out !== b || b_out !== a) begin
      $display("FAIL: Test case 3 failed. Expected a_out=%h, b_out=%h but got a_out=%h, b_out=%h", b, a, a_out, b_out);
      $finish;
    end

    // Test case 4: Swap maximum and minimum values
    a = 8'h00; // 0 in decimal
    b = 8'hFF; // 255 in decimal
    #10; // Wait for a short time
    if (a_out !== b || b_out !== a) begin
      $display("FAIL: Test case 4 failed. Expected a_out=%h, b_out=%h but got a_out=%h, b_out=%h", b, a, a_out, b_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule