`timescale 1ns/1ps

module tb_priority_encoder_4x2;

  reg [3:0] w;
  reg en;
  wire [1:0] y;
  wire z;

  // Instantiate the module under test
  priority_encoder_4x2 uut (
    .w(w),
    .en(en),
    .y(y),
    .z(z)
  );

  initial begin
    // Initialize inputs
    w = 4'b0000;
    en = 0;

    // Test case 1: Enable with no inputs
    #10 en = 1; w = 4'b0000; // Expect y = xx
    #10 if (y !== 2'bxx) $display("FAIL: Test case 1 failed, expected y = xx, got y = %b", y);

    // Test case 2: Enable with input 1
    #10 w = 4'b0001; // Expect y = 00
    #10 if (y !== 2'b00) $display("FAIL: Test case 2 failed, expected y = 00, got y = %b", y);

    // Test case 3: Enable with input 2
    #10 w = 4'b0010; // Expect y = 01
    #10 if (y !== 2'b01) $display("FAIL: Test case 3 failed, expected y = 01, got y = %b", y);

    // Test case 4: Enable with input 3
    #10 w = 4'b0100; // Expect y = 10
    #10 if (y !== 2'b10) $display("FAIL: Test case 4 failed, expected y = 10, got y = %b", y);

    // Test case 5: Enable with input 4
    #10 w = 4'b1000; // Expect y = 11
    #10 if (y !== 2'b11) $display("FAIL: Test case 5 failed, expected y = 11, got y = %b", y);

    // Test case 6: Enable with multiple inputs
    #10 w = 4'b1100; // Expect y = 11 (highest priority)
    #10 if (y !== 2'b11) $display("FAIL: Test case 6 failed, expected y = 11, got y = %b", y);

    // Test case 7: Disable the encoder
    #10 en = 0; w = 4'b1111; // Expect y = xx
    #10 if (y !== 2'bxx) $display("FAIL: Test case 7 failed, expected y = xx, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule