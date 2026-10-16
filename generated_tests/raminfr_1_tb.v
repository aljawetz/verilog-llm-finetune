`timescale 1ns/1ps

module tb_raminfr;

  parameter addr_width = 4;
  parameter data_width = 8;
  parameter depth = 16;

  reg clk;
  reg we;
  reg [addr_width-1:0] a;
  reg [addr_width-1:0] dpra;
  reg [data_width-1:0] di;
  wire [data_width-1:0] dpo;

  // Instantiate the module under test (uut)
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
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    we = 0;
    a = 0;
    dpra = 0;
    di = 0;

    // Wait for a few clock cycles
    #10;

    // Write to address 0
    we = 1;
    a = 2'b00;
    di = 8'hAA; // Write value 0xAA
    #10; // Wait for a clock cycle

    // Read from address 0
    we = 0;
    dpra = 2'b00;
    #10; // Wait for a clock cycle
    if (dpo !== 8'hAA) begin
      $display("FAIL: Expected dpo = 0xAA, got dpo = %h", dpo);
      $finish;
    end

    // Write to address 1
    we = 1;
    a = 2'b01;
    di = 8'hBB; // Write value 0xBB
    #10; // Wait for a clock cycle

    // Read from address 1
    we = 0;
    dpra = 2'b01;
    #10; // Wait for a clock cycle
    if (dpo !== 8'hBB) begin
      $display("FAIL: Expected dpo = 0xBB, got dpo = %h", dpo);
      $finish;
    end

    // Write to address 2
    we = 1;
    a = 2'b10;
    di = 8'hCC; // Write value 0xCC
    #10; // Wait for a clock cycle

    // Read from address 2
    we = 0;
    dpra = 2'b10;
    #10; // Wait for a clock cycle
    if (dpo !== 8'hCC) begin
      $display("FAIL: Expected dpo = 0xCC, got dpo = %h", dpo);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule