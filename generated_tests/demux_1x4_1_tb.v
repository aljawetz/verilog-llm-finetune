`timescale 1ns/1ps

module tb_demux_1x4;

  reg data;
  reg [1:0] sel;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  demux_1x4 uut (
    .sel(sel),
    .data(data),
    .y(y)
  );

  initial begin
    // Test case 1: Select 00, expect y[0] = 1
    data = 1; sel = 2'b00; #10;
    if (y !== 4'b0001) $display("FAIL: Test case 1 failed, expected y = 0001, got y = %b", y);

    // Test case 2: Select 01, expect y[1] = 1
    data = 1; sel = 2'b01; #10;
    if (y !== 4'b0010) $display("FAIL: Test case 2 failed, expected y = 0010, got y = %b", y);

    // Test case 3: Select 10, expect y[2] = 1
    data = 1; sel = 2'b10; #10;
    if (y !== 4'b0100) $display("FAIL: Test case 3 failed, expected y = 0100, got y = %b", y);

    // Test case 4: Select 11, expect y[3] = 1
    data = 1; sel = 2'b11; #10;
    if (y !== 4'b1000) $display("FAIL: Test case 4 failed, expected y = 1000, got y = %b", y);

    // Test case 5: Data = 0, expect all outputs to be 0
    data = 0; sel = 2'b00; #10;
    if (y !== 4'b0000) $display("FAIL: Test case 5 failed, expected y = 0000, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule