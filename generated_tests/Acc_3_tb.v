`timescale 1ns/1ps

module tb_Acc;

  reg LA;
  reg EA;
  reg clk;
  reg clr;
  reg [7:0] Acc_in;
  wire [7:0] Acc_out_Bus;
  wire [7:0] Acc_out_Su;

  // Instantiate the module under test
  Acc uut (
    .LA(LA),
    .EA(EA),
    .clk(clk),
    .clr(clr),
    .Acc_in(Acc_in),
    .Acc_out_Bus(Acc_out_Bus),
    .Acc_out_Su(Acc_out_Su)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    LA = 0;
    EA = 0;
    clr = 0;
    Acc_in = 8'b0;

    // Test 1: Clear the accumulator
    clr = 1; #10;
    clr = 0; #10;
    if (Acc_out_Su !== 8'b0) begin
      $display("FAIL: Accumulator not cleared");
      $finish;
    end

    // Test 2: Load value into accumulator
    Acc_in = 8'b10101010; // Load this value
    LA = 1; #10;
    LA = 0; #10;
    if (Acc_out_Su !== 8'b10101010) begin
      $display("FAIL: Accumulator did not load value");
      $finish;
    end

    // Test 3: Check output on Acc_out_Bus with EA low
    EA = 0; #10;
    if (Acc_out_Bus !== 8'bz) begin
      $display("FAIL: Acc_out_Bus should be high impedance when EA is low");
      $finish;
    end

    // Test 4: Check output on Acc_out_Bus with EA high
    EA = 1; #10;
    if (Acc_out_Bus !== 8'b10101010) begin
      $display("FAIL: Acc_out_Bus did not reflect accumulator value when EA is high");
      $finish;
    end

    // Test 5: Clear the accumulator again
    clr = 1; #10;
    clr = 0; #10;
    if (Acc_out_Su !== 8'b0) begin
      $display("FAIL: Accumulator not cleared on second clear");
      $finish;
    end

    // Test 6: Load another value into accumulator
    Acc_in = 8'b11110000; // Load this value
    LA = 1; #10;
    LA = 0; #10;
    if (Acc_out_Su !== 8'b11110000) begin
      $display("FAIL: Accumulator did not load new value");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule