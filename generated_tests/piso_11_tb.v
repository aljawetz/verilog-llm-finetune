`timescale 1ns/1ps

module tb_piso;

  reg clk;
  reg reset;
  reg load;
  reg [2:0] parallel_in;
  wire serial_out;

  // Instantiate the module under test (uut)
  piso uut (
    .clk(clk),
    .reset(reset),
    .load(load),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    load = 0;
    parallel_in = 3'b000;

    // Wait for a clock cycle
    #10;
    
    // Release reset
    reset = 0;
    #10;

    // Test loading parallel data
    load = 1;
    parallel_in = 3'b101; // Load 101
    #10;
    load = 0; // Stop loading

    // Check serial output after loading
    if (serial_out !== 1'b1) begin
      $display("FAIL: Expected serial_out to be 1 after loading 101");
      $finish;
    end

    // Shift and check outputs
    #10; // Shift
    if (serial_out !== 1'b0) begin
      $display("FAIL: Expected serial_out to be 0 after first shift");
      $finish;
    end

    #10; // Shift
    if (serial_out !== 1'b1) begin
      $display("FAIL: Expected serial_out to be 1 after second shift");
      $finish;
    end

    #10; // Shift
    if (serial_out !== 1'bx) begin
      $display("FAIL: Expected serial_out to be x after third shift");
      $finish;
    end

    // Final check to ensure the module is functioning correctly
    #10; // Shift again
    if (serial_out !== 1'bx) begin
      $display("FAIL: Expected serial_out to remain x after additional shift");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule