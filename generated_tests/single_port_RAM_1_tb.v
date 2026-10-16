`timescale 1ns/1ps

module tb_single_port_RAM;

  // Parameters
  parameter DATA_WIDTH = 8;
  parameter ADD_WIDTH = 8;
  
  // Inputs
  reg [DATA_WIDTH-1:0] data;
  reg [ADD_WIDTH-1:0] addr;
  reg write_ena;
  reg clk;
  
  // Outputs
  wire [DATA_WIDTH-1:0] q;
  
  // Instantiate the Unit Under Test (UUT)
  single_port_RAM #(DATA_WIDTH, ADD_WIDTH) uut (
    .data(data),
    .addr(addr),
    .write_ena(write_ena),
    .clk(clk),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    data = 8'b0;
    addr = 8'b0;
    write_ena = 0;

    // Wait for global reset
    #10;

    // Test 1: Write to address 0
    addr = 8'd0;
    data = 8'hAA; // Write 0xAA
    write_ena = 1;
    #10; // Wait for one clock cycle
    write_ena = 0; // Disable write

    // Test 2: Read from address 0
    addr = 8'd0;
    #10; // Wait for one clock cycle
    if (q !== 8'hAA) begin
      $display("FAIL: Expected q = 0xAA, got q = %h", q);
      $finish;
    end

    // Test 3: Write to address 1
    addr = 8'd1;
    data = 8'h55; // Write 0x55
    write_ena = 1;
    #10; // Wait for one clock cycle
    write_ena = 0; // Disable write

    // Test 4: Read from address 1
    addr = 8'd1;
    #10; // Wait for one clock cycle
    if (q !== 8'h55) begin
      $display("FAIL: Expected q = 0x55, got q = %h", q);
      $finish;
    end

    // Test 5: Read from address 0 again
    addr = 8'd0;
    #10; // Wait for one clock cycle
    if (q !== 8'hAA) begin
      $display("FAIL: Expected q = 0xAA, got q = %h", q);
      $finish;
    end

    // Test 6: Write to address 2
    addr = 8'd2;
    data = 8'hFF; // Write 0xFF
    write_ena = 1;
    #10; // Wait for one clock cycle
    write_ena = 0; // Disable write

    // Test 7: Read from address 2
    addr = 8'd2;
    #10; // Wait for one clock cycle
    if (q !== 8'hFF) begin
      $display("FAIL: Expected q = 0xFF, got q = %h", q);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule