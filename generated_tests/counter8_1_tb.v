`timescale 1ns/1ps

module tb_counter8;

  reg INC_END, INC_START, DEC_END, DEC_START;
  reg RESETn, MODE_SEL, CLR, CLK, HOLD, LOAD;
  reg [7:0] DIN;
  wire [7:0] DOUT;

  // Instantiate the counter8 module
  counter8 uut (
    .INC_END(INC_END),
    .INC_START(INC_START),
    .DEC_END(DEC_END),
    .DEC_START(DEC_START),
    .RESETn(RESETn),
    .MODE_SEL(MODE_SEL),
    .CLR(CLR),
    .CLK(CLK),
    .HOLD(HOLD),
    .LOAD(LOAD),
    .DIN(DIN),
    .DOUT(DOUT)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    RESETn = 0; INC_END = 0; INC_START = 0; DEC_END = 0; DEC_START = 0;
    MODE_SEL = 0; CLR = 0; HOLD = 0; LOAD = 0; DIN = 8'b00000000;

    // Reset the counter
    #10 RESETn = 1; // Release reset
    #10;

    // Test clear functionality
    CLR = 1; #10;
    if (DOUT !== 8'b00000000) begin
      $display("FAIL: Clear functionality failed");
      $finish;
    end
    CLR = 0;

    // Test load functionality
    DIN = 8'b00001111; LOAD = 1; #10;
    LOAD = 0;
    if (DOUT !== 8'b00001111) begin
      $display("FAIL: Load functionality failed");
      $finish;
    end

    // Test increment functionality
    MODE_SEL = 1; INC_START = 1; #10;
    INC_START = 0; #10;
    if (DOUT !== 8'b00010000) begin
      $display("FAIL: Increment functionality failed");
      $finish;
    end

    // Test decrement functionality
    MODE_SEL = 0; DEC_START = 1; #10;
    DEC_START = 0; #10;
    if (DOUT !== 8'b00001111) begin
      $display("FAIL: Decrement functionality failed");
      $finish;
    end

    // Test hold functionality
    HOLD = 1; #10;
    if (DOUT !== 8'b00001111) begin
      $display("FAIL: Hold functionality failed");
      $finish;
    end
    HOLD = 0;

    // Test reset functionality
    RESETn = 0; #10; // Assert reset
    RESETn = 1; #10; // Release reset
    if (DOUT !== 8'b00000000) begin
      $display("FAIL: Reset functionality failed");
      $finish;
    end

    // Test clear again
    CLR = 1; #10;
    if (DOUT !== 8'b00000000) begin
      $display("FAIL: Clear functionality failed again");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule