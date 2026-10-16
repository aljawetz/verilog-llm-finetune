`timescale 1ns/1ps

module tb_jarbitraryCounter;
  reg clock;
  reg reset;
  wire [2:0] OUTPUT;
  
  // Instantiate the module under test
  jarbitraryCounter uut (
    .OUTPUT(OUTPUT),
    .clock(clock),
    .reset(reset)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    reset = 1; // Assert reset
    #10; // Wait for a clock cycle
    reset = 0; // Deassert reset

    // Test counting from 0 to 5
    #10; if (OUTPUT !== 3'b000) $display("FAIL: Expected OUTPUT 000, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b001) $display("FAIL: Expected OUTPUT 001, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b010) $display("FAIL: Expected OUTPUT 010, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b011) $display("FAIL: Expected OUTPUT 011, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b110) $display("FAIL: Expected OUTPUT 110, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b101) $display("FAIL: Expected OUTPUT 101, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b111) $display("FAIL: Expected OUTPUT 111, got %b", OUTPUT);

    // Test reset functionality
    reset = 1; // Assert reset
    #10; // Wait for a clock cycle
    reset = 0; // Deassert reset
    #10; if (OUTPUT !== 3'b000) $display("FAIL: Expected OUTPUT 000 after reset, got %b", OUTPUT);

    // Test counting after reset
    #10; if (OUTPUT !== 3'b001) $display("FAIL: Expected OUTPUT 001, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b010) $display("FAIL: Expected OUTPUT 010, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b011) $display("FAIL: Expected OUTPUT 011, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b110) $display("FAIL: Expected OUTPUT 110, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b101) $display("FAIL: Expected OUTPUT 101, got %b", OUTPUT);
    #10; if (OUTPUT !== 3'b111) $display("FAIL: Expected OUTPUT 111, got %b", OUTPUT);
    
    // Final check to ensure it wraps around to 000
    #10; if (OUTPUT !== 3'b000) $display("FAIL: Expected OUTPUT 000 after reaching 6, got %b", OUTPUT);

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule