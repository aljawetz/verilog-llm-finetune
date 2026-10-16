`timescale 1ns/1ps

module tb_GPRs;

  reg clk;
  reg reg_write_en;
  reg [2:0] reg_write_dest;
  reg [15:0] reg_write_data;
  reg [2:0] reg_read_addr_1;
  wire [15:0] reg_read_data_1;
  reg [2:0] reg_read_addr_2;
  wire [15:0] reg_read_data_2;

  // Instantiate the GPRs module
  GPRs uut (
    .clk(clk),
    .reg_write_en(reg_write_en),
    .reg_write_dest(reg_write_dest),
    .reg_write_data(reg_write_data),
    .reg_read_addr_1(reg_read_addr_1),
    .reg_read_data_1(reg_read_data_1),
    .reg_read_addr_2(reg_read_addr_2),
    .reg_read_data_2(reg_read_data_2)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reg_write_en = 0;
    reg_write_dest = 3'b000;
    reg_write_data = 16'd0;
    reg_read_addr_1 = 3'b000;
    reg_read_addr_2 = 3'b001;

    // Wait for a clock cycle
    #10;

    // Test 1: Write to register 0
    reg_write_en = 1;
    reg_write_dest = 3'b000;
    reg_write_data = 16'd42; // Write 42 to register 0
    #10; // Wait for clock edge
    reg_write_en = 0;

    // Check read from register 0
    if (reg_read_data_1 !== 16'd42) begin
      $display("FAIL: Expected reg_read_data_1 to be 42, got %d", reg_read_data_1);
      $finish;
    end

    // Test 2: Write to register 1
    reg_write_en = 1;
    reg_write_dest = 3'b001;
    reg_write_data = 16'd84; // Write 84 to register 1
    #10; // Wait for clock edge
    reg_write_en = 0;

    // Check read from register 1
    if (reg_read_data_2 !== 16'd84) begin
      $display("FAIL: Expected reg_read_data_2 to be 84, got %d", reg_read_data_2);
      $finish;
    end

    // Test 3: Read from both registers
    reg_read_addr_1 = 3'b000; // Read from register 0
    reg_read_addr_2 = 3'b001; // Read from register 1
    #10; // Wait for a clock cycle

    if (reg_read_data_1 !== 16'd42) begin
      $display("FAIL: Expected reg_read_data_1 to be 42, got %d", reg_read_data_1);
      $finish;
    end

    if (reg_read_data_2 !== 16'd84) begin
      $display("FAIL: Expected reg_read_data_2 to be 84, got %d", reg_read_data_2);
      $finish;
    end

    // Test 4: Write to register 2 and read back
    reg_write_en = 1;
    reg_write_dest = 3'b010;
    reg_write_data = 16'd126; // Write 126 to register 2
    #10; // Wait for clock edge
    reg_write_en = 0;

    reg_read_addr_1 = 3'b010; // Read from register 2
    #10; // Wait for a clock cycle

    if (reg_read_data_1 !== 16'd126) begin
      $display("FAIL: Expected reg_read_data_1 to be 126, got %d", reg_read_data_1);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule