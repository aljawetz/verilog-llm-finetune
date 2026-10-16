`timescale 1ns/1ps

module tb_demux_1x8;

  reg data;
  reg [2:0] sel;
  wire [7:0] y;

  // Instantiate the module under test
  demux_1x8 uut (
    .data(data),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Initialize inputs
    data = 0;
    sel = 3'b000;

    // Test case 1: Select 0, data = 1
    data = 1; sel = 3'b000; #10;
    if (y !== 8'b00000001) $display("FAIL: Test case 1 failed");
    
    // Test case 2: Select 1, data = 1
    data = 1; sel = 3'b001; #10;
    if (y !== 8'b00000010) $display("FAIL: Test case 2 failed");
    
    // Test case 3: Select 2, data = 1
    data = 1; sel = 3'b010; #10;
    if (y !== 8'b00000100) $display("FAIL: Test case 3 failed");
    
    // Test case 4: Select 3, data = 1
    data = 1; sel = 3'b011; #10;
    if (y !== 8'b00001000) $display("FAIL: Test case 4 failed");
    
    // Test case 5: Select 4, data = 1
    data = 1; sel = 3'b100; #10;
    if (y !== 8'b00010000) $display("FAIL: Test case 5 failed");
    
    // Test case 6: Select 5, data = 1
    data = 1; sel = 3'b101; #10;
    if (y !== 8'b00100000) $display("FAIL: Test case 6 failed");
    
    // Test case 7: Select 6, data = 1
    data = 1; sel = 3'b110; #10;
    if (y !== 8'b01000000) $display("FAIL: Test case 7 failed");
    
    // Test case 8: Select 7, data = 1
    data = 1; sel = 3'b111; #10;
    if (y !== 8'b10000000) $display("FAIL: Test case 8 failed");

    // Test case 9: Select 0, data = 0
    data = 0; sel = 3'b000; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 9 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule