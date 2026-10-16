`timescale 1ns/1ps

module tb_parity_generator;

  reg load;
  reg [3:0] txdata;
  wire parity;

  // Instantiate the module under test (uut)
  parity_generator uut (
    .parity(parity),
    .load(load),
    .txdata(txdata)
  );

  initial begin
    // Test case 1: Load is high, txdata = 4'b0000
    load = 1;
    txdata = 4'b0000;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // Test case 2: Load is high, txdata = 4'b0001
    txdata = 4'b0001;
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected parity 1, got %b", parity);
      $finish;
    end

    // Test case 3: Load is high, txdata = 4'b0011
    txdata = 4'b0011;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // Test case 4: Load is high, txdata = 4'b1111
    txdata = 4'b1111;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // Test case 5: Load is low, txdata = 4'b1010
    load = 0;
    txdata = 4'b1010;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // Test case 6: Load is low, txdata = 4'b1100
    txdata = 4'b1100;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 6 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule