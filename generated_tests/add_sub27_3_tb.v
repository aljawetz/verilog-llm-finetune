`timescale 1ns/1ps

module tb_add_sub27;

  reg add;
  reg [26:0] opa, opb;
  wire [26:0] sum;
  wire co;

  // Instantiate the module under test (uut)
  add_sub27 uut (
    .add(add),
    .opa(opa),
    .opb(opb),
    .sum(sum),
    .co(co)
  );

  initial begin
    // Test case 1: Addition
    add = 1;
    opa = 27'b00000000000000000000000000001; // 1
    opb = 27'b00000000000000000000000000001; // 1
    #10;
    if (sum !== 27'b00000000000000000000000000010 || co !== 1'b0) begin
      $display("FAIL: Test case 1 failed (Addition)");
      $finish;
    end

    // Test case 2: Addition with carry
    opa = 27'b11111111111111111111111111111; // Max value
    opb = 27'b00000000000000000000000000001; // 1
    #10;
    if (sum !== 27'b00000000000000000000000000000 || co !== 1'b1) begin
      $display("FAIL: Test case 2 failed (Addition with carry)");
      $finish;
    end

    // Test case 3: Subtraction
    add = 0;
    opa = 27'b00000000000000000000000000010; // 2
    opb = 27'b00000000000000000000000000001; // 1
    #10;
    if (sum !== 27'b00000000000000000000000000001 || co !== 1'b0) begin
      $display("FAIL: Test case 3 failed (Subtraction)");
      $finish;
    end

    // Test case 4: Subtraction resulting in negative (borrow)
    opa = 27'b00000000000000000000000000001; // 1
    opb = 27'b00000000000000000000000000010; // 2
    #10;
    if (sum !== 27'b11111111111111111111111111111 || co !== 1'b1) begin
      $display("FAIL: Test case 4 failed (Subtraction with borrow)");
      $finish;
    end

    // Test case 5: Zero addition
    add = 1;
    opa = 27'b00000000000000000000000000000; // 0
    opb = 27'b00000000000000000000000000000; // 0
    #10;
    if (sum !== 27'b00000000000000000000000000000 || co !== 1'b0) begin
      $display("FAIL: Test case 5 failed (Zero addition)");
      $finish;
    end

    // Test case 6: Zero subtraction
    add = 0;
    opa = 27'b00000000000000000000000000000; // 0
    opb = 27'b00000000000000000000000000000; // 0
    #10;
    if (sum !== 27'b00000000000000000000000000000 || co !== 1'b0) begin
      $display("FAIL: Test case 6 failed (Zero subtraction)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule