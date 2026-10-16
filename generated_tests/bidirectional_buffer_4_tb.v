`timescale 1ns/1ps

module tb_bidirectional_buffer;

  reg sender_port;
  reg sender_in;
  reg reciever_in;
  wire sender_out;
  wire reciever_out;

  // Instantiate the module under test (uut)
  bidirectional_buffer uut (
    .sender_port(sender_port),
    .sender_in(sender_in),
    .sender_out(sender_out),
    .reciever_in(reciever_in),
    .reciever_out(reciever_out)
  );

  initial begin
    // Test Case 1: sender_port = 1, sender_in = 1
    sender_port = 1; sender_in = 1; reciever_in = 0;
    #10;
    if (reciever_out !== 1) begin
      $display("FAIL: Test Case 1 failed, expected reciever_out = 1, got %b", reciever_out);
      $finish;
    end
    if (sender_out !== 1'bz) begin
      $display("FAIL: Test Case 1 failed, expected sender_out = Z, got %b", sender_out);
      $finish;
    end

    // Test Case 2: sender_port = 1, sender_in = 0
    sender_in = 0;
    #10;
    if (reciever_out !== 0) begin
      $display("FAIL: Test Case 2 failed, expected reciever_out = 0, got %b", reciever_out);
      $finish;
    end
    if (sender_out !== 1'bz) begin
      $display("FAIL: Test Case 2 failed, expected sender_out = Z, got %b", sender_out);
      $finish;
    end

    // Test Case 3: sender_port = 0, reciever_in = 1
    sender_port = 0; reciever_in = 1; sender_in = 0;
    #10;
    if (sender_out !== 1) begin
      $display("FAIL: Test Case 3 failed, expected sender_out = 1, got %b", sender_out);
      $finish;
    end
    if (reciever_out !== 1'bz) begin
      $display("FAIL: Test Case 3 failed, expected reciever_out = Z, got %b", reciever_out);
      $finish;
    end

    // Test Case 4: sender_port = 0, reciever_in = 0
    reciever_in = 0;
    #10;
    if (sender_out !== 0) begin
      $display("FAIL: Test Case 4 failed, expected sender_out = 0, got %b", sender_out);
      $finish;
    end
    if (reciever_out !== 1'bz) begin
      $display("FAIL: Test Case 4 failed, expected reciever_out = Z, got %b", reciever_out);
      $finish;
    end

    // Test Case 5: sender_port = 1, sender_in = 1, reciever_in = 1
    sender_port = 1; sender_in = 1; reciever_in = 1;
    #10;
    if (reciever_out !== 1) begin
      $display("FAIL: Test Case 5 failed, expected reciever_out = 1, got %b", reciever_out);
      $finish;
    end
    if (sender_out !== 1'bz) begin
      $display("FAIL: Test Case 5 failed, expected sender_out = Z, got %b", sender_out);
      $finish;
    end

    // Test Case 6: sender_port = 0, reciever_in = 1, sender_in = 0
    sender_port = 0; sender_in = 0; reciever_in = 1;
    #10;
    if (sender_out !== 1) begin
      $display("FAIL: Test Case 6 failed, expected sender_out = 1, got %b", sender_out);
      $finish;
    end
    if (reciever_out !== 1'bz) begin
      $display("FAIL: Test Case 6 failed, expected reciever_out = Z, got %b", reciever_out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule