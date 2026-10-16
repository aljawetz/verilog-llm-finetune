`timescale 1ns/1ps

module tb_Demux14;
  reg [1:0] A;
  reg din;
  wire [3:0] Y;

  // Instantiate the Demux14 module
  Demux14 uut (
    .Y(Y),
    .A(A),
    .din(din)
  );

  initial begin
    // Test case 1: Select output 0
    din = 1; A = 2'b00; #10;
    if (Y !== 4'b0001) $display("FAIL: Test case 1 failed, expected Y=0001, got Y=%b", Y);

    // Test case 2: Select output 1
    din = 1; A = 2'b01; #10;
    if (Y !== 4'b0010) $display("FAIL: Test case 2 failed, expected Y=0010, got Y=%b", Y);

    // Test case 3: Select output 2
    din = 1; A = 2'b10; #10;
    if (Y !== 4'b0100) $display("FAIL: Test case 3 failed, expected Y=0100, got Y=%b", Y);

    // Test case 4: Select output 3
    din = 1; A = 2'b11; #10;
    if (Y !== 4'b1000) $display("FAIL: Test case 4 failed, expected Y=1000, got Y=%b", Y);

    // Test case 5: Check all outputs are low when din is 0
    din = 0; A = 2'b00; #10;
    if (Y !== 4'b0000) $display("FAIL: Test case 5 failed, expected Y=0000, got Y=%b", Y);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule