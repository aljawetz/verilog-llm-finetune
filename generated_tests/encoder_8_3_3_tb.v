`timescale 1ns/1ps

module tb_encoder_8_3;

  reg [7:0] i;
  wire [2:0] o;

  // Instantiate the encoder_8_3 module
  encoder_8_3 uut (
    .o(o),
    .i(i)
  );

  initial begin
    // Test case 1: Input is 8'h01, expected output is 3'b000
    i = 8'h01; #10;
    if (o !== 3'b000) begin
      $display("FAIL: Expected 3'b000 for input 8'h01, got %b", o);
      $finish;
    end

    // Test case 2: Input is 8'h02, expected output is 3'b001
    i = 8'h02; #10;
    if (o !== 3'b001) begin
      $display("FAIL: Expected 3'b001 for input 8'h02, got %b", o);
      $finish;
    end

    // Test case 3: Input is 8'h04, expected output is 3'b010
    i = 8'h04; #10;
    if (o !== 3'b010) begin
      $display("FAIL: Expected 3'b010 for input 8'h04, got %b", o);
      $finish;
    end

    // Test case 4: Input is 8'h08, expected output is 3'b011
    i = 8'h08; #10;
    if (o !== 3'b011) begin
      $display("FAIL: Expected 3'b011 for input 8'h08, got %b", o);
      $finish;
    end

    // Test case 5: Input is 8'h10, expected output is 3'b100
    i = 8'h10; #10;
    if (o !== 3'b100) begin
      $display("FAIL: Expected 3'b100 for input 8'h10, got %b", o);
      $finish;
    end

    // Test case 6: Input is 8'h20, expected output is 3'b101
    i = 8'h20; #10;
    if (o !== 3'b101) begin
      $display("FAIL: Expected 3'b101 for input 8'h20, got %b", o);
      $finish;
    end

    // Test case 7: Input is 8'h40, expected output is 3'b110
    i = 8'h40; #10;
    if (o !== 3'b110) begin
      $display("FAIL: Expected 3'b110 for input 8'h40, got %b", o);
      $finish;
    end

    // Test case 8: Input is 8'h80, expected output is 3'b111
    i = 8'h80; #10;
    if (o !== 3'b111) begin
      $display("FAIL: Expected 3'b111 for input 8'h80, got %b", o);
      $finish;
    end

    // Test case 9: Input is 8'h00, expected output is 3'bxxx
    i = 8'h00; #10;
    if (o !== 3'bxxx) begin
      $display("FAIL: Expected 3'bxxx for input 8'h00, got %b", o);
      $finish;
    end

    // Test case 10: Input is 8'hFF, expected output is 3'bxxx (invalid input)
    i = 8'hFF; #10;
    if (o !== 3'bxxx) begin
      $display("FAIL: Expected 3'bxxx for input 8'hFF, got %b", o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule