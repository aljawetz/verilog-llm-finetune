`timescale 1ns/1ps

module tb_mem;

   reg clk;
   reg wr;
   reg [9:0] addr;
   reg [7:0] d_i;
   wire [7:0] d_o;

   // Instantiate the memory module
   mem uut (
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
      d_i = 8'b0;

      // Test 1: Write to address 0
      addr = 10'd0;
      d_i = 8'hAA; // Data to write
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle

      // Check if data at address 0 is correct
      if (d_o !== 8'hAA) begin
         $display("FAIL: Data at address 0 is incorrect. Expected 0xAA, got %h", d_o);
         $finish;
      end

      // Test 2: Write to address 1
      addr = 10'd1;
      d_i = 8'hBB; // Data to write
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle

      // Check if data at address 1 is correct
      if (d_o !== 8'hBB) begin
         $display("FAIL: Data at address 1 is incorrect. Expected 0xBB, got %h", d_o);
         $finish;
      end

      // Test 3: Write to address 2
      addr = 10'd2;
      d_i = 8'hCC; // Data to write
      wr = 1; // Enable write
      #10; // Wait for one clock cycle
      wr = 0; // Disable write
      #10; // Wait for one clock cycle

      // Check if data at address 2 is correct
      if (d_o !== 8'hCC) begin
         $display("FAIL: Data at address 2 is incorrect. Expected 0xCC, got %h", d_o);
         $finish;
      end

      // Test 4: Verify previous writes
      addr = 10'd0; #10;
      if (d_o !== 8'hAA) begin
         $display("FAIL: Data at address 0 is incorrect after previous writes. Expected 0xAA, got %h", d_o);
         $finish;
      end

      addr = 10'd1; #10;
      if (d_o !== 8'hBB) begin
         $display("FAIL: Data at address 1 is incorrect after previous writes. Expected 0xBB, got %h", d_o);
         $finish;
      end

      addr = 10'd2; #10;
      if (d_o !== 8'hCC) begin
         $display("FAIL: Data at address 2 is incorrect after previous writes. Expected 0xCC, got %h", d_o);
         $finish;
      end

      // Indicate all tests passed
      $display("PASS");
      $finish;
   end

endmodule