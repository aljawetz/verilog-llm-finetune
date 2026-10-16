`timescale 1ns/1ps

module tb_seq;
  reg clk;
  reg rst;
  reg sin;
  wire out;

  // Instantiate the module under test (uut)
  seq uut (
    .clk(clk),
    .rst(rst),
    .sin(sin),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    sin = 0;
    #10; // Wait for 10ns
    rst = 0;

    // Test sequence to drive the FSM
    // State transitions based on sin input
    // s0 -> s1 (sin = 0)
    sin = 0; #10;
    if (uut.cs !== 1) $display("FAIL: Expected state s1 after sin=0 from s0");

    // s1 -> s2 (sin = 1)
    sin = 1; #10;
    if (uut.cs !== 2) $display("FAIL: Expected state s2 after sin=1 from s1");

    // s2 -> s3 (sin = 1)
    sin = 1; #10;
    if (uut.cs !== 3) $display("FAIL: Expected state s3 after sin=1 from s2");

    // s3 -> s4 (sin = 0)
    sin = 0; #10;
    if (uut.cs !== 4) $display("FAIL: Expected state s4 after sin=0 from s3");

    // s4 -> s1 (sin = 0)
    sin = 0; #10;
    if (uut.cs !== 1) $display("FAIL: Expected state s1 after sin=0 from s4");

    // s1 -> s2 (sin = 1)
    sin = 1; #10;
    if (uut.cs !== 2) $display("FAIL: Expected state s2 after sin=1 from s1");

    // Check output when in final state (s4)
    sin = 0; #10;
    if (uut.out !== 1'b1) $display("FAIL: Expected output high when in state s4");

    // Final state check
    sin = 1; #10;
    if (uut.out !== 1'b0) $display("FAIL: Expected output low when not in state s4");

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule