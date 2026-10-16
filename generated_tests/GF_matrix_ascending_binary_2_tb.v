`timescale 1ns/1ps

module tb_GF_matrix_ascending_binary;

  reg clk;
  reg re;
  reg [1:0] address_read;
  wire [7:0] data_out;

  // Instantiate the module under test (uut)
  GF_matrix_ascending_binary uut (
    .clk(clk),
    .re(re),
    .address_read(address_read),
    .data_out(data_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    re = 0; // Initially disable read
    address_read = 2'b00; // Start with address 0

    // Wait for a few clock cycles
    #10;

    // Enable read and check data at address 0
    re = 1;
    #10;
    if (data_out !== 8'b11111111) begin
      $display("FAIL: Expected data_out at address 0 to be 11111111, got %b", data_out);
      $finish;
    end

    // Check data at address 1
    address_read = 2'b01;
    #10;
    if (data_out !== 8'b00000000) begin
      $display("FAIL: Expected data_out at address 1 to be 00000000, got %b", data_out);
      $finish;
    end

    // Check data at address 2
    address_read = 2'b10;
    #10;
    if (data_out !== 8'b00000001) begin
      $display("FAIL: Expected data_out at address 2 to be 00000001, got %b", data_out);
      $finish;
    end

    // Check data at address 3
    address_read = 2'b11;
    #10;
    if (data_out !== 8'b00011001) begin
      $display("FAIL: Expected data_out at address 3 to be 00011001, got %b", data_out);
      $finish;
    end

    // Check with different addresses
    address_read = 2'b00; // Address 0
    #10;
    if (data_out !== 8'b11111111) begin
      $display("FAIL: Expected data_out at address 0 to be 11111111, got %b", data_out);
      $finish;
    end

    address_read = 2'b01; // Address 1
    #10;
    if (data_out !== 8'b00000000) begin
      $display("FAIL: Expected data_out at address 1 to be 00000000, got %b", data_out);
      $finish;
    end

    // Disable read and check that data_out does not change
    re = 0;
    #10;
    if (data_out !== 8'b00000000) begin
      $display("FAIL: Expected data_out to remain unchanged when re is low, got %b", data_out);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule