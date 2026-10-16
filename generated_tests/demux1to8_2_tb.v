`timescale 1ns/1ps

module tb_demux1to8;

  reg in;
  reg [2:0] sel;
  wire [7:0] y;

  // Instantiate the demux1to8 module
  demux1to8 uut (
    .in(in),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Test case 1: Select 0, input 1
    in = 1;
    sel = 3'b000;
    #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Select 1, input 1
    sel = 3'b001;
    #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Select 2, input 1
    sel = 3'b010;
    #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Select 3, input 1
    sel = 3'b011;
    #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Select 4, input 1
    sel = 3'b100;
    #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Select 5, input 1
    sel = 3'b101;
    #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: Select 6, input 1
    sel = 3'b110;
    #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: Select 7, input 1
    sel = 3'b111;
    #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // Test case 9: Select 0, input 0
    in = 0;
    sel = 3'b000;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 9 failed");
      $finish;
    end

    // Test case 10: Select 1, input 0
    sel = 3'b001;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 10 failed");
      $finish;
    end

    // Test case 11: Select 2, input 0
    sel = 3'b010;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 11 failed");
      $finish;
    end

    // Test case 12: Select 3, input 0
    sel = 3'b011;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 12 failed");
      $finish;
    end

    // Test case 13: Select 4, input 0
    sel = 3'b100;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 13 failed");
      $finish;
    end

    // Test case 14: Select 5, input 0
    sel = 3'b101;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 14 failed");
      $finish;
    end

    // Test case 15: Select 6, input 0
    sel = 3'b110;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 15 failed");
      $finish;
    end

    // Test case 16: Select 7, input 0
    sel = 3'b111;
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 16 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule