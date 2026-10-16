`timescale 1ns/1ps

module tb_select_unit;

  parameter WIDTH = 8; // Adjust width as needed
  reg [WIDTH+2:0] I1, I3, I5, I7;
  reg [1:0] SEL;
  wire [WIDTH+2:0] IX;

  // Instantiate the module under test
  select_unit #(2, WIDTH) uut (
    .I1(I1),
    .I3(I3),
    .I5(I5),
    .I7(I7),
    .SEL(SEL),
    .IX(IX)
  );

  initial begin
    // Initialize inputs
    I1 = 0; I3 = 0; I5 = 0; I7 = 0; SEL = 0;

    // Test case 1: Select I1
    I1 = 8'hAA; I3 = 8'hBB; I5 = 8'hCC; I7 = 8'hDD; SEL = 2'b00;
    #10;
    if (IX !== I1) begin
      $display("FAIL: Expected IX = %h, got IX = %h for SEL = %b", I1, IX, SEL);
      $finish;
    end

    // Test case 2: Select I3
    SEL = 2'b01;
    #10;
    if (IX !== I3) begin
      $display("FAIL: Expected IX = %h, got IX = %h for SEL = %b", I3, IX, SEL);
      $finish;
    end

    // Test case 3: Select I5
    SEL = 2'b10;
    #10;
    if (IX !== I5) begin
      $display("FAIL: Expected IX = %h, got IX = %h for SEL = %b", I5, IX, SEL);
      $finish;
    end

    // Test case 4: Select I7
    SEL = 2'b11;
    #10;
    if (IX !== I7) begin
      $display("FAIL: Expected IX = %h, got IX = %h for SEL = %b", I7, IX, SEL);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule