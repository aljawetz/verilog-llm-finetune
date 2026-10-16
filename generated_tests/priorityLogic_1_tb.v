`timescale 1ns/1ps

module tb_priorityLogic;

  reg Sel;
  reg [1:0] reqIn;
  wire [1:0] reqOut;

  // Instantiate the module under test (uut)
  priorityLogic uut (
    .Sel(Sel),
    .reqIn(reqIn),
    .reqOut(reqOut)
  );

  initial begin
    // Test case 1: Sel is low, expect reqOut to be 00
    Sel = 0; reqIn = 2'b00; #10;
    if (reqOut !== 2'b00) begin
      $display("FAIL: Test case 1 failed, expected 00, got %b", reqOut);
      $finish;
    end

    // Test case 2: Sel is high, reqIn is 00, expect reqOut to be 00
    Sel = 1; reqIn = 2'b00; #10;
    if (reqOut !== 2'b00) begin
      $display("FAIL: Test case 2 failed, expected 00, got %b", reqOut);
      $finish;
    end

    // Test case 3: Sel is high, reqIn is 01, expect reqOut to be 01
    reqIn = 2'b01; #10;
    if (reqOut !== 2'b01) begin
      $display("FAIL: Test case 3 failed, expected 01, got %b", reqOut);
      $finish;
    end

    // Test case 4: Sel is high, reqIn is 10, expect reqOut to be 10
    reqIn = 2'b10; #10;
    if (reqOut !== 2'b10) begin
      $display("FAIL: Test case 4 failed, expected 10, got %b", reqOut);
      $finish;
    end

    // Test case 5: Sel is high, reqIn is 11, expect reqOut to be 01
    reqIn = 2'b11; #10;
    if (reqOut !== 2'b01) begin
      $display("FAIL: Test case 5 failed, expected 01, got %b", reqOut);
      $finish;
    end

    // Test case 6: Sel is low again, expect reqOut to be 00
    Sel = 0; reqIn = 2'b11; #10;
    if (reqOut !== 2'b00) begin
      $display("FAIL: Test case 6 failed, expected 00, got %b", reqOut);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule