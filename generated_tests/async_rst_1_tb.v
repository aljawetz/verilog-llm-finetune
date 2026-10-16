`timescale 1ns/1ps

module tb_async_rst;

	reg in;
	reg clk;
	reg rst;
	wire out;

	// Instantiate the module under test (uut)
	async_rst uut (
		.in(in),
		.clk(clk),
		.rst(rst),
		.out(out)
	);

	// Clock generation
	always begin
		#5 clk = ~clk; // 10ns clock period
	end

	initial begin
		// Initialize signals
		clk = 0;
		rst = 0;
		in = 0;

		// Apply reset
		#2 rst = 1; // Release reset after 2ns
		#5;

		// Test case 1: Check output after reset
		if (out !== 1'b0) begin
			$display("FAIL: Output should be 0 after reset");
			$finish;
		end

		// Test case 2: Set input and clock
		in = 1;
		#10; // Wait for a clock edge
		if (out !== 1'b1) begin
			$display("FAIL: Output should be 1 after input is set to 1");
			$finish;
		end

		// Test case 3: Change input while clock is running
		in = 0;
		#10; // Wait for a clock edge
		if (out !== 1'b0) begin
			$display("FAIL: Output should be 0 after input is set to 0");
			$finish;
		end

		// Test case 4: Assert reset again
		rst = 0; // Assert reset
		#5;
		if (out !== 1'b0) begin
			$display("FAIL: Output should be 0 when reset is asserted");
			$finish;
		end

		// Test case 5: Release reset and check output
		rst = 1; // Release reset
		#5;
		in = 1; // Set input to 1
		#10; // Wait for a clock edge
		if (out !== 1'b1) begin
			$display("FAIL: Output should be 1 after input is set to 1 post reset");
			$finish;
		end

		// If all tests pass
		$display("PASS");
		$finish;
	end

endmodule