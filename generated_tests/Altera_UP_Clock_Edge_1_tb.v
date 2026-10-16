`timescale 1ns/1ps

module tb_Altera_UP_Clock_Edge;

  // Parameters
  reg clk;
  reg reset;
  reg test_clk;
  wire rising_edge;
  wire falling_edge;

  // Instantiate the module under test (uut)
  Altera_UP_Clock_Edge uut (
    .clk(clk),
    .reset(reset),
    .test_clk(test_clk),
    .rising_edge(rising_edge),
    .falling_edge(falling_edge)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    test_clk = 0;

    // Apply reset
    #10 reset = 0; // Release reset after 10ns

    // Test rising edge detection
    #10 test_clk = 1; // Rising edge at 20ns
    #10 if (!rising_edge) begin
      $display("FAIL: Rising edge not detected");
      $finish;
    end

    // Test falling edge detection
    #10 test_clk = 0; // Falling edge at 40ns
    #10 if (!falling_edge) begin
      $display("FAIL: Falling edge not detected");
      $finish;
    end

    // Test no edge condition
    #10 test_clk = 0; // No change
    #10 if (rising_edge || falling_edge) begin
      $display("FAIL: Edge detected when there should be none");
      $finish;
    end

    // Test another rising edge
    #10 test_clk = 1; // Rising edge at 80ns
    #10 if (!rising_edge) begin
      $display("FAIL: Second rising edge not detected");
      $finish;
    end

    // Test another falling edge
    #10 test_clk = 0; // Falling edge at 100ns
    #10 if (!falling_edge) begin
      $display("FAIL: Second falling edge not detected");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule