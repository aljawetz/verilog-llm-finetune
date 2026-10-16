`timescale 1ns/1ps

module tb_micro_bus_byte;

  // Parameters
  reg clk;
  reg rd_in;
  reg reset;
  reg wr_in;
  reg [1:0] mem_wait;
  reg [15:0] addr_in;
  reg [47:0] mem_rdata;
  reg [7:0] wdata_in;
  
  wire [4:0] mem_cs;
  wire [7:0] rdata_out;
  wire enable;
  wire mem_rd;
  wire mem_wr;
  wire [15:0] mem_addr;
  wire [15:0] mem_wdata;

  // Instantiate the module under test (uut)
  micro_bus_byte uut (
    .clk(clk),
    .rd_in(rd_in),
    .reset(reset),
    .wr_in(wr_in),
    .mem_wait(mem_wait),
    .addr_in(addr_in),
    .mem_rdata(mem_rdata),
    .wdata_in(wdata_in),
    .mem_cs(mem_cs),
    .rdata_out(rdata_out),
    .enable(enable),
    .mem_rd(mem_rd),
    .mem_wr(mem_wr),
    .mem_addr(mem_addr),
    .mem_wdata(mem_wdata)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    rd_in = 0;
    wr_in = 0;
    mem_wait = 2'b00;
    addr_in = 16'h0000;
    mem_rdata = 48'hDEADBEEFCAFE;
    wdata_in = 8'hAA;

    // Release reset
    #10 reset = 0;

    // Test Case 1: Check memory chip select for addr_in = 0x0000
    addr_in = 16'h0000; 
    #10;
    if (mem_cs !== 5'b00001) $display("FAIL: Test Case 1 failed for addr_in = 0x0000");
    
    // Test Case 2: Check memory chip select for addr_in = 0xF000
    addr_in = 16'hF000; 
    #10;
    if (mem_cs !== 5'b00010) $display("FAIL: Test Case 2 failed for addr_in = 0xF000");

    // Test Case 3: Check memory chip select for addr_in = 0xC000
    addr_in = 16'hC000; 
    #10;
    if (mem_cs !== 5'b00100) $display("FAIL: Test Case 3 failed for addr_in = 0xC000");

    // Test Case 4: Check memory chip select for addr_in = 0x8000
    addr_in = 16'h8000; 
    #10;
    if (mem_cs !== 5'b01000) $display("FAIL: Test Case 4 failed for addr_in = 0x8000");

    // Test Case 5: Check memory chip select for addr_in = 0x2000
    addr_in = 16'h2000; 
    #10;
    if (mem_cs !== 5'b10000) $display("FAIL: Test Case 5 failed for addr_in = 0x2000");

    // Test Case 6: Check read data output for addr_in = 0x0000
    addr_in = 16'h0000; 
    rd_in = 1; 
    #10;
    if (rdata_out !== mem_rdata[7:0]) $display("FAIL: Test Case 6 failed for read data");

    // Test Case 7: Check write data output
    addr_in = 16'h0000; 
    wr_in = 1; 
    #10;
    if (mem_wdata !== {wdata_in, wdata_in}) $display("FAIL: Test Case 7 failed for write data");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule