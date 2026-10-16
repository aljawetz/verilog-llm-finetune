`timescale 1ns/1ps

module tb_rggen_address_decoder;

  // Parameters
  parameter READABLE      = 1'b1;
  parameter WRITABLE      = 1'b1;
  parameter WIDTH         = 8;
  parameter BUS_WIDTH     = 32;
  parameter START_ADDRESS = 8'h00;
  parameter BYTE_SIZE     = 4;

  // Inputs
  reg [WIDTH-1:0] i_address;
  reg [1:0]       i_access;
  reg             i_additional_match;

  // Outputs
  wire            o_match;

  // Instantiate the Unit Under Test (UUT)
  rggen_address_decoder #(
    .READABLE(READABLE),
    .WRITABLE(WRITABLE),
    .WIDTH(WIDTH),
    .BUS_WIDTH(BUS_WIDTH),
    .START_ADDRESS(START_ADDRESS),
    .BYTE_SIZE(BYTE_SIZE)
  ) uut (
    .i_address(i_address),
    .i_access(i_access),
    .i_additional_match(i_additional_match),
    .o_match(o_match)
  );

  initial begin
    // Test case 1: Address within range, read access, additional match
    i_address = 8'h02;
    i_access = 2'b00; // Read
    i_additional_match = 1'b1;
    #10;
    if (o_match !== 1'b1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Address within range, write access, additional match
    i_address = 8'h03;
    i_access = 2'b01; // Write
    i_additional_match = 1'b1;
    #10;
    if (o_match !== 1'b1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Address out of range, additional match
    i_address = 8'h10;
    i_access = 2'b00; // Read
    i_additional_match = 1'b1;
    #10;
    if (o_match !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Address within range, no additional match
    i_address = 8'h02;
    i_access = 2'b00; // Read
    i_additional_match = 1'b0;
    #10;
    if (o_match !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Address within range, write access, no additional match
    i_address = 8'h03;
    i_access = 2'b01; // Write
    i_additional_match = 1'b0;
    #10;
    if (o_match !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Address at the boundary of range
    i_address = 8'h00;
    i_access = 2'b00; // Read
    i_additional_match = 1'b1;
    #10;
    if (o_match !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: Address just outside the boundary of range
    i_address = 8'h04;
    i_access = 2'b00; // Read
    i_additional_match = 1'b1;
    #10;
    if (o_match !== 1'b0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule