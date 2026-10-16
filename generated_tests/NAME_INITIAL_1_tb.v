`timescale 1ns/1ps

module tb_NAME_INITIAL;

  reg [1:0] x;
  reg [1:0] y;
  reg [1:0] z;
  wire [6:0] led0;
  wire [6:0] led1;
  wire [6:0] led2;

  // Instantiate the module under test
  NAME_INITIAL uut (
    .x(x),
    .y(y),
    .z(z),
    .led0(led0),
    .led1(led1),
    .led2(led2)
  );

  initial begin
    // Test case 1: x = 0, y = 1, z = 2
    x = 2'b00; y = 2'b01; z = 2'b10;
    #10;
    if (led2 !== 7'b0111000) $display("FAIL: led2 should be F for x=0");
    if (led1 !== 7'b0000000) $display("FAIL: led1 should be B for y=1");
    if (led0 !== 7'b0001000) $display("FAIL: led0 should be A for z=2");

    // Test case 2: x = 1, y = 0, z = 0
    x = 2'b01; y = 2'b00; z = 2'b00;
    #10;
    if (led2 !== 7'bx) $display("FAIL: led2 should be unknown for x=1");
    if (led1 !== 7'bx) $display("FAIL: led1 should be unknown for y=0");
    if (led0 !== 7'bx) $display("FAIL: led0 should be unknown for z=0");

    // Test case 3: x = 2, y = 2, z = 2
    x = 2'b10; y = 2'b10; z = 2'b10;
    #10;
    if (led2 !== 7'bx) $display("FAIL: led2 should be unknown for x=2");
    if (led1 !== 7'bx) $display("FAIL: led1 should be unknown for y=2");
    if (led0 !== 7'bx) $display("FAIL: led0 should be unknown for z=2");

    // Test case 4: x = 0, y = 1, z = 0
    x = 2'b00; y = 2'b01; z = 2'b00;
    #10;
    if (led2 !== 7'b0111000) $display("FAIL: led2 should be F for x=0");
    if (led1 !== 7'b0000000) $display("FAIL: led1 should be B for y=1");
    if (led0 !== 7'bx) $display("FAIL: led0 should be unknown for z=0");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule