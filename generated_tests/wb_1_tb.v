`timescale 1ns/1ps

module tb_wb;

  reg [15:0] MemIn;
  reg [15:0] PcIn;
  reg [15:0] ALUIn;
  reg [1:0] RegSrc;
  wire [15:0] WB;

  // Instantiate the module under test (uut)
  wb uut (
    .MemIn(MemIn),
    .PcIn(PcIn),
    .ALUIn(ALUIn),
    .RegSrc(RegSrc),
    .WB(WB)
  );

  initial begin
    // Test case 1: Select PcIn
    MemIn = 16'hAAAA; 
    PcIn = 16'hBBBB; 
    ALUIn = 16'hCCCC; 
    RegSrc = 2'b00; 
    #10;
    if (WB !== PcIn) begin
      $display("FAIL: Test case 1 failed, expected WB = %h, got WB = %h", PcIn, WB);
      $finish;
    end

    // Test case 2: Select MemIn
    RegSrc = 2'b01; 
    #10;
    if (WB !== MemIn) begin
      $display("FAIL: Test case 2 failed, expected WB = %h, got WB = %h", MemIn, WB);
      $finish;
    end

    // Test case 3: Select ALUIn
    RegSrc = 2'b10; 
    #10;
    if (WB !== ALUIn) begin
      $display("FAIL: Test case 3 failed, expected WB = %h, got WB = %h", ALUIn, WB);
      $finish;
    end

    // Test case 4: Check for invalid RegSrc (should default to ALUIn)
    RegSrc = 2'b11; 
    #10;
    if (WB !== ALUIn) begin
      $display("FAIL: Test case 4 failed, expected WB = %h, got WB = %h", ALUIn, WB);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule