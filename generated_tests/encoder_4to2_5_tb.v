`timescale 1ns/1ps

module tb_encoder_4to2;

  reg [3:0] data_in;
  wire [1:0] encoded_output;

  // Instantiate the module under test (uut)
  encoder_4to2 uut (
    .data_in(data_in),
    .encoded_output(encoded_output)
  );

  initial begin
    // Test case 1: All inputs low
    data_in = 4'b0000;
    #10;
    if (encoded_output !== 2'b00) begin
      $display("FAIL: Test case 1 failed, expected 00, got %b", encoded_output);
      $finish;
    end

    // Test case 2: First two inputs high
    data_in = 4'b0011;
    #10;
    if (encoded_output !== 2'b01) begin
      $display("FAIL: Test case 2 failed, expected 01, got %b", encoded_output);
      $finish;
    end

    // Test case 3: Last two inputs high
    data_in = 4'b1100;
    #10;
    if (encoded_output !== 2'b10) begin
      $display("FAIL: Test case 3 failed, expected 10, got %b", encoded_output);
      $finish;
    end

    // Test case 4: Mixed inputs
    data_in = 4'b1010;
    #10;
    if (encoded_output !== 2'b11) begin
      $display("FAIL: Test case 4 failed, expected 11, got %b", encoded_output);
      $finish;
    end

    // Test case 5: All inputs high
    data_in = 4'b1111;
    #10;
    if (encoded_output !== 2'b11) begin
      $display("FAIL: Test case 5 failed, expected 11, got %b", encoded_output);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule