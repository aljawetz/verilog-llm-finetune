`timescale 1ns/1ps

module tb_Tri_state_buff;

  reg in;
  reg enb;
  wire out;

  // Instantiate the unit under test (uut)
  Tri_state_buff uut (
    .in(in),
    .enb(enb),
    .out(out)
  );

  initial begin
    // Test 1: Enable the buffer and check output
    in = 1'b1; 
    enb = 1'b1; 
    #10; 
    if (out !== 1'b1) begin
      $display("FAIL: Test 1 failed, expected out=1, got out=%b", out);
      $finish;
    end

    // Test 2: Disable the buffer and check output
    enb = 1'b0; 
    #10; 
    if (out !== 1'bz) begin
      $display("FAIL: Test 2 failed, expected out=z, got out=%b", out);
      $finish;
    end

    // Test 3: Change input while enabled
    in = 1'b0; 
    enb = 1'b1; 
    #10; 
    if (out !== 1'b0) begin
      $display("FAIL: Test 3 failed, expected out=0, got out=%b", out);
      $finish;
    end

    // Test 4: Change input while disabled
    enb = 1'b0; 
    #10; 
    if (out !== 1'bz) begin
      $display("FAIL: Test 4 failed, expected out=z, got out=%b", out);
      $finish;
    end

    // Test 5: Enable again and check output
    in = 1'b1; 
    enb = 1'b1; 
    #10; 
    if (out !== 1'b1) begin
      $display("FAIL: Test 5 failed, expected out=1, got out=%b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule