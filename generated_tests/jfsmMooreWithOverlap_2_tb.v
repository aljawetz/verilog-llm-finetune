`timescale 1ns/1ps

module tb_jfsmMooreWithOverlap;

  reg clock;
  reg reset;
  reg datain;
  wire dataout;

  // Instantiate the module under test
  jfsmMooreWithOverlap uut (
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
    #10; // Wait for a clock cycle

    // Release reset
    reset = 0;
    #10; // Wait for a clock cycle

    // Test sequence
    // State a -> b
    datain = 1; #10; // Move to state b
    if (uut.cs !== 3'b001) $display("FAIL: Expected state b, got %b", uut.cs);

    // State b -> c
    datain = 1; #10; // Move to state c
    if (uut.cs !== 3'b010) $display("FAIL: Expected state c, got %b", uut.cs);

    // State c -> d
    datain = 1; #10; // Move to state d
    if (uut.cs !== 3'b011) $display("FAIL: Expected state d, got %b", uut.cs);

    // State d -> e
    datain = 0; #10; // Move to state e
    if (uut.cs !== 3'b100) $display("FAIL: Expected state e, got %b", uut.cs);

    // Check dataout in state e with datain = 1
    datain = 1; #10; // dataout should be 1
    if (dataout !== 1) $display("FAIL: Expected dataout = 1, got %b", dataout);

    // State e -> f
    #10; // Move to state f
    if (uut.cs !== 3'b101) $display("FAIL: Expected state f, got %b", uut.cs);

    // State f -> c
    datain = 1; #10; // Move to state c
    if (uut.cs !== 3'b010) $display("FAIL: Expected state c, got %b", uut.cs);

    // State c -> a
    datain = 0; #10; // Move to state a
    if (uut.cs !== 3'b000) $display("FAIL: Expected state a, got %b", uut.cs);

    // Final check for dataout in state a
    if (dataout !== 0) $display("FAIL: Expected dataout = 0, got %b", dataout);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule