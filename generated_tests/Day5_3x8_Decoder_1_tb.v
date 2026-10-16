`timescale 1ns/1ps

module tb_Day5_3x8_Decoder;

  reg [2:0] state;
  wire [7:0] bus;

  // Instantiate the module under test
  Day5_3x8_Decoder uut (
    .state(state),
    .bus(bus)
  );

  initial begin
    // Test all possible states
    state = 3'b000; #10;
    if (bus !== 8'b00000001) begin
      $display("FAIL: Expected bus=00000001 for state=000, got bus=%b", bus);
      $finish;
    end

    state = 3'b001; #10;
    if (bus !== 8'b00000010) begin
      $display("FAIL: Expected bus=00000010 for state=001, got bus=%b", bus);
      $finish;
    end

    state = 3'b010; #10;
    if (bus !== 8'b00000100) begin
      $display("FAIL: Expected bus=00000100 for state=010, got bus=%b", bus);
      $finish;
    end

    state = 3'b011; #10;
    if (bus !== 8'b00001000) begin
      $display("FAIL: Expected bus=00001000 for state=011, got bus=%b", bus);
      $finish;
    end

    state = 3'b100; #10;
    if (bus !== 8'b00010000) begin
      $display("FAIL: Expected bus=00010000 for state=100, got bus=%b", bus);
      $finish;
    end

    state = 3'b101; #10;
    if (bus !== 8'b00100000) begin
      $display("FAIL: Expected bus=00100000 for state=101, got bus=%b", bus);
      $finish;
    end

    state = 3'b110; #10;
    if (bus !== 8'b01000000) begin
      $display("FAIL: Expected bus=01000000 for state=110, got bus=%b", bus);
      $finish;
    end

    state = 3'b111; #10;
    if (bus !== 8'b10000000) begin
      $display("FAIL: Expected bus=10000000 for state=111, got bus=%b", bus);
      $finish;
    end

    // Test default case
    state = 3'bxxx; #10; // Invalid state
    if (bus !== 8'b00000000) begin
      $display("FAIL: Expected bus=00000000 for invalid state, got bus=%b", bus);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule