`timescale 1ns/1ps

module tb_cdc_sync_wr2rd;

   parameter ADDRSIZE = 4;
   parameter CLK_PERIOD = 10;

   reg rd_clk;
   reg rd_rst;
   reg [ADDRSIZE:0] wr_ptr;
   wire [ADDRSIZE:0] rdq2_wrptr;

   // Instantiate the module under test
   cdc_sync_wr2rd uut (
      .rdq2_wrptr(rdq2_wrptr),
      .rd_clk(rd_clk),
      .rd_rst(rd_rst),
      .wr_ptr(wr_ptr)
   );

   // Clock generation
   initial begin
      rd_clk = 0;
      forever #(CLK_PERIOD/2) rd_clk = ~rd_clk;
   end

   // Test sequence
   initial begin
      // Initialize
      rd_rst = 0;
      wr_ptr = 5'b00000;
      #15; // Wait for a few clock cycles

      // Release reset
      rd_rst = 1;
      #10;

      // Test case 1: Check initial synchronization
      if (rdq2_wrptr !== 5'b00000) begin
         $display("FAIL: Initial rdq2_wrptr should be 0");
         $finish;
      end

      // Test case 2: Change wr_ptr and check synchronization
      wr_ptr = 5'b00001;
      #CLK_PERIOD; // Wait for one clock cycle
      if (rdq2_wrptr !== 5'b00000) begin
         $display("FAIL: rdq2_wrptr should still be 0 after one clock cycle");
         $finish;
      end

      // Test case 3: Allow wr_ptr to propagate
      #CLK_PERIOD; // Wait for another clock cycle
      if (rdq2_wrptr !== 5'b00001) begin
         $display("FAIL: rdq2_wrptr should be 1 after two clock cycles");
         $finish;
      end

      // Test case 4: Change wr_ptr again
      wr_ptr = 5'b00010;
      #CLK_PERIOD; // Wait for one clock cycle
      if (rdq2_wrptr !== 5'b00001) begin
         $display("FAIL: rdq2_wrptr should still be 1 after one clock cycle");
         $finish;
      end

      // Test case 5: Allow wr_ptr to propagate again
      #CLK_PERIOD; // Wait for another clock cycle
      if (rdq2_wrptr !== 5'b00010) begin
         $display("FAIL: rdq2_wrptr should be 2 after two clock cycles");
         $finish;
      end

      // Test case 6: Reset the system
      rd_rst = 0;
      #CLK_PERIOD; // Wait for one clock cycle
      rd_rst = 1;
      #CLK_PERIOD; // Wait for one clock cycle
      if (rdq2_wrptr !== 5'b00000) begin
         $display("FAIL: rdq2_wrptr should be 0 after reset");
         $finish;
      end

      // Test case 7: Final check with a new wr_ptr
      wr_ptr = 5'b00111;
      #CLK_PERIOD; // Wait for one clock cycle
      #CLK_PERIOD; // Wait for another clock cycle
      if (rdq2_wrptr !== 5'b00111) begin
         $display("FAIL: rdq2_wrptr should be 7 after two clock cycles");
         $finish;
      end

      $display("PASS");
      $finish;
   end

endmodule