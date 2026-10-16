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
    .reciever_in(reciever_in),
    .sender_out(sender_out),
    .reciever_out(reciever_out)
  );

  initial begin
    // Test sequence
    // Test case 1: sender_port = 1, sender_in = 1
    sender_port = 1; sender_in = 1; reciever_in = 0;
    #10;
    if (reciever_out !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected reciever_out = 1'b1, got %b", reciever_out);
      $finish;
    end

    // Test case 2: sender_port = 1, sender_in = 0
    sender_in = 0;
    #10;
    if (reciever_out !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected reciever_out = 1'b0, got %b", reciever_out);
      $finish;
    end

    // Test case 3: sender_port = 0, reciever_in = 1
    sender_port = 0; reciever_in = 1; sender_in = 0;
    #10;
    if (sender_out !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected sender_out = 1'b1, got %b", sender_out);
      $finish;
    end

    // Test case 4: sender_port = 0, reciever_in = 0
    reciever_in = 0;
    #10;
    if (sender_out !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected sender_out = 1'b0, got %b", sender_out);
      $finish;
    end

    // Test case 5: Check high-impedance state
    sender_port = 1; sender_in = 1; reciever_in = 1;
    #10;
    if (sender_out !== 1'bz) begin
      $display("FAIL: Test case 5 failed, expected sender_out = 1'bz, got %b", sender_out);
      $finish;
    end

    // Test case 6: Check high-impedance state
    sender_port = 0; sender_in = 0; reciever_in = 0;
    #10;
    if (reciever_out !== 1'bz) begin
      $display("FAIL: Test case 6 failed, expected reciever_out = 1'bz, got %b", reciever_out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule