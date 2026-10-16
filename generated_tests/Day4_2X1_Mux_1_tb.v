`timescale 1ns/1ps

module tb_Day4_2X1_Mux;

  reg sel;
  reg [1:0] A;
  reg [1:0] B;
  wire [1:0] Out;

  // Instantiate the module under test (uut)
  Day4_2X1_Mux uut (
    .sel(sel),
    .A(A),
    .B(B),
    .Out(Out)
  );

  initial begin
    // Test case 1: sel = 0, expect Out = A
    A = 2'b01; B = 2'b10; sel = 0;
    #10;
    if (Out !== A) begin
      $display("FAIL: Test case 1 failed, expected Out = %b, got Out = %b", A, Out);
      $finish;
    end

    // Test case 2: sel = 1, expect Out = B
    A = 2'b01; B = 2'b10; sel = 1;
    #10;
    if (Out !== B) begin
      $display("FAIL: Test case 2 failed, expected Out = %b, got Out = %b", B, Out);
      $finish;
    end

    // Test case 3: sel = 0, different values for A
    A = 2'b11; B = 2'b00; sel = 0;
    #10;
    if (Out !== A) begin
      $display("FAIL: Test case 3 failed, expected Out = %b, got Out = %b", A, Out);
      $finish;
    end

    // Test case 4: sel = 1, different values for B
    A = 2'b11; B = 2'b00; sel = 1;
    #10;
    if (Out !== B) begin
      $display("FAIL: Test case 4 failed, expected Out = %b, got Out = %b", B, Out);
      $finish;
    end

    // Test case 5: sel = 0, A = 00, B = 11
    A = 2'b00; B = 2'b11; sel = 0;
    #10;
    if (Out !== A) begin
      $display("FAIL: Test case 5 failed, expected Out = %b, got Out = %b", A, Out);
      $finish;
    end

    // Test case 6: sel = 1, A = 00, B = 11
    A = 2'b00; B = 2'b11; sel = 1;
    #10;
    if (Out !== B) begin
      $display("FAIL: Test case 6 failed, expected Out = %b, got Out = %b", B, Out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule