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
    data = 32'h0;

    // Wait for a few clock cycles
    #10;

    // Test case 1: Write to r3 when addr is 3
    valid = 1;
    we = 1;
    addr = 3;
    data = 32'hDEADBEEF;
    #10; // Wait for one clock cycle

    if (r3 !== 32'hDEADBEEF) begin
      $display("FAIL: r3 did not update correctly when valid, we, and addr are correct");
      $finish;
    end

    // Test case 2: Do not write when addr is not 3
    addr = 2;
    data = 32'hCAFEBABE;
    #10; // Wait for one clock cycle

    if (r3 !== 32'hDEADBEEF) begin
      $display("FAIL: r3 should not update when addr is not 3");
      $finish;
    end

    // Test case 3: Do not write when we is not asserted
    addr = 3;
    we = 0;
    data = 32'hBEEFCACE;
    #10; // Wait for one clock cycle

    if (r3 !== 32'hDEADBEEF) begin
      $display("FAIL: r3 should not update when we is not asserted");
      $finish;
    end

    // Test case 4: Do not write when valid is not asserted
    valid = 0;
    we = 1;
    addr = 3;
    data = 32'hBEEFCACE;
    #10; // Wait for one clock cycle

    if (r3 !== 32'hDEADBEEF) begin
      $display("FAIL: r3 should not update when valid is not asserted");
      $finish;
    end

    // Test case 5: Write again to r3 when addr is 3
    valid = 1;
    we = 1;
    addr = 3;
    data = 32'h12345678;
    #10; // Wait for one clock cycle

    if (r3 !== 32'h12345678) begin
      $display("FAIL: r3 did not update correctly on second write when valid, we, and addr are correct");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule