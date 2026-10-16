`timescale 1ns/1ps

module tb_demux1_4;

  reg in;
  reg [1:0] sel;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  demux1_4 uut (
    .in(in),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Test case 1: Select output 0
    in = 1'b1; sel = 2'b00; #10;
    if (y !== 4'b0001) $display("FAIL: Test case 1 failed, expected 0001, got %b", y);

    // Test case 2: Select output 1
    in = 1'b1; sel = 2'b01; #10;
    if (y !== 4'b0010) $display("FAIL: Test case 2 failed, expected 0010, got %b", y);

    // Test case 3: Select output 2
    in = 1'b1; sel = 2'b10; #10;
    if (y !== 4'b0100) $display("FAIL: Test case 3 failed, expected 0100, got %b", y);

    // Test case 4: Select output 3
    in = 1'b1; sel = 2'b11; #10;
    if (y !== 4'b1000) $display("FAIL: Test case 4 failed, expected 1000, got %b", y);

    // Test case 5: Check all outputs are zero when input is 0
    in = 1'b0; sel = 2'b00; #10;
    if (y !== 4'b0000) $display("FAIL: Test case 5 failed, expected 0000, got %b", y);

    // Test case 6: Check all outputs are zero when input is 0 and different select
    in = 1'b0; sel = 2'b01; #10;
    if (y !== 4'b0000) $display("FAIL: Test case 6 failed, expected 0000, got %b", y);

    // Test case 7: Check all outputs are zero when input is 0 and different select
    in = 1'b0; sel = 2'b10; #10;
    if (y !== 4'b0000) $display("FAIL: Test case 7 failed, expected 0000, got %b", y);

    // Test case 8: Check all outputs are zero when input is 0 and different select
    in = 1'b0; sel = 2'b11; #10;
    if (y !== 4'b0000) $display("FAIL: Test case 8 failed, expected 0000, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule