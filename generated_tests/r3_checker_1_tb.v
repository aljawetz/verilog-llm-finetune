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
    // Initialize signals
    valid = 0;
    we = 0;
    addr = 0;
    data = 0;

    // Wait for a few clock cycles
    #10;

    // Test case 1: Write to r3 when addr is 3
    valid = 1;
    we = 1;
    addr = 3;
    data = 32'hA5A5A5A5; // Test data
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hA5A5A5A5) begin
      $display("FAIL: r3 did not update correctly on valid write to addr 3");
      $finish;
    end

    // Test case 2: Write to r3 when addr is not 3
    addr = 2; // Change address
    data = 32'h5A5A5A5A; // New test data
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hA5A5A5A5) begin
      $display("FAIL: r3 should not update on valid write to addr 2");
      $finish;
    end

    // Test case 3: Valid but not write enable
    addr = 3; // Change address back to 3
    we = 0; // Disable write
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hA5A5A5A5) begin
      $display("FAIL: r3 should not update when we is low");
      $finish;
    end

    // Test case 4: Valid but not valid signal
    valid = 0; // Disable valid
    we = 1; // Enable write
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hA5A5A5A5) begin
      $display("FAIL: r3 should not update when valid is low");
      $finish;
    end

    // Test case 5: Write to r3 again with addr 3
    valid = 1;
    we = 1;
    addr = 3;
    data = 32'hDEADBEEF; // New test data
    #10; // Wait for one clock cycle
    if (uut.r3 !== 32'hDEADBEEF) begin
      $display("FAIL: r3 did not update correctly on valid write to addr 3");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule