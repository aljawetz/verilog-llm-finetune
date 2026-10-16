`timescale 1ns/1ps

module tb_compar_r;

  reg [31:0] a;
  reg [31:0] b;
  wire gr;
  wire lo;
  wire eq;

  // Instantiate the module under test
  compar_r uut (
    .a(a),
    .b(b),
    .gr(gr),
    .lo(lo),
    .eq(eq)
  );

  initial begin
    // Test case 1: a > b
    a = 32'h00000005; // 5
    b = 32'h00000003; // 3
    #10;
    if (gr !== 1'b1 || lo !== 1'b0 || eq !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a < b
    a = 32'h00000002; // 2
    b = 32'h00000004; // 4
    #10;
    if (gr !== 1'b0 || lo !== 1'b1 || eq !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a == b
    a = 32'h00000007; // 7
    b = 32'h00000007; // 7
    #10;
    if (gr !== 1'b0 || lo !== 1'b0 || eq !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a > b (negative numbers)
    a = 32'hFFFFFFFB; // -5
    b = 32'hFFFFFFFD; // -3
    #10;
    if (gr !== 1'b0 || lo !== 1'b1 || eq !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a < b (negative numbers)
    a = 32'hFFFFFFFD; // -3
    b = 32'hFFFFFFFB; // -5
    #10;
    if (gr !== 1'b1 || lo !== 1'b0 || eq !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a == b (negative numbers)
    a = 32'hFFFFFFFC; // -4
    b = 32'hFFFFFFFC; // -4
    #10;
    if (gr !== 1'b0 || lo !== 1'b0 || eq !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule