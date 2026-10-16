`timescale 1ns/1ps

module tb_buffer;

  reg in;
  reg enb;
  wire out;

  // Instantiate the module under test
  buffer uut (
    .in(in),
    .enb(enb),
    .out(out)
  );

  initial begin
    // Initialize inputs
    in = 0;
    enb = 0;

    // Test sequence
    // Test 1: Check output when enable is low (should be high-impedance)
    #10;
    if (out !== 1'bz) begin
      $display("FAIL: Output should be high-impedance when enable is low");
      $finish;
    end

    // Test 2: Enable the buffer and check output
    enb = 1;
    in = 1;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 when input is 1 and enable is high");
      $finish;
    end

    // Test 3: Change input while enabled
    in = 0;
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 when input is 0 and enable is high");
      $finish;
    end

    // Test 4: Disable the buffer and check output
    enb = 0;
    #10;
    if (out !== 1'bz) begin
      $display("FAIL: Output should be high-impedance when enable is low");
      $finish;
    end

    // Test 5: Enable again and check output
    enb = 1;
    in = 1;
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 when input is 1 and enable is high");
      $finish;
    end

    // Test 6: Final check with input 0
    in = 0;
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 when input is 0 and enable is high");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule