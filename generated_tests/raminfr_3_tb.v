`timescale 1ns/1ps

module tb_raminfr;

  parameter addr_width = 2;
  parameter data_width = 2;
  parameter depth = 4;

  reg clk;
  reg we;
  reg [addr_width-1:0] a;
  reg [addr_width-1:0] dpra;
  reg [data_width-1:0] di;
  wire [data_width-1:0] dpo;

  // Instantiate the module under test
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
    we = 1; a = 2'b00; di = 2'b11; // Write 3 to address 0
    #10;
    we = 0; dpra = 2'b00; // Read from address 0
    #10;
    if (dpo !== 2'b11) begin
      $display("FAIL: Expected dpo = 3 at address 0, got %b", dpo);
      $finish;
    end

    // Test 2: Write to address 1 and read from address 1
    we = 1; a = 2'b01; di = 2'b10; // Write 2 to address 1
    #10;
    we = 0; dpra = 2'b01; // Read from address 1
    #10;
    if (dpo !== 2'b10) begin
      $display("FAIL: Expected dpo = 2 at address 1, got %b", dpo);
      $finish;
    end

    // Test 3: Write to address 2 and read from address 2
    we = 1; a = 2'b10; di = 2'b01; // Write 1 to address 2
    #10;
    we = 0; dpra = 2'b10; // Read from address 2
    #10;
    if (dpo !== 2'b01) begin
      $display("FAIL: Expected dpo = 1 at address 2, got %b", dpo);
      $finish;
    end

    // Test 4: Write to address 3 and read from address 3
    we = 1; a = 2'b11; di = 2'b00; // Write 0 to address 3
    #10;
    we = 0; dpra = 2'b11; // Read from address 3
    #10;
    if (dpo !== 2'b00) begin
      $display("FAIL: Expected dpo = 0 at address 3, got %b", dpo);
      $finish;
    end

    // Test 5: Read from an uninitialized address (address 0)
    dpra = 2'b00; // Read from address 0 again
    #10;
    if (dpo !== 2'b11) begin
      $display("FAIL: Expected dpo = 3 at address 0, got %b", dpo);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule