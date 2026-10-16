`timescale 1ns/1ps

module tb_mem_disp;

   reg clk;
   reg wr;
   reg [9:0] addr;
   reg d_i;
   wire d_o;

   // Instantiate the module under test (uut)
   mem_disp uut (
      .clk(clk),
      .wr(wr),
      .addr(addr),
      .d_i(d_i),
      .d_o(d_o)
   );

   // Clock generation
   initial begin
      clk = 0;
      forever #5 clk = ~clk; // 10ns clock period
   end

   // Test sequence
   initial begin
      // Initialize signals
      wr = 0;
      addr = 10'b0;
      d_i = 0;

      // Test writing and reading from memory
      // Write to address 0
      addr = 10'b0000000000;
      d_i = 1;
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle

      // Check if the value at address 0 is correct
      if (d_o !== 1) begin
         $display("FAIL: Expected d_o at addr 0 to be 1, got %b", d_o);
         $finish;
      end

      // Write to address 1
      addr = 10'b0000000001;
      d_i = 0;
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle

      // Check if the value at address 1 is correct
      if (d_o !== 0) begin
         $display("FAIL: Expected d_o at addr 1 to be 0, got %b", d_o);
         $finish;
      end

      // Write to address 2
      addr = 10'b0000000010;
      d_i = 1;
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle

      // Check if the value at address 2 is correct
      if (d_o !== 1) begin
         $display("FAIL: Expected d_o at addr 2 to be 1, got %b", d_o);
         $finish;
      end

      // Write to address 2 again with a different value
      addr = 10'b0000000010;
      d_i = 0;
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle

      // Check if the value at address 2 is updated correctly
      if (d_o !== 0) begin
         $display("FAIL: Expected d_o at addr 2 to be 0 after write, got %b", d_o);
         $finish;
      end

      // Write to address 1023
      addr = 10'b1111111111;
      d_i = 1;
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle

      // Check if the value at address 1023 is correct
      addr = 10'b1111111111; // Set address to 1023
      #10; // Wait for one clock cycle
      if (d_o !== 1) begin
         $display("FAIL: Expected d_o at addr 1023 to be 1, got %b", d_o);
         $finish;
      end

      // If all tests pass
      $display("PASS");
      $finish;
   end

endmodule