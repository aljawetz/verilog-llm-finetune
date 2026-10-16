`timescale 1ns/1ps

module tb_more_ovr;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  more_ovr uut (
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .z(z)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    x = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test sequence
    // State S0
    #10; x = 0; // Next state should be S1
    #10; if (uut.state !== 4'd1) $display("FAIL: Expected state S1, got %d", uut.state);

    // State S1
    #10; x = 0; // Stay in S1
    #10; if (uut.state !== 4'd1) $display("FAIL: Expected state S1, got %d", uut.state);
    
    #10; x = 1; // Next state should be S2
    #10; if (uut.state !== 4'd2) $display("FAIL: Expected state S2, got %d", uut.state);

    // State S2
    #10; x = 0; // Next state should be S1
    #10; if (uut.state !== 4'd1) $display("FAIL: Expected state S1, got %d", uut.state);
    
    #10; x = 1; // Next state should be S3
    #10; if (uut.state !== 4'd3) $display("FAIL: Expected state S3, got %d", uut.state);

    // State S3
    #10; x = 0; // Next state should be S4
    #10; if (uut.state !== 4'd4) $display("FAIL: Expected state S4, got %d", uut.state);
    
    #10; x = 1; // Next state should be S0
    #10; if (uut.state !== 4'd0) $display("FAIL: Expected state S0, got %d", uut.state);

    // State S0 again
    #10; x = 0; // Next state should be S1
    #10; if (uut.state !== 4'd1) $display("FAIL: Expected state S1, got %d", uut.state);

    // Check output z
    #10; if (uut.z !== 0) $display("FAIL: Expected z = 0, got %d", uut.z);
    
    #10; x = 1; // Next state should be S2
    #10; if (uut.z !== 0) $display("FAIL: Expected z = 0, got %d", uut.z);
    
    #10; x = 0; // Next state should be S1
    #10; if (uut.z !== 0) $display("FAIL: Expected z = 0, got %d", uut.z);
    
    #10; x = 1; // Next state should be S3
    #10; if (uut.z !== 0) $display("FAIL: Expected z = 0, got %d", uut.z);
    
    #10; x = 0; // Next state should be S4
    #10; if (uut.z !== 1) $display("FAIL: Expected z = 1, got %d", uut.z);
    
    #10; x = 1; // Next state should be S0
    #10; if (uut.z !== 0) $display("FAIL: Expected z = 0, got %d", uut.z);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule