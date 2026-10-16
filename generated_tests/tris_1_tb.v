`timescale 1ns/1ps

module tb_tris;

  reg [7:0] in;
  reg en;
  wire [7:0] out;

  // Instantiate the module under test (uut)
  tris uut (
    .in(in),
    .out(out),
    .en(en)
  );

  initial begin
    // Test case 1: Enable is low, output should be 0
    en = 0; in = 8'hFF; // Input is 255
    #10;
    if (out !== 8'd0) begin
      $display("FAIL: Expected output 0 when enable is low");
      $finish;
    end

    // Test case 2: Enable is high, output should be equal to input
    en = 1; in = 8'hAA; // Input is 170
    #10;
    if (out !== 8'hAA) begin
      $display("FAIL: Expected output 0xAA when enable is high");
      $finish;
    end

    // Test case 3: Change input while enable is high
    in = 8'h55; // Input is 85
    #10;
    if (out !== 8'h55) begin
      $display("FAIL: Expected output 0x55 when input changes and enable is high");
      $finish;
    end

    // Test case 4: Disable and check output again
    en = 0; 
    #10;
    if (out !== 8'd0) begin
      $display("FAIL: Expected output 0 when enable is low again");
      $finish;
    end

    // Test case 5: Enable again with a new input
    en = 1; in = 8'h01; // Input is 1
    #10;
    if (out !== 8'h01) begin
      $display("FAIL: Expected output 0x01 when enable is high again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule