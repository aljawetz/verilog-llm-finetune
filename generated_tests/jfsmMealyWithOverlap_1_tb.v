`timescale 1ns/1ps

module tb_jfsmMealyWithOverlap;

  reg clock;
  reg reset;
  reg datain;
  wire dataout;

  // Instantiate the module under test
  jfsmMealyWithOverlap uut (
    .dataout(dataout),
    .clock(clock),
    .reset(reset),
    .datain(datain)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    datain = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test sequence
    // State a -> b (datain = 1)
    datain = 1; #10;
    if (uut.cs !== 3'b001) $display("FAIL: Expected state b after input 1 from state a");

    // State b -> c (datain = 1)
    datain = 1; #10;
    if (uut.cs !== 3'b010) $display("FAIL: Expected state c after input 1 from state b");

    // State c -> d (datain = 1)
    datain = 1; #10;
    if (uut.cs !== 3'b011) $display("FAIL: Expected state d after input 1 from state c");

    // State d -> e (datain = 0)
    datain = 0; #10;
    if (uut.cs !== 3'b100) $display("FAIL: Expected state e after input 0 from state d");

    // State e -> a (datain = 0)
    datain = 0; #10;
    if (uut.cs !== 3'b000) $display("FAIL: Expected state a after input 0 from state e");

    // State a -> b (datain = 1)
    datain = 1; #10;
    if (uut.cs !== 3'b001) $display("FAIL: Expected state b after input 1 from state a");

    // State b -> b (datain = 0)
    datain = 0; #10;
    if (uut.cs !== 3'b001) $display("FAIL: Expected state b after input 0 from state b");

    // State b -> c (datain = 1)
    datain = 1; #10;
    if (uut.cs !== 3'b010) $display("FAIL: Expected state c after input 1 from state b");

    // Check dataout when in state e
    datain = 1; #10;
    if (uut.cs !== 3'b011) $display("FAIL: Expected state d after input 1 from state c");
    datain = 0; #10;
    if (uut.dataout !== 1) $display("FAIL: Expected dataout to be 1 when in state e with datain = 1");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule