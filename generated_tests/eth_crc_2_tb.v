`timescale 1ns/1ps

module tb_eth_crc;

  reg Clk;
  reg Reset;
  reg [3:0] Data;
  reg Enable;
  reg Initialize;
  wire [31:0] Crc;
  wire CrcError;

  // Instantiate the Unit Under Test (UUT)
  eth_crc uut (
    .Clk(Clk),
    .Reset(Reset),
    .Data(Data),
    .Enable(Enable),
    .Initialize(Initialize),
    .Crc(Crc),
    .CrcError(CrcError)
  );

  // Clock generation
  initial begin
    Clk = 0;
    forever #5 Clk = ~Clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    Reset = 1;
    Enable = 0;
    Initialize = 0;
    Data = 4'b0000;

    // Release reset
    #10 Reset = 0;

    // Initialize CRC
    Initialize = 1;
    #10 Initialize = 0;

    // Send data to compute CRC
    Enable = 1;

    // Example data sequence (this should be replaced with actual data for CRC calculation)
    Data = 4'b1010; #10;
    Data = 4'b1100; #10;
    Data = 4'b0110; #10;
    Data = 4'b0011; #10;

    // Disable Enable to finalize CRC calculation
    Enable = 0;
    #10;

    // Check the CRC result
    if (Crc != 32'hc704dd7b) begin
      $display("FAIL: CRC mismatch, expected 0xC704DD7B but got 0x%h", Crc);
      $finish;
    end

    // Check for CRC error signal
    if (CrcError != 1'b0) begin
      $display("FAIL: CrcError should be low when CRC is correct");
      $finish;
    end

    // Final check for successful completion
    $display("PASS");
    $finish;
  end

endmodule