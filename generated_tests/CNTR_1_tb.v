`timescale 1ns/1ps

module tb_CNTR;

  reg [15:0] din;
  reg ld;
  reg dec;
  reg clk;
  wire [15:0] dout;

  // Instantiate the CNTR module
  CNTR uut (
    .dout(dout),
    .din(din),
    .ld(ld),
    .dec(dec),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    ld = 0;
    dec = 0;
    din = 16'h0000;

    // Test 1: Load a value
    din = 16'h00FF; // Load 255
    ld = 1; // Assert load
    #10; // Wait for one clock cycle
    ld = 0; // Deassert load
    if (dout !== 16'h00FF) begin
      $display("FAIL: Expected dout = 0x00FF, got dout = 0x%h", dout);
      $finish;
    end

    // Test 2: Decrement the value
    dec = 1; // Assert decrement
    #10; // Wait for one clock cycle
    dec = 0; // Deassert decrement
    if (dout !== 16'h00FE) begin
      $display("FAIL: Expected dout = 0x00FE, got dout = 0x%h", dout);
      $finish;
    end

    // Test 3: Load a new value
    din = 16'h0010; // Load 16
    ld = 1; // Assert load
    #10; // Wait for one clock cycle
    ld = 0; // Deassert load
    if (dout !== 16'h0010) begin
      $display("FAIL: Expected dout = 0x0010, got dout = 0x%h", dout);
      $finish;
    end

    // Test 4: Decrement multiple times
    dec = 1; // Assert decrement
    #10; // Wait for one clock cycle
    if (dout !== 16'h000F) begin
      $display("FAIL: Expected dout = 0x000F, got dout = 0x%h", dout);
      $finish;
    end
    #10; // Wait for another clock cycle
    if (dout !== 16'h000E) begin
      $display("FAIL: Expected dout = 0x000E, got dout = 0x%h", dout);
      $finish;
    end
    dec = 0; // Deassert decrement

    // Test 5: Load a value and check
    din = 16'h000A; // Load 10
    ld = 1; // Assert load
    #10; // Wait for one clock cycle
    ld = 0; // Deassert load
    if (dout !== 16'h000A) begin
      $display("FAIL: Expected dout = 0x000A, got dout = 0x%h", dout);
      $finish;
    end

    // Test 6: Decrement to zero
    dec = 1; // Assert decrement
    #10; // Wait for one clock cycle
    if (dout !== 16'h0009) begin
      $display("FAIL: Expected dout = 0x0009, got dout = 0x%h", dout);
      $finish;
    end
    #10; // Wait for another clock cycle
    if (dout !== 16'h0008) begin
      $display("FAIL: Expected dout = 0x0008, got dout = 0x%h", dout);
      $finish;
    end
    #10; // Wait for another clock cycle
    if (dout !== 16'h0007) begin
      $display("FAIL: Expected dout = 0x0007, got dout = 0x%h", dout);
      $finish;
    end
    dec = 0; // Deassert decrement

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule