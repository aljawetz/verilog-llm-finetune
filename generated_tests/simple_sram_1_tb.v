`timescale 1ns/1ps

module tb_simple_sram;

  reg clk;
  reg [9:0] address;
  reg [31:0] din;
  reg wena;
  reg cena;
  wire [31:0] dout;

  // Instantiate the simple_sram module
  simple_sram uut (
    .clk(clk),
    .address(address),
    .din(din),
    .wena(wena),
    .cena(cena),
    .dout(dout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
  end

  // Test procedure
  initial begin
    // Initialize signals
    cena = 1; // Chip enable
    wena = 0; // Write enable
    address = 10'b0; // Start at address 0
    din = 32'hDEADBEEF; // Sample data

    // Test 1: Write data to memory
    cena = 0; // Enable chip
    wena = 1; // Enable write
    address = 10'b0000000000; // Write to address 0
    #10; // Wait for one clock cycle

    // Test 2: Read data back from memory
    wena = 0; // Disable write
    #10; // Wait for one clock cycle
    if (dout !== din) begin
      $display("FAIL: Read data does not match written data at address 0");
      $finish;
    end

    // Test 3: Write to another address
    address = 10'b0000000001; // Write to address 1
    din = 32'hCAFEBABE; // New data
    wena = 1; // Enable write
    #10; // Wait for one clock cycle

    // Test 4: Read data back from new address
    wena = 0; // Disable write
    #10; // Wait for one clock cycle
    if (dout !== 32'hCAFEBABE) begin
      $display("FAIL: Read data does not match written data at address 1");
      $finish;
    end

    // Test 5: Ensure previous address still holds the correct data
    address = 10'b0000000000; // Read from address 0
    #10; // Wait for one clock cycle
    if (dout !== 32'hDEADBEEF) begin
      $display("FAIL: Read data from address 0 is incorrect");
      $finish;
    end

    // Test 6: Disable chip and attempt to read
    cena = 1; // Disable chip
    #10; // Wait for one clock cycle
    if (dout !== 32'hDEADBEEF) begin
      $display("FAIL: Read data should not change when chip is disabled");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule