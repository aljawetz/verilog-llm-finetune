`timescale 1ns/1ps

module tb_DP_RAM;

  // Parameters
  parameter address_width = 2;
  parameter data_width = 2;

  // Inputs
  reg clk;
  reg we;
  reg re;
  reg [address_width-1:0] address_read;
  reg [address_width-1:0] address_write;
  reg [data_width-1:0] data_in;

  // Outputs
  wire [data_width-1:0] data_out;

  // Instantiate the Unit Under Test (UUT)
  DP_RAM uut (
    .clk(clk),
    .we(we),
    .re(re),
    .address_read(address_read),
    .address_write(address_write),
    .data_in(data_in),
    .data_out(data_out)
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
    re = 0;
    address_read = 0;
    address_write = 0;
    data_in = 0;

    // Wait for global reset
    #10;

    // Test writing to memory
    we = 1; address_write = 2'b00; data_in = 2'b11; // Write 3 to address 0
    #10;
    we = 0; // Disable write

    // Test reading from memory
    re = 1; address_read = 2'b00; // Read from address 0
    #10;
    if (data_out !== 2'b11) begin
      $display("FAIL: Expected data_out = 3 at address 0, got %b", data_out);
      $finish;
    end
    re = 0; // Disable read

    // Test writing to another address
    we = 1; address_write = 2'b01; data_in = 2'b10; // Write 2 to address 1
    #10;
    we = 0; // Disable write

    // Test reading from the new address
    re = 1; address_read = 2'b01; // Read from address 1
    #10;
    if (data_out !== 2'b10) begin
      $display("FAIL: Expected data_out = 2 at address 1, got %b", data_out);
      $finish;
    end
    re = 0; // Disable read

    // Test writing to a third address
    we = 1; address_write = 2'b10; data_in = 2'b01; // Write 1 to address 2
    #10;
    we = 0; // Disable write

    // Test reading from the third address
    re = 1; address_read = 2'b10; // Read from address 2
    #10;
    if (data_out !== 2'b01) begin
      $display("FAIL: Expected data_out = 1 at address 2, got %b", data_out);
      $finish;
    end
    re = 0; // Disable read

    // Final check for an unused address
    re = 1; address_read = 2'b11; // Read from address 3 (should be 0)
    #10;
    if (data_out !== 2'b00) begin
      $display("FAIL: Expected data_out = 0 at address 3, got %b", data_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule