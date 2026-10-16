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
    IR_in = 8'b0;

    // Test 1: Clear the latch
    clr = 1; #10;
    clr = 0; #10;
    if (IR_Op_code !== 4'b0000 || IR_Add !== 4'bz) begin
      $display("FAIL: Clear did not reset outputs correctly");
      $finish;
    end

    // Test 2: Load instruction
    LI = 1; IR_in = 8'b10101010; #10;
    LI = 0; #10;
    if (IR_Op_code !== 4'b1010) begin
      $display("FAIL: Opcode not loaded correctly");
      $finish;
    end

    // Test 3: Check address output when enabled
    EI = 1; #10;
    if (IR_Add !== 4'b1010) begin
      $display("FAIL: Address output incorrect when enabled");
      $finish;
    end

    // Test 4: Check address output when disabled
    EI = 0; #10;
    if (IR_Add !== 4'bz) begin
      $display("FAIL: Address output should be high impedance when disabled");
      $finish;
    end

    // Test 5: Load another instruction
    LI = 1; IR_in = 8'b11001100; #10;
    LI = 0; #10;
    if (IR_Op_code !== 4'b1100) begin
      $display("FAIL: Opcode not loaded correctly on second instruction");
      $finish;
    end

    // Test 6: Check address output again when enabled
    EI = 1; #10;
    if (IR_Add !== 4'b1100) begin
      $display("FAIL: Address output incorrect for second instruction when enabled");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule