`timescale 1ns/1ps

module tb_4BitCounter;

	reg in_clk;
	reg in_reset;
	wire [3:0] out_count;

	// Instantiate the module under test (uut)
	_4BitCounter uut (
		.in_clk(in_clk),
		.in_reset(in_reset),
		.out_count(out_count)
	);

	// Clock generation
	initial begin
		in_clk = 0;
		forever #5 in_clk = ~in_clk; // 10ns clock period
	end

	// Test sequence
	initial begin
		in_reset = 1; // Assert reset
		#10;
		in_reset = 0; // Deassert reset

		// Check counts from 0 to 8
		#10; if (out_count !== 4'd0) $display("FAIL: Expected count 0, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd1) $display("FAIL: Expected count 1, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd2) $display("FAIL: Expected count 2, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd3) $display("FAIL: Expected count 3, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd4) $display("FAIL: Expected count 4, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd5) $display("FAIL: Expected count 5, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd6) $display("FAIL: Expected count 6, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd7) $display("FAIL: Expected count 7, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd8) $display("FAIL: Expected count 8, got %d at time %0t", out_count, $time); 

		// Check reset behavior at count 9
		#10; if (out_count !== 4'd9) $display("FAIL: Expected count 9, got %d at time %0t", out_count, $time); 
		#10; if (out_count !== 4'd0) $display("FAIL: Expected count 0 after reset, got %d at time %0t", out_count, $time); 

		// If all checks pass
		$display("PASS");
		$finish;
	end

endmodule