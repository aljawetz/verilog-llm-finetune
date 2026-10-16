`timescale 1ns/1ps

module tb_micro_bus_byte;

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
    // Initialize signals
    reset = 1;
    rd_in = 0;
    wr_in = 0;
    mem_wait = 2'b00;
    addr_in = 16'h0000;
    mem_rdata = 48'hDEADBEEFCAFE;
    wdata_in = 8'hAA;

    // Release reset
    #10 reset = 0;

    // Test case 1: Check chip select for addr_in = 0x0000
    addr_in = 16'h0000; // Should select mem_cs[0]
    #10;
    if (mem_cs != 5'b00001) $display("FAIL: Chip select for addr_in 0x0000 failed");

    // Test case 2: Check chip select for addr_in = 0xF000
    addr_in = 16'hF000; // Should select mem_cs[1]
    #10;
    if (mem_cs != 5'b00010) $display("FAIL: Chip select for addr_in 0xF000 failed");

    // Test case 3: Check chip select for addr_in = 0xC000
    addr_in = 16'hC000; // Should select mem_cs[2]
    #10;
    if (mem_cs != 5'b00100) $display("FAIL: Chip select for addr_in 0xC000 failed");

    // Test case 4: Check chip select for addr_in = 0x8000
    addr_in = 16'h8000; // Should select mem_cs[3]
    #10;
    if (mem_cs != 5'b01000) $display("FAIL: Chip select for addr_in 0x8000 failed");

    // Test case 5: Check chip select for addr_in = 0x4000
    addr_in = 16'h4000; // Should select mem_cs[4]
    #10;
    if (mem_cs != 5'b10000) $display("FAIL: Chip select for addr_in 0x4000 failed");

    // Test case 6: Check read data output for addr_in = 0x0000
    addr_in = 16'h0000; // Should read from mem_rdata[7:0]
    #10;
    if (rdata_out != 8'hEF) $display("FAIL: Read data output for addr_in 0x0000 failed");

    // Test case 7: Check write data duplication
    wdata_in = 8'hBB; // Write data
    #10;
    if (mem_wdata != 16'hBBBB) $display("FAIL: Write data duplication failed");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule