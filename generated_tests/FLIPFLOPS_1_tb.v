`timescale 1ns/1ps

module tb_FLIPFLOPS;
  reg s, r, rst, clk;
  wire q;

  // Instantiate the FLIPFLOPS module
  FLIPFLOPS uut (
    .s(s),
    .r(r),
    .rst(rst),
    .clk(clk),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    s = 0; r = 0; rst = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    rst = 1; #10; // Assert reset
    rst = 0; #10; // Deassert reset
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test setting q to 1
    s = 1; r = 0; #10; // Set q to 1
    if (q !== 1'b1) begin
      $display("FAIL: q did not set to 1 when s=1, r=0");
      $finish;
    end

    // Test holding state
    s = 0; r = 0; #10; // Hold state
    if (q !== 1'b1) begin
      $display("FAIL: q changed when s=0, r=0");
      $finish;
    end

    // Test resetting q to 0
    s = 0; r = 1; #10; // Reset q to 0
    if (q !== 1'b0) begin
      $display("FAIL: q did not reset to 0 when s=0, r=1");
      $finish;
    end

    // Test high impedance state
    s = 1; r = 1; #10; // Set to high impedance
    if (q !== 1'bz) begin
      $display("FAIL: q did not go to high impedance when s=1, r=1");
      $finish;
    end

    // Test holding high impedance state
    s = 0; r = 0; #10; // Hold high impedance
    if (q !== 1'bz) begin
      $display("FAIL: q changed from high impedance when s=0, r=0");
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end
endmodule