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
    // Test case 1: selectBits_i = 3'b000
    selectBits_i = 3'b000;
    #10;
    if (size_o !== 5'b11111) begin
      $display("FAIL: Test case 1 failed, expected 5'b11111 but got %b", size_o);
      $finish;
    end

    // Test case 2: selectBits_i = 3'b001
    selectBits_i = 3'b001;
    #10;
    if (size_o !== 5'd7) begin
      $display("FAIL: Test case 2 failed, expected 5'd7 but got %d", size_o);
      $finish;
    end

    // Test case 3: selectBits_i = 3'b010
    selectBits_i = 3'b010;
    #10;
    if (size_o !== 5'd8) begin
      $display("FAIL: Test case 3 failed, expected 5'd8 but got %d", size_o);
      $finish;
    end

    // Test case 4: selectBits_i = 3'b011
    selectBits_i = 3'b011;
    #10;
    if (size_o !== 5'd12) begin
      $display("FAIL: Test case 4 failed, expected 5'd12 but got %d", size_o);
      $finish;
    end

    // Test case 5: selectBits_i = 3'b100
    selectBits_i = 3'b100;
    #10;
    if (size_o !== 5'd12) begin
      $display("FAIL: Test case 5 failed, expected 5'd12 but got %d", size_o);
      $finish;
    end

    // Test case 6: selectBits_i = 3'b101
    selectBits_i = 3'b101;
    #10;
    if (size_o !== 5'd17) begin
      $display("FAIL: Test case 6 failed, expected 5'd17 but got %d", size_o);
      $finish;
    end

    // Test case 7: selectBits_i = 3'b110 (default case)
    selectBits_i = 3'b110;
    #10;
    if (size_o !== 5'd0) begin
      $display("FAIL: Test case 7 failed, expected 5'd0 but got %d", size_o);
      $finish;
    end

    // Test case 8: selectBits_i = 3'b111 (default case)
    selectBits_i = 3'b111;
    #10;
    if (size_o !== 5'd0) begin
      $display("FAIL: Test case 8 failed, expected 5'd0 but got %d", size_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule