`timescale 1ns/1ps

module tb_IR;

  reg LI;
  reg EI;
  reg clk;
  reg clr;
  reg [7:0] IR_in;
  wire [3:0] IR_Add;
  wire [3:0] IR_Op_code;

  // Instantiate the module under test (uut)
  IR uut (
    .LI(LI),
    .EI(EI),
    .clk(clk),
    .clr(clr),
    .IR_in(IR_in),
    .IR_Add(IR_Add),
    .IR_Op_code(IR_Op_code)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    LI = 0;
    EI = 0;
    clr = 0;
    IR_in = 8'b00000000;

    // Test 1: Reset the module
    clr = 1; #10;
    clr = 0; #10;

    // Check that IR_Add and IR_Op_code are zero after reset
    if (IR_Add !== 4'bzz || IR_Op_code !== 4'b0000) begin
      $display("FAIL: Reset did not clear outputs correctly");
      $finish;
    end

    // Test 2: Load IR_in when LI is high
    IR_in = 8'b10101010; // Example input
    LI = 1; #10;
    LI = 0; #10;

    // Check that IR_Op_code is correct
    if (IR_Op_code !== 4'b1010) begin
      $display("FAIL: IR_Op_code is incorrect after loading");
      $finish;
    end

    // Test 3: Check IR_Add when EI is high
    EI = 1; #10;

    // Check that IR_Add reflects the lower 4 bits of IR_in
    if (IR_Add !== 4'b1010) begin
      $display("FAIL: IR_Add is incorrect when EI is high");
      $finish;
    end

    // Test 4: Check IR_Add when EI is low
    EI = 0; #10;

    // Check that IR_Add is high impedance when EI is low
    if (IR_Add !== 4'bz) begin
      $display("FAIL: IR_Add is not high impedance when EI is low");
      $finish;
    end

    // Test 5: Ensure that IR_in is not loaded when LI is low
    IR_in = 8'b11110000; // New input
    #10; // Wait for clock edge

    // Check that IR_Op_code remains unchanged
    if (IR_Op_code !== 4'b1010) begin
      $display("FAIL: IR_Op_code changed when LI is low");
      $finish;
    end

    // Test 6: Clear the module again
    clr = 1; #10;
    clr = 0; #10;

    // Check that IR_Add and IR_Op_code are zero after reset
    if (IR_Add !== 4'bzz || IR_Op_code !== 4'b0000) begin
      $display("FAIL: Reset did not clear outputs correctly");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule