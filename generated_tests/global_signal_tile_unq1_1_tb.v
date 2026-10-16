`timescale 1ns/1ps

module tb_global_signal_tile_unq1;

  reg gin_l_0, gin_u_0, gin_l_1, gin_u_1;
  reg gin_l_2, gin_u_2, gin_l_3, gin_u_3;
  reg clk, reset;
  reg [31:0] config_addr, config_data;
  reg config_read, config_write;
  reg [15:0] tile_id;
  wire gout_l_0, gout_l_1, gout_l_2, gout_l_3, gout_u;
  wire [31:0] read_data;

  global_signal_tile_unq1 uut (
    .gin_l_0(gin_l_0),
    .gin_u_0(gin_u_0),
    .gout_l_0(gout_l_0),
    .gin_l_1(gin_l_1),
    .gin_u_1(gin_u_1),
    .gout_l_1(gout_l_1),
    .gin_l_2(gin_l_2),
    .gin_u_2(gin_u_2),
    .gout_l_2(gout_l_2),
    .gin_l_3(gin_l_3),
    .gin_u_3(gin_u_3),
    .gout_l_3(gout_l_3),
    .gout_u(gout_u),
    .clk(clk),
    .reset(reset),
    .config_addr(config_addr),
    .config_data(config_data),
    .config_read(config_read),
    .config_write(config_write),
    .tile_id(tile_id),
    .read_data(read_data)
  );

  initial begin
    clk = 0;
    reset = 1;
    gin_l_0 = 0; gin_u_0 = 0;
    gin_l_1 = 0; gin_u_1 = 0;
    gin_l_2 = 0; gin_u_2 = 0;
    gin_l_3 = 0; gin_u_3 = 0;
    config_addr = 0;
    config_data = 0;
    config_read = 0;
    config_write = 0;
    tile_id = 16'h0001;

    #5 reset = 0;

    // Test 1: Write configuration and check outputs
    config_addr = {8'b0, tile_id, 8'b0, 8'b0}; // Address for config write
    config_data = 32'h0000000F; // Set all lower signals
    config_write = 1;
    #10 config_write = 0;

    // Drive inputs
    gin_u_0 = 1; gin_l_0 = 0; // Expect gout_l_0 = gin_l_0
    gin_u_1 = 1; gin_l_1 = 0; // Expect gout_l_1 = gin_l_1
    gin_u_2 = 1; gin_l_2 = 0; // Expect gout_l_2 = gin_l_2
    gin_u_3 = 1; gin_l_3 = 0; // Expect gout_l_3 = gin_l_3
    #10;

    if (gout_l_0 !== 0) $display("FAIL: gout_l_0 expected 0, got %b", gout_l_0);
    if (gout_l_1 !== 0) $display("FAIL: gout_l_1 expected 0, got %b", gout_l_1);
    if (gout_l_2 !== 0) $display("FAIL: gout_l_2 expected 0, got %b", gout_l_2);
    if (gout_l_3 !== 0) $display("FAIL: gout_l_3 expected 0, got %b", gout_l_3);
    if (gout_u !== 1) $display("FAIL: gout_u expected 1, got %b", gout_u);

    // Test 2: Change configuration to select lower signals
    config_data = 32'h00000000; // Set all upper signals
    config_write = 1;
    #10 config_write = 0;

    gin_u_0 = 0; gin_l_0 = 1; // Expect gout_l_0 = gin_l_0
    gin_u_1 = 0; gin_l_1 = 1; // Expect gout_l_1 = gin_l_1
    gin_u_2 = 0; gin_l_2 = 1; // Expect gout_l_2 = gin_l_2
    gin_u_3 = 0; gin_l_3 = 1; // Expect gout_l_3 = gin_l_3
    #10;

    if (gout_l_0 !== 1) $display("FAIL: gout_l_0 expected 1, got %b", gout_l_0);
    if (gout_l_1 !== 1) $display("FAIL: gout_l_1 expected 1, got %b", gout_l_1);
    if (gout_l_2 !== 1) $display("FAIL: gout_l_2 expected 1, got %b", gout_l_2);
    if (gout_l_3 !== 1) $display("FAIL: gout_l_3 expected 1, got %b", gout_l_3);
    if (gout_u !== 1) $display("FAIL: gout_u expected 1, got %b", gout_u);

    // Test 3: Check read data
    config_read = 1;
    #10 config_read = 0;

    if (read_data !== 32'h00000000) $display("FAIL: read_data expected 0, got %h", read_data);

    $display("PASS");
    $finish;
  end

  always #5 clk = ~clk;

endmodule