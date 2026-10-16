`timescale 1ns/1ps

module tb_e203_extend_csr;

  // Parameters
  reg nice_csr_valid;
  wire nice_csr_ready;
  reg [31:0] nice_csr_addr;
  reg nice_csr_wr;
  reg [31:0] nice_csr_wdata;
  wire [31:0] nice_csr_rdata;
  reg clk;
  reg rst_n;

  // Instantiate the Unit Under Test (UUT)
  e203_extend_csr uut (
    .nice_csr_valid(nice_csr_valid),
    .nice_csr_ready(nice_csr_ready),
    .nice_csr_addr(nice_csr_addr),
    .nice_csr_wr(nice_csr_wr),
    .nice_csr_wdata(nice_csr_wdata),
    .nice_csr_rdata(nice_csr_rdata),
    .clk(clk),
    .rst_n(rst_n)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Reset generation
  initial begin
    rst_n = 0;
    #15;
    rst_n = 1;
  end

  // Test sequence
  initial begin
    // Wait for reset to be released
    @(posedge rst_n);
    
    // Test 1: Check that nice_csr_ready is always high
    nice_csr_valid = 1;
    nice_csr_addr = 32'h00000000;
    nice_csr_wr = 0;
    nice_csr_wdata = 32'hDEADBEEF;
    #10;

    if (nice_csr_ready !== 1'b1) begin
      $display("FAIL: nice_csr_ready should be high");
      $finish;
    end

    // Test 2: Check read data is always zero
    nice_csr_valid = 1;
    #10;

    if (nice_csr_rdata !== 32'b0) begin
      $display("FAIL: nice_csr_rdata should be zero");
      $finish;
    end

    // Test 3: Check write operation is disregarded
    nice_csr_wr = 1;
    nice_csr_wdata = 32'h12345678;
    #10;

    // Read back should still be zero
    if (nice_csr_rdata !== 32'b0) begin
      $display("FAIL: nice_csr_rdata should still be zero after write");
      $finish;
    end

    // Test 4: Check with different address
    nice_csr_addr = 32'hFFFFFFFF;
    #10;

    if (nice_csr_rdata !== 32'b0) begin
      $display("FAIL: nice_csr_rdata should still be zero with different address");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule