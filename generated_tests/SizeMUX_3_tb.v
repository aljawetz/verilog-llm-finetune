`timescale 1ns/1ps

module tb_SizeMUX;

  reg [2:0] selectBits_i;
  wire [4:0] size_o;

  // Instantiate the SizeMUX module
  SizeMUX uut (
    .selectBits_i(selectBits_i),
    .size_o(size_o)
  );

  initial begin
    // Test cases
    selectBits_i = 3'b000; #10;
    if (size_o !== 5'b11111) begin
      $display("FAIL: Expected size_o = 5'b11111 for selectBits_i = 3'b000, got size_o = %b", size_o);
      $finish;
    end

    selectBits_i = 3'b001; #10;
    if (size_o !== 5'd7) begin
      $display("FAIL: Expected size_o = 5'd7 for selectBits_i = 3'b001, got size_o = %d", size_o);
      $finish;
    end

    selectBits_i = 3'b010; #10;
    if (size_o !== 5'd8) begin
      $display("FAIL: Expected size_o = 5'd8 for selectBits_i = 3'b010, got size_o = %d", size_o);
      $finish;
    end

    selectBits_i = 3'b011; #10;
    if (size_o !== 5'd12) begin
      $display("FAIL: Expected size_o = 5'd12 for selectBits_i = 3'b011, got size_o = %d", size_o);
      $finish;
    end

    selectBits_i = 3'b100; #10;
    if (size_o !== 5'd12) begin
      $display("FAIL: Expected size_o = 5'd12 for selectBits_i = 3'b100, got size_o = %d", size_o);
      $finish;
    end

    selectBits_i = 3'b101; #10;
    if (size_o !== 5'd17) begin
      $display("FAIL: Expected size_o = 5'd17 for selectBits_i = 3'b101, got size_o = %d", size_o);
      $finish;
    end

    selectBits_i = 3'b110; #10;
    if (size_o !== 5'd0) begin
      $display("FAIL: Expected size_o = 5'd0 for selectBits_i = 3'b110, got size_o = %d", size_o);
      $finish;
    end

    selectBits_i = 3'b111; #10;
    if (size_o !== 5'd0) begin
      $display("FAIL: Expected size_o = 5'd0 for selectBits_i = 3'b111, got size_o = %d", size_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule