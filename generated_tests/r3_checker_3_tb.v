`timescale 1ns/1ps

module tb_r3_checker;

  reg clk;
  reg valid;
  reg we;
  reg [4:0] addr;
  reg [31:0] data;
  wire [31:0] r3;

  // Instantiate the module under test (uut)
  r3_checker uut (
    .clk(clk),
    .valid(valid),
    .we(we),
    .addr(addr),
    .data(data),
    .r3(r3)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    valid = 0;
    we = 0;
    addr = 0;
    data = 32'h0;

    // Wait for a few clock cycles
    #10;

    // Test case 1: Write to r3 when addr is 3
    valid = 1;
    we = 1;
    addr = 3;
    data = 32'hA5A5A5A5;
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hA5A5A5A5) begin
      $display("FAIL: r3 should be updated to A5A5A5A5");
      $finish;
    end

    // Test case 2: Do not write when addr is not 3
    addr = 2;
    data = 32'h5A5A5A5A;
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hA5A5A5A5) begin
      $display("FAIL: r3 should remain A5A5A5A5");
      $finish;
    end

    // Test case 3: Write to r3 when addr is 3 again
    addr = 3;
    data = 32'hDEADBEEF;
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hDEADBEEF) begin
      $display("FAIL: r3 should be updated to DEADBEEF");
      $finish;
    end

    // Test case 4: Valid is low, should not update r3
    valid = 0;
    addr = 3;
    data = 32'h12345678;
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hDEADBEEF) begin
      $display("FAIL: r3 should remain DEADBEEF");
      $finish;
    end

    // Test case 5: Write-enable is low, should not update r3
    valid = 1;
    we = 0;
    addr = 3;
    data = 32'h87654321;
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hDEADBEEF) begin
      $display("FAIL: r3 should remain DEADBEEF");
      $finish;
    end

    // Test case 6: Reset conditions
    valid = 1;
    we = 1;
    addr = 3;
    data = 32'hFFFFFFFF;
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hFFFFFFFF) begin
      $display("FAIL: r3 should be updated to FFFFFFFF");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule