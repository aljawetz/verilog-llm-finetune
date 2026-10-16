`timescale 1ns/1ps

module tb_cdc_sync_2ff;

   reg rd_clk;
   reg wr_p;
   reg rst;
   wire rd_p;

   // Instantiate the module under test (uut)
   cdc_sync_2ff uut (
      .rd_p(rd_p),
      .rd_clk(rd_clk),
      .wr_p(wr_p),
      .rst(rst)
   );

   // Clock generation
   initial begin
      rd_clk = 0;
      forever #5 rd_clk = ~rd_clk; // 10ns clock period
   end

   // Test sequence
   initial begin
      // Initialize signals
      rst = 1;
      wr_p = 0;

      // Apply reset
      #10;
      rst = 0;

      // Test case 1: Check output when wr_p is low
      #10;
      if (rd_p !== 0) begin
         $display("FAIL: Expected rd_p = 0 when wr_p = 0");
         $finish;
      end

      // Test case 2: Set wr_p high and check output
      wr_p = 1;
      #10;
      if (rd_p !== 0) begin
         $display("FAIL: Expected rd_p = 0 after one clock cycle with wr_p = 1");
         $finish;
      end

      // Test case 3: Check output after two clock cycles
      #10;
      if (rd_p !== 1) begin
         $display("FAIL: Expected rd_p = 1 after two clock cycles with wr_p = 1");
         $finish;
      end

      // Test case 4: Set wr_p low and check output
      wr_p = 0;
      #10;
      if (rd_p !== 1) begin
         $display("FAIL: Expected rd_p = 1 after wr_p goes low");
         $finish;
      end

      // Test case 5: Check output after another clock cycle
      #10;
      if (rd_p !== 0) begin
         $display("FAIL: Expected rd_p = 0 after another clock cycle with wr_p = 0");
         $finish;
      end

      // Test case 6: Reset the system
      rst = 1;
      #10;
      rst = 0;
      #10;
      if (rd_p !== 0) begin
         $display("FAIL: Expected rd_p = 0 after reset");
         $finish;
      end

      // If all tests pass
      $display("PASS");
      $finish;
   end

endmodule