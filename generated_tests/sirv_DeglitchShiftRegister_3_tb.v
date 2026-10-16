`timescale 1ns/1ps

module tb_sirv_DeglitchShiftRegister;

  reg clock;
  reg reset;
  reg io_d;
  wire io_q;

  // Instantiate the module under test (uut)
  sirv_DeglitchShiftRegister uut (
    .clock(clock),
    .reset(reset),
    .io_d(io_d),
    .io_q(io_q)
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
    io_d = 0;

    // Release reset
    #10 reset = 0;

    // Test case 1: Stable input
    #10 io_d = 1; // Set io_d to 1
    #10 if (io_q !== 0) $display("FAIL: Expected io_q to be 0 with io_d = 1 for one clock cycle");
    
    // Test case 2: Glitch input
    #10 io_d = 0; // Set io_d to 0
    #10 if (io_q !== 0) $display("FAIL: Expected io_q to be 0 with io_d = 0 for one clock cycle");
    
    // Test case 3: Stable input changes
    #10 io_d = 1; // Set io_d to 1
    #10 if (io_q !== 0) $display("FAIL: Expected io_q to be 0 with io_d = 1 for one clock cycle");
    
    // Test case 4: Confirming stable output after two cycles
    #10 if (io_q !== 1) $display("FAIL: Expected io_q to be 1 after two cycles of io_d = 1");
    
    // Test case 5: Input glitch
    #10 io_d = 0; // Set io_d to 0
    #10 if (io_q !== 0) $display("FAIL: Expected io_q to be 0 with io_d = 0");
    
    // Test case 6: Stable input again
    #10 io_d = 1; // Set io_d to 1
    #10 if (io_q !== 0) $display("FAIL: Expected io_q to be 0 with io_d = 1 for one clock cycle");
    
    // Test case 7: Confirming stable output after two cycles
    #10 if (io_q !== 1) $display("FAIL: Expected io_q to be 1 after two cycles of io_d = 1");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule