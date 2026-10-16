`timescale 1ns/1ps

module tb_Tri_state_buff;

  reg in;
  reg enb;
  wire out;

  // Instantiate the module under test (uut)
  Tri_state_buff uut (
    .in(in),
    .enb(enb),
    .out(out)
  );

  initial begin
    // Test sequence
    // Test case 1: Enable the buffer and check output
    in = 1'b1; 
    enb = 1'b1; 
    #10; // Wait for 10 time units
    if (out !== 1'b1) begin
      $display("FAIL: Expected out = 1'b1 when enb = 1'b1 and in = 1'b1, got out = %b", out);
      $finish;
    end

    // Test case 2: Disable the buffer and check output
    enb = 1'b0; 
    #10; // Wait for 10 time units
    if (out !== 1'bz) begin
      $display("FAIL: Expected out = 1'bz when enb = 1'b0, got out = %b", out);
      $finish;
    end

    // Test case 3: Enable the buffer with 0 input
    in = 1'b0; 
    enb = 1'b1; 
    #10; // Wait for 10 time units
    if (out !== 1'b0) begin
      $display("FAIL: Expected out = 1'b0 when enb = 1'b1 and in = 1'b0, got out = %b", out);
      $finish;
    end

    // Test case 4: Disable the buffer again
    enb = 1'b0; 
    #10; // Wait for 10 time units
    if (out !== 1'bz) begin
      $display("FAIL: Expected out = 1'bz when enb = 1'b0, got out = %b", out);
      $finish;
    end

    // Test case 5: Enable the buffer with a different input
    in = 1'b1; 
    enb = 1'b1; 
    #10; // Wait for 10 time units
    if (out !== 1'b1) begin
      $display("FAIL: Expected out = 1'b1 when enb = 1'b1 and in = 1'b1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule