`timescale 1ns/1ps

module tb_gpcfg_rd;

  reg rd_en;
  reg [31:0] rd_addr;
  reg [31:0] wdata;
  wire [31:0] rdata;

  // Instantiate the module under test (uut)
  gpcfg_rd uut (
    .rd_en(rd_en),
    .rd_addr(rd_addr),
    .wdata(wdata),
    .rdata(rdata)
  );

  initial begin
    // Initialize inputs
    rd_en = 0;
    rd_addr = 32'b0;
    wdata = 32'b0;

    // Test case 1: Read disabled, expect rdata to be 0
    rd_en = 0;
    rd_addr = 16'h0; // CFG_ADDR
    wdata = 32'hA5A5A5A5;
    #10;
    if (rdata !== 32'b0) begin
      $display("FAIL: Test case 1 failed, expected rdata = 0, got rdata = %h", rdata);
      $finish;
    end

    // Test case 2: Read enabled, address matches CFG_ADDR, expect rdata to be wdata
    rd_en = 1;
    rd_addr = 16'h0; // CFG_ADDR
    wdata = 32'hA5A5A5A5;
    #10;
    if (rdata !== wdata) begin
      $display("FAIL: Test case 2 failed, expected rdata = %h, got rdata = %h", wdata, rdata);
      $finish;
    end

    // Test case 3: Read enabled, address does not match CFG_ADDR, expect rdata to be 0
    rd_en = 1;
    rd_addr = 16'h1; // Not CFG_ADDR
    wdata = 32'hA5A5A5A5;
    #10;
    if (rdata !== 32'b0) begin
      $display("FAIL: Test case 3 failed, expected rdata = 0, got rdata = %h", rdata);
      $finish;
    end

    // Test case 4: Read enabled, address matches CFG_ADDR with different wdata
    rd_en = 1;
    rd_addr = 16'h0; // CFG_ADDR
    wdata = 32'h5A5A5A5A;
    #10;
    if (rdata !== wdata) begin
      $display("FAIL: Test case 4 failed, expected rdata = %h, got rdata = %h", wdata, rdata);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule