`timescale 1ns/1ps

module tb_restoring_division;

  reg [7:0] d1;
  reg [7:0] d2;
  wire [7:0] q;
  wire [7:0] r;

  restoring_division uut (
    .d1(d1),
    .d2(d2),
    .q(q),
    .r(r)
  );

  initial begin
    // Test case 1: 20 / 4
    d1 = 8'd20; 
    d2 = 8'd4; 
    #10;
    if (q !== 8'd5 || r !== 8'd0) begin
      $display("FAIL: Test case 1 failed (20 / 4)");
      $finish;
    end

    // Test case 2: 15 / 3
    d1 = 8'd15; 
    d2 = 8'd3; 
    #10;
    if (q !== 8'd5 || r !== 8'd0) begin
      $display("FAIL: Test case 2 failed (15 / 3)");
      $finish;
    end

    // Test case 3: 10 / 2
    d1 = 8'd10; 
    d2 = 8'd2; 
    #10;
    if (q !== 8'd5 || r !== 8'd0) begin
      $display("FAIL: Test case 3 failed (10 / 2)");
      $finish;
    end

    // Test case 4: 7 / 2
    d1 = 8'd7; 
    d2 = 8'd2; 
    #10;
    if (q !== 8'd3 || r !== 8'd1) begin
      $display("FAIL: Test case 4 failed (7 / 2)");
      $finish;
    end

    // Test case 5: 0 / 1
    d1 = 8'd0; 
    d2 = 8'd1; 
    #10;
    if (q !== 8'd0 || r !== 8'd0) begin
      $display("FAIL: Test case 5 failed (0 / 1)");
      $finish;
    end

    // Test case 6: 255 / 1
    d1 = 8'd255; 
    d2 = 8'd1; 
    #10;
    if (q !== 8'd255 || r !== 8'd0) begin
      $display("FAIL: Test case 6 failed (255 / 1)");
      $finish;
    end

    // Test case 7: 100 / 3
    d1 = 8'd100; 
    d2 = 8'd3; 
    #10;
    if (q !== 8'd33 || r !== 8'd1) begin
      $display("FAIL: Test case 7 failed (100 / 3)");
      $finish;
    end

    // Test case 8: 50 / 7
    d1 = 8'd50; 
    d2 = 8'd7; 
    #10;
    if (q !== 8'd7 || r !== 8'd1) begin
      $display("FAIL: Test case 8 failed (50 / 7)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule