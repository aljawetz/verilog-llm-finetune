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
    clr = 1; // Start with clear
    IR_in = 8'b00000000;

    // Wait for a clock cycle
    #10;

    // Release clear
    clr = 0;

    // Test 1: Load instruction and check opcode and address
    LI = 1; 
    IR_in = 8'b10101010; // Load instruction
    #10; // Wait for clock edge
    LI = 0; // Disable loading

    // Check opcode
    if (IR_Op_code !== 4'b1010) begin
      $display("FAIL: Opcode mismatch, expected 1010, got %b", IR_Op_code);
      $finish;
    end

    // Test 2: Enable address output
    EI = 1; 
    #10; // Wait for clock edge

    // Check address
    if (IR_Add !== 4'b1010) begin
      $display("FAIL: Address mismatch, expected 1010, got %b", IR_Add);
      $finish;
    end

    // Test 3: Disable address output
    EI = 0; 
    #10; // Wait for clock edge

    // Check address should be high impedance
    if (IR_Add !== 4'bz) begin
      $display("FAIL: Address should be high impedance when EI is 0");
      $finish;
    end

    // Test 4: Clear the instruction
    clr = 1; 
    #10; // Wait for clock edge
    clr = 0; // Release clear

    // Check opcode after clear
    if (IR_Op_code !== 4'b0000) begin
      $display("FAIL: Opcode should be 0000 after clear, got %b", IR_Op_code);
      $finish;
    end

    // Test 5: Load new instruction
    LI = 1; 
    IR_in = 8'b11110000; // Load new instruction
    #10; // Wait for clock edge
    LI = 0; // Disable loading

    // Check new opcode
    if (IR_Op_code !== 4'b1111) begin
      $display("FAIL: Opcode mismatch, expected 1111, got %b", IR_Op_code);
      $finish;
    end

    // Check address output
    EI = 1; 
    #10; // Wait for clock edge
    if (IR_Add !== 4'b0000) begin
      $display("FAIL: Address mismatch, expected 0000, got %b", IR_Add);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule