`timescale 1ns/1ps

module tb_reg_file;

  reg clk;
  reg rst;
  reg [1:0] readAddr1;
  reg [1:0] readAddr2;
  reg [1:0] writeAddr;
  reg writeEn;
  reg [31:0] writeData;
  wire [31:0] readData1;
  wire [31:0] readData2;

  // Instantiate the module under test (uut)
  reg_file uut (
    .clk(clk),
    .rst(rst),
    .readAddr1(readAddr1),
    .readAddr2(readAddr2),
    .writeAddr(writeAddr),
    .writeEn(writeEn),
    .writeData(writeData),
    .readData1(readData1),
    .readData2(readData2)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    writeEn = 0;
    writeData = 32'h0;
    readAddr1 = 2'b00;
    readAddr2 = 2'b01;
    writeAddr = 2'b00;

    // Reset the register file
    #10;
    rst = 0;

    // Test writing to register 0
    writeAddr = 2'b00;
    writeData = 32'hA5A5A5A5;
    writeEn = 1;
    #10;
    writeEn = 0;

    // Check readData1 and readData2
    readAddr1 = 2'b00; // Read from register 0
    readAddr2 = 2'b01; // Read from register 1
    #10;

    if (readData1 !== 32'hA5A5A5A5) begin
      $display("FAIL: readData1 did not match expected value");
      $finish;
    end

    if (readData2 !== 32'h00000000) begin
      $display("FAIL: readData2 did not match expected value");
      $finish;
    end

    // Test writing to register 1
    writeAddr = 2'b01;
    writeData = 32'h5A5A5A5A;
    writeEn = 1;
    #10;
    writeEn = 0;

    // Check readData1 and readData2 again
    readAddr1 = 2'b01; // Read from register 1
    readAddr2 = 2'b00; // Read from register 0
    #10;

    if (readData1 !== 32'h5A5A5A5A) begin
      $display("FAIL: readData1 did not match expected value after writing to register 1");
      $finish;
    end

    if (readData2 !== 32'hA5A5A5A5) begin
      $display("FAIL: readData2 did not match expected value after writing to register 1");
      $finish;
    end

    // Test reset functionality
    rst = 1;
    #10;
    rst = 0;

    // Check that all registers are reset
    readAddr1 = 2'b00;
    readAddr2 = 2'b01;
    #10;

    if (readData1 !== 32'h00000000) begin
      $display("FAIL: readData1 did not match expected value after reset");
      $finish;
    end

    if (readData2 !== 32'h00000000) begin
      $display("FAIL: readData2 did not match expected value after reset");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule