`timescale 1ns/1ps

module tb_raminfr;

  // Parameters
  parameter addr_width = 2;
  parameter data_width = 2;
  
  // Inputs
  reg clk;
  reg we;
  reg [addr_width-1:0] a;
  reg [addr_width-1:0] dpra;
  reg [data_width-1:0] di;

  // Outputs
  wire [data_width-1:0] dpo;

  // Instantiate the Unit Under Test (UUT)
  raminfr uut (
    .clk(clk),
    .we(we),
    .a(a),
    .dpra(dpra),
    .di(di),
    .dpo(dpo)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    we = 0;
    a = 0;
    dpra = 0;
    di = 0;

    // Wait for global reset
    #10;

    // Test 1: Write to address 0 and read from address 0
    we = 1; a = 2'b00; di = 2'b11; 
    #10; // Wait for one clock cycle
    we = 0; dpra = 2'b00; 
    #10; // Wait for one clock cycle
    if (dpo !== 2'b11) begin
      $display("FAIL: Expected dpo = 2'b11, got dpo = %b", dpo);
      $finish;
    end

    // Test 2: Write to address 1 and read from address 1
    we = 1; a = 2'b01; di = 2'b10; 
    #10; // Wait for one clock cycle
    we = 0; dpra = 2'b01; 
    #10; // Wait for one clock cycle
    if (dpo !== 2'b10) begin
      $display("FAIL: Expected dpo = 2'b10, got dpo = %b", dpo);
      $finish;
    end

    // Test 3: Write to address 2 and read from address 0
    we = 1; a = 2'b10; di = 2'b01; 
    #10; // Wait for one clock cycle
    we = 0; dpra = 2'b00; 
    #10; // Wait for one clock cycle
    if (dpo !== 2'b11) begin
      $display("FAIL: Expected dpo = 2'b11, got dpo = %b", dpo);
      $finish;
    end

    // Test 4: Read from address 2
    we = 0; dpra = 2'b10; 
    #10; // Wait for one clock cycle
    if (dpo !== 2'b01) begin
      $display("FAIL: Expected dpo = 2'b01, got dpo = %b", dpo);
      $finish;
    end

    // Test 5: Write to address 3 and read from address 3
    we = 1; a = 2'b11; di = 2'b00; 
    #10; // Wait for one clock cycle
    we = 0; dpra = 2'b11; 
    #10; // Wait for one clock cycle
    if (dpo !== 2'b00) begin
      $display("FAIL: Expected dpo = 2'b00, got dpo = %b", dpo);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule