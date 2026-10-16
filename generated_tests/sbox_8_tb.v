`timescale 1ns/1ps

module tb_sbox;

  reg clk;
  reg reset;
  reg enable;
  reg [7:0] din;
  reg ende;
  wire [7:0] en_dout;
  wire [7:0] de_dout;
  reg [7:0] data;
  reg [3:0] d1;
  reg [3:0] p;

  // Instantiate the module under test
  sbox uut (
    .clk(clk),
    .reset(reset),
    .enable(enable),
    .din(din),
    .ende(ende),
    .en_dout(en_dout),
    .de_dout(de_dout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    enable = 0;
    din = 8'b0;
    ende = 0;
    data = 8'b0;
    d1 = 4'b0;
    p = 4'b0;

    // Release reset
    #10 reset = 0;

    // Test encryption
    enable = 1;
    din = 8'hA5; // Example input
    #10;
    if (en_dout !== uut.en_dout) begin
      $display("FAIL: Encryption output mismatch");
      $finish;
    end

    // Test decryption
    #10;
    ende = 1; // Switch to decryption
    din = en_dout; // Use the output of the previous encryption
    #10;
    if (de_dout !== uut.de_dout) begin
      $display("FAIL: Decryption output mismatch");
      $finish;
    end

    // Additional tests can be added here

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule