`timescale 1ns/1ps

module tb_enc;

  reg [3:0] I;
  wire [1:0] y;
  wire v;

  // Instantiate the module under test
  enc uut (
    .I(I),
    .y(y),
    .v(v)
  );

  initial begin
    // Test case 1: Input is 4'b0001
    I = 4'b0001; #10;
    if (y !== 2'b00 || v !== 1'b1) begin
      $display("FAIL: Test case 1 failed. Expected y=2'b00, v=1'b1, got y=%b, v=%b", y, v);
      $finish;
    end

    // Test case 2: Input is 4'b0010
    I = 4'b0010; #10;
    if (y !== 2'b01 || v !== 1'b1) begin
      $display("FAIL: Test case 2 failed. Expected y=2'b01, v=1'b1, got y=%b, v=%b", y, v);
      $finish;
    end

    // Test case 3: Input is 4'b0100
    I = 4'b0100; #10;
    if (y !== 2'b10 || v !== 1'b1) begin
      $display("FAIL: Test case 3 failed. Expected y=2'b10, v=1'b1, got y=%b, v=%b", y, v);
      $finish;
    end

    // Test case 4: Input is 4'b1000
    I = 4'b1000; #10;
    if (y !== 2'b11 || v !== 1'b1) begin
      $display("FAIL: Test case 4 failed. Expected y=2'b11, v=1'b1, got y=%b, v=%b", y, v);
      $finish;
    end

    // Test case 5: Input is 4'b0000 (no one-hot condition)
    I = 4'b0000; #10;
    if (y !== 2'b00 || v !== 1'b0) begin
      $display("FAIL: Test case 5 failed. Expected y=2'b00, v=1'b0, got y=%b, v=%b", y, v);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule