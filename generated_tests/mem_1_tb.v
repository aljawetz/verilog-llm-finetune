`timescale 1ns/1ps

module tb_mem;

   reg clk;
   reg wr;
   reg [9:0] addr;
   reg [7:0] d_i;
   wire [7:0] d_o;

   // Instantiate the module under test (uut)
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
      addr = 10'b0000000000; // Address 0
      d_i = 8'b10101010;      // Data to write
      wr = 1;                 // Enable write
      #10;                    // Wait for one clock cycle
      wr = 0;                 // Disable write
      #10;                    // Wait for one clock cycle

      // Check if the data is correctly written
      if (d_o !== 8'b10101010) begin
         $display("FAIL: Data at addr 0 is incorrect. Expected 10101010, got %b", d_o);
         $finish;
      end

      // Test 2: Write to address 1
      addr = 10'b0000000001; // Address 1
      d_i = 8'b11001100;      // Data to write
      wr = 1;                 // Enable write
      #10;                    // Wait for one clock cycle
      wr = 0;                 // Disable write
      #10;                    // Wait for one clock cycle

      // Check if the data is correctly written
      if (d_o !== 8'b11001100) begin
         $display("FAIL: Data at addr 1 is incorrect. Expected 11001100, got %b", d_o);
         $finish;
      end

      // Test 3: Read back data from address 0
      addr = 10'b0000000000; // Address 0
      #10;                    // Wait for one clock cycle

      if (d_o !== 8'b10101010) begin
         $display("FAIL: Data read from addr 0 is incorrect. Expected 10101010, got %b", d_o);
         $finish;
      end

      // Test 4: Read back data from address 1
      addr = 10'b0000000001; // Address 1
      #10;                    // Wait for one clock cycle

      if (d_o !== 8'b11001100) begin
         $display("FAIL: Data read from addr 1 is incorrect. Expected 11001100, got %b", d_o);
         $finish;
      end

      // If all tests pass
      $display("PASS");
      $finish;
   end

endmodule