`timescale 1ns/1ps

module tb_ram_16x64;

  reg clk;
  reg wr;
  reg rd;
  reg [3:0] wr_addr;
  reg [3:0] rd_addr;
  reg [63:0] wr_data;
  wire [63:0] rd_data;

  // Instantiate the module under test (uut)
  ram_16x64 uut (
    .clk(clk),
    .wr(wr),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .rd(rd),
    .rd_addr(rd_addr),
    .rd_data(rd_data)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    wr = 0;
    rd = 0;
    wr_addr = 0;
    rd_addr = 0;
    wr_data = 64'h0;

    // Test 1: Write and read back data
    wr = 1; 
    wr_addr = 4'b0000; 
    wr_data = 64'hDEADBEEFCAFEBABE; 
    #10; // Wait for one clock cycle
    wr = 0; // Disable write

    // Read back the data
    rd = 1; 
    rd_addr = 4'b0000; 
    #10; // Wait for one clock cycle
    rd = 0; // Disable read

    // Check if the read data matches the written data
    if (rd_data !== 64'hDEADBEEFCAFEBABE) begin
      $display("FAIL: Read data does not match written data.");
      $finish;
    end

    // Test 2: Write to another address and read it back
    wr = 1; 
    wr_addr = 4'b0001; 
    wr_data = 64'h1234567890ABCDEF; 
    #10; // Wait for one clock cycle
    wr = 0; // Disable write

    // Read back the data
    rd = 1; 
    rd_addr = 4'b0001; 
    #10; // Wait for one clock cycle
    rd = 0; // Disable read

    // Check if the read data matches the written data
    if (rd_data !== 64'h1234567890ABCDEF) begin
      $display("FAIL: Read data does not match written data for address 1.");
      $finish;
    end

    // Test 3: Write to multiple addresses and read them back
    wr = 1; 
    wr_addr = 4'b0010; 
    wr_data = 64'h1111111111111111; 
    #10; 
    wr_addr = 4'b0011; 
    wr_data = 64'h2222222222222222; 
    #10; 
    wr = 0; // Disable write

    // Read back the data from both addresses
    rd = 1; 
    rd_addr = 4'b0010; 
    #10; 
    if (rd_data !== 64'h1111111111111111) begin
      $display("FAIL: Read data does not match written data for address 2.");
      $finish;
    end

    rd_addr = 4'b0011; 
    #10; 
    if (rd_data !== 64'h2222222222222222) begin
      $display("FAIL: Read data does not match written data for address 3.");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule