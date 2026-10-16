`timescale 1ns/1ps

module tb_mux_2to1;

  // Inputs
  reg [1:0] data;
  reg sel;

  // Output
  wire out;

  // Instantiate the Unit Under Test (UUT)
  mux_2to1 uut (
    .data(data),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 0, expect out = data[0]
    data = 2'b01; // data[0] = 1, data[1] = 0
    sel = 1'b0;
    #10; // Wait for 10 time units
    if (out !== data[0]) begin
      $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", data[0], out);
      $finish;
    end

    // Test case 2: sel = 1, expect out = data[1]
    data = 2'b10; // data[0] = 0, data[1] = 1
    sel = 1'b1;
    #10; // Wait for 10 time units
    if (out !== data[1]) begin
      $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", data[1], out);
      $finish;
    end

    // Test case 3: sel = 0, expect out = data[0]
    data = 2'b11; // data[0] = 1, data[1] = 1
    sel = 1'b0;
    #10; // Wait for 10 time units
    if (out !== data[0]) begin
      $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", data[0], out);
      $finish;
    end

    // Test case 4: sel = 1, expect out = data[1]
    data = 2'b00; // data[0] = 0, data[1] = 0
    sel = 1'b1;
    #10; // Wait for 10 time units
    if (out !== data[1]) begin
      $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", data[1], out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule