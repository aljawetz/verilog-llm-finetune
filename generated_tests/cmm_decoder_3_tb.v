`timescale 1ns/1ps

module tb_cmm_decoder;

  reg [63:0] raddr;
  reg rmem32;
  reg rmem64;
  reg rio;
  reg rcheck_bus_id;
  reg rcheck_dev_id;
  reg rcheck_fun_id;
  wire rhit;
  wire [6:0] bar_hit;
  wire cmmt_rbar_hit_lat2_n;
  reg [15:0] command;
  reg [31:0] bar0_reg;
  reg [31:0] bar1_reg;
  reg [31:0] bar2_reg;
  reg [31:0] bar3_reg;
  reg [31:0] bar4_reg;
  reg [31:0] bar5_reg;
  reg [31:0] xrom_reg;
  reg [15:0] pme_pmcsr;
  reg [7:0] bus_num;
  reg [4:0] device_num;
  reg [2:0] function_num;
  reg [671:0] cfg;
  reg rst;
  reg clk;
  reg [1:0] phantom_functions_supported;
  reg phantom_functions_enabled;

  cmm_decoder uut (
    .raddr(raddr),
    .rmem32(rmem32),
    .rmem64(rmem64),
    .rio(rio),
    .rcheck_bus_id(rcheck_bus_id),
    .rcheck_dev_id(rcheck_dev_id),
    .rcheck_fun_id(rcheck_fun_id),
    .rhit(rhit),
    .bar_hit(bar_hit),
    .cmmt_rbar_hit_lat2_n(cmmt_rbar_hit_lat2_n),
    .command(command),
    .bar0_reg(bar0_reg),
    .bar1_reg(bar1_reg),
    .bar2_reg(bar2_reg),
    .bar3_reg(bar3_reg),
    .bar4_reg(bar4_reg),
    .bar5_reg(bar5_reg),
    .xrom_reg(xrom_reg),
    .pme_pmcsr(pme_pmcsr),
    .bus_num(bus_num),
    .device_num(device_num),
    .function_num(function_num),
    .phantom_functions_supported(phantom_functions_supported),
    .phantom_functions_enabled(phantom_functions_enabled),
    .cfg(cfg),
    .rst(rst),
    .clk(clk)
  );

  initial begin
    clk = 0;
    rst = 1;
    #5 rst = 0;

    // Test case 1: Basic memory access
    command = 16'b0000000000000001; // Memory access
    bar0_reg = 32'h00000000; // Base address 0
    bar1_reg = 32'h00000010; // Base address 1
    bar2_reg = 32'h00000020; // Base address 2
    bar3_reg = 32'h00000030; // Base address 3
    bar4_reg = 32'h00000040; // Base address 4
    bar5_reg = 32'h00000050; // Base address 5
    xrom_reg = 32'h00000000; // XROM base
    pme_pmcsr = 16'b0000000000000000; // No power management
    bus_num = 8'h01; // Bus number
    device_num = 5'b00001; // Device number
    function_num = 3'b000; // Function number
    cfg = 672'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // All regions enabled

    // Test memory access to BAR0
    raddr = 64'h00000000; // Address hits BAR0
    rmem32 = 1;
    rmem64 = 0;
    rio = 0;
    rcheck_bus_id = 0;
    rcheck_dev_id = 0;
    rcheck_fun_id = 0;
    #10;

    if (!rhit || bar_hit != 7'b0000001) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Memory access to BAR1
    raddr = 64'h00000010; // Address hits BAR1
    #10;

    if (!rhit || bar_hit != 7'b0000010) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Memory access to BAR2
    raddr = 64'h00000020; // Address hits BAR2
    #10;

    if (!rhit || bar_hit != 7'b0000100) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Memory access to BAR3
    raddr = 64'h00000030; // Address hits BAR3
    #10;

    if (!rhit || bar_hit != 7'b0001000) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Memory access to BAR4
    raddr = 64'h00000040; // Address hits BAR4
    #10;

    if (!rhit || bar_hit != 7'b0010000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Memory access to BAR5
    raddr = 64'h00000050; // Address hits BAR5
    #10;

    if (!rhit || bar_hit != 7'b0100000) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: I/O access
    command = 16'b0000000000000000; // I/O access
    raddr = 64'h00000000; // Address hits BAR0
    rio = 1;
    #10;

    if (!rhit || bar_hit != 7'b0000001) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: Reset functionality
    rst = 1;
    #5 rst = 0;
    #10;

    if (rhit || bar_hit != 7'b0000000) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

  always #5 clk = ~clk;

endmodule