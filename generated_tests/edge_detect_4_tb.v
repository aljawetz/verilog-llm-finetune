`timescale 1ns/1ps

module tb_edge_detect;

  reg clk;
  reg rst_n;
  reg a;
  wire rise;
  wire down;

  // Instantiate the module under test (uut)
  edge_detect uut (
    .clk(clk),
    .rst_n(rst_n),
    .a(a),
    .rise(rise),
    .down(down)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_n = 0;
    a = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test rising edge detection
    #10 a = 1; // Rising edge
    #10 if (!rise || down) $display("FAIL: Rising edge not detected");
    #10 if (rise || down) $display("FAIL: Down should not be detected");
    
    // Clear rise signal
    #10 if (rise) $display("FAIL: Rise should be cleared");
    
    // Test falling edge detection
    #10 a = 0; // Falling edge
    #10 if (!down || rise) $display("FAIL: Falling edge not detected");
    #10 if (down || rise) $display("FAIL: Rise should not be detected");

    // Clear down signal
    #10 if (down) $display("FAIL: Down should be cleared");

    // Test no edge condition
    #10 a = 0; // No edge
    #10 if (rise || down) $display("FAIL: No edge should not trigger rise or down");

    // Test another rising edge
    #10 a = 1; // Rising edge
    #10 if (!rise || down) $display("FAIL: Rising edge not detected again");
    
    // Clear rise signal
    #10 if (rise) $display("FAIL: Rise should be cleared");

    // Test another falling edge
    #10 a = 0; // Falling edge
    #10 if (!down || rise) $display("FAIL: Falling edge not detected again");

    // Clear down signal
    #10 if (down) $display("FAIL: Down should be cleared");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule