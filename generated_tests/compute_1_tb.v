`timescale 1ns/1ps

module tb_compute;

  reg [7:0] d_in;
  reg [7:0] d_hold;
  wire [7:0] op0;
  wire [7:0] op1;
  wire [7:0] op2;
  wire [7:0] op3;
  wire [7:0] op4;
  wire [7:0] op5;
  wire [7:0] op6;
  wire [7:0] op7;

  // Instantiate the module under test
  compute #(8) uut (
    .d_in(d_in),
    .d_hold(d_hold),
    .op0(op0),
    .op1(op1),
    .op2(op2),
    .op3(op3),
    .op4(op4),
    .op5(op5),
    .op6(op6),
    .op7(op7)
  );

  initial begin
    // Test sequence
    d_in = 8'b00001111; // Test input
    d_hold = 8'b10101010; // Hold value

    // Wait for a small time to stabilize
    #10;

    // Check outputs
    if (op0 !== 8'b00011110) begin
      $display("FAIL: op0 is incorrect");
      $finish;
    end
    if (op1 !== 8'b00000111) begin
      $display("FAIL: op1 is incorrect");
      $finish;
    end
    if (op2 !== 8'b00111100) begin
      $display("FAIL: op2 is incorrect");
      $finish;
    end
    if (op3 !== 8'b00000011) begin
      $display("FAIL: op3 is incorrect");
      $finish;
    end
    if (op4 !== 8'b00011110) begin
      $display("FAIL: op4 is incorrect");
      $finish;
    end
    if (op5 !== 8'b10000111) begin
      $display("FAIL: op5 is incorrect");
      $finish;
    end
    if (op6 !== 8'b10101010) begin
      $display("FAIL: op6 is incorrect");
      $finish;
    end
    if (op7 !== 8'b00000000) begin
      $display("FAIL: op7 is incorrect");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule