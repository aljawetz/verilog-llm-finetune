`timescale 1ns/1ps

module tb_demux_1x8;

  reg in;
  reg s0, s1, s2;
  wire d0, d1, d2, d3, d4, d5, d6, d7;

  // Instantiate the demux_1x8 module
  demux_1x8 uut (
    .in(in),
    .s0(s0),
    .s1(s1),
    .s2(s2),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4),
    .d5(d5),
    .d6(d6),
    .d7(d7)
  );

  initial begin
    // Initialize inputs
    in = 0; s0 = 0; s1 = 0; s2 = 0;

    // Test all combinations of select lines
    in = 1; // Set input high
    #10;

    // Check outputs for each select combination
    s0 = 0; s1 = 0; s2 = 0; #10; if (d0 !== 1) $display("FAIL: d0 should be 1 when s0=0, s1=0, s2=0");
    s0 = 1; #10; if (d1 !== 1) $display("FAIL: d1 should be 1 when s0=1, s1=0, s2=0");
    s0 = 0; s1 = 1; #10; if (d2 !== 1) $display("FAIL: d2 should be 1 when s0=0, s1=1, s2=0");
    s0 = 1; #10; if (d3 !== 1) $display("FAIL: d3 should be 1 when s0=1, s1=1, s2=0");
    
    s2 = 1; s0 = 0; s1 = 0; #10; if (d4 !== 1) $display("FAIL: d4 should be 1 when s0=0, s1=0, s2=1");
    s0 = 1; #10; if (d5 !== 1) $display("FAIL: d5 should be 1 when s0=1, s1=0, s2=1");
    s0 = 0; s1 = 1; #10; if (d6 !== 1) $display("FAIL: d6 should be 1 when s0=0, s1=1, s2=1");
    s0 = 1; #10; if (d7 !== 1) $display("FAIL: d7 should be 1 when s0=1, s1=1, s2=1");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule