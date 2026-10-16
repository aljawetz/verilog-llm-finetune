`timescale 1ns/1ps

module tb_apb_sram;

  // Parameters
  parameter DATA_WIDTH = 32;
  parameter ADDRESS_WIDTH = 10;

  // Inputs
  reg Pclk;
  reg Psel;
  reg Pena;
  reg Pwrite;
  reg [ADDRESS_WIDTH-1:0] Paddr;
  reg [DATA_WIDTH-1:0] Pwdata;
  reg [DATA_WIDTH-1:0] S_rdata;

  // Outputs
  wire [DATA_WIDTH-1:0] Prdata;
  wire Pready;
  wire Perr;
  wire [DATA_WIDTH-1:0] s_wdata;
  wire s_wena;
  wire s_cena;

  // Instantiate the Unit Under Test (UUT)
  apb_sram uut (
    .Pclk(Pclk),
    .Psel(Psel),
    .Pena(Pena),
    .Pwrite(Pwrite),
    .Paddr(Paddr),
    .Pwdata(Pwdata),
    .S_rdata(S_rdata),
    .Prdata(Prdata),
    .Pready(Pready),
    .Perr(Perr),
    .s_wdata(s_wdata),
    .s_wena(s_wena),
    .s_cena(s_cena)
  );

  // Clock generation
  initial begin
    Pclk = 0;
    forever #5 Pclk = ~Pclk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    Psel = 0;
    Pena = 0;
    Pwrite = 0;
    Paddr = 0;
    Pwdata = 0;
    S_rdata = 32'hA5A5A5A5; // Sample read data

    // Wait for global reset
    #10;

    // Test Write Operation
    Psel = 1;
    Pena = 1;
    Paddr = 10'b0000000001;
    Pwdata = 32'hDEADBEEF;
    Pwrite = 1;

    // Wait for a clock cycle
    #10;

    // Check write enable and data
    if (s_wena !== 1 || s_wdata !== Pwdata || s_cena !== 0) begin
      $display("FAIL: Write operation failed");
      $finish;
    end

    // Test Read Operation
    Pwrite = 0; // Switch to read
    S_rdata = 32'hDEADBEEF; // Simulate SRAM returning the written data

    // Wait for a clock cycle
    #10;

    // Check read data
    if (Prdata !== S_rdata || s_wena !== 0 || s_cena !== 0) begin
      $display("FAIL: Read operation failed");
      $finish;
    end

    // Test inactive state
    Psel = 0;
    Pena = 0;

    // Wait for a clock cycle
    #10;

    // Check inactive state
    if (Pready !== 0 || Perr !== 0 || s_wena !== 0 || s_cena !== 1) begin
      $display("FAIL: Inactive state failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule