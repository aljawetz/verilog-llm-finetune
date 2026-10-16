`timescale 1ns/1ps

module tb_shiftre;

  reg [7:0] D;
  reg load;
  reg shiftR;
  reg lin;
  reg clk;
  reg reset_n;
  wire [7:0] Q;

  // Instantiate the module under test (uut)
  shiftre #(8) uut (
    .D(D),
    .load(load),
    .shiftR(shiftR),
    .lin(lin),
    .clk(clk),
    .reset_n(reset_n),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset_n = 0;
    load = 0;
    shiftR = 0;
    lin = 0;
    D = 8'b00000000;

    // Apply reset
    #10 reset_n = 1;

    // Test loading data
    D = 8'b10101010; 
    load = 1; 
    #10 load = 0; 
    if (Q !== 8'b10101010) begin
      $display("FAIL: Load operation failed");
      $finish;
    end

    // Test shifting right with lin
    lin = 1; 
    shiftR = 1; 
    #10 shiftR = 0; 
    if (Q !== 8'b11010101) begin
      $display("FAIL: Shift right operation failed");
      $finish;
    end

    // Test shifting right without lin
    lin = 0; 
    shiftR = 1; 
    #10 shiftR = 0; 
    if (Q !== 8'b01101010) begin
      $display("FAIL: Shift right operation without lin failed");
      $finish;
    end

    // Test reset functionality
    reset_n = 0; 
    #10 reset_n = 1; 
    if (Q !== 8'b00000000) begin
      $display("FAIL: Reset operation failed");
      $finish;
    end

    // Final check
    D = 8'b11111111; 
    load = 1; 
    #10 load = 0; 
    lin = 1; 
    shiftR = 1; 
    #10 shiftR = 0; 
    if (Q !== 8'b11111111) begin
      $display("FAIL: Final check failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule