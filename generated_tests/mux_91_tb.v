`timescale 1ns/1ps

module tb_mux;
  reg [7:0] a;
  reg [2:0] s;
  wire y;

  // Instantiate the module under test (uut)
  mux uut (
    .a(a),
    .s(s),
    .y(y)
  );

  initial begin
    // Test sequence
    a = 8'b10101010; // Set input vector
    s = 3'b000; #10; // Select a[0]
    if (y !== a[0]) $display("FAIL: Expected %b, got %b for s=%b", a[0], y, s);
    
    s = 3'b001; #10; // Select a[1]
    if (y !== a[1]) $display("FAIL: Expected %b, got %b for s=%b", a[1], y, s);
    
    s = 3'b010; #10; // Select a[2]
    if (y !== a[2]) $display("FAIL: Expected %b, got %b for s=%b", a[2], y, s);
    
    s = 3'b011; #10; // Select a[3]
    if (y !== a[3]) $display("FAIL: Expected %b, got %b for s=%b", a[3], y, s);
    
    s = 3'b100; #10; // Select a[4]
    if (y !== a[4]) $display("FAIL: Expected %b, got %b for s=%b", a[4], y, s);
    
    s = 3'b101; #10; // Select a[5]
    if (y !== a[5]) $display("FAIL: Expected %b, got %b for s=%b", a[5], y, s);
    
    s = 3'b110; #10; // Select a[6]
    if (y !== a[6]) $display("FAIL: Expected %b, got %b for s=%b", a[6], y, s);
    
    s = 3'b111; #10; // Select a[7]
    if (y !== a[7]) $display("FAIL: Expected %b, got %b for s=%b", a[7], y, s);
    
    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule