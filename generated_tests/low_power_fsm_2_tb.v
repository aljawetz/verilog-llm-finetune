`timescale 1ns/1ps

module tb_low_power_fsm;

	reg clk;
	reg rst;
	reg enable;
	wire [1:0] state;

	// Instantiate the module under test (uut)
	low_power_fsm uut (
		.clk(clk),
		.rst(rst),
		.enable(enable),
		.state(state)
	);

	// Clock generation
	always begin
		#5 clk = ~clk; // 10ns clock period
	end

	initial begin
		// Initialize signals
		clk = 0;
		rst = 0;
		enable = 0;

		// Test reset functionality
		rst = 1; // Assert reset
		#10;
		if (state !== 2'b00) begin
			$display("FAIL: State should be S0 after reset");
			$finish;
		end

		rst = 0; // Deassert reset
		#10;

		// Enable the FSM and check state transitions
		enable = 1;

		// Check state transitions
		#10;
		if (state !== 2'b01) begin
			$display("FAIL: State should be S1");
			$finish;
		end

		#10;
		if (state !== 2'b11) begin
			$display("FAIL: State should be S2");
			$finish;
		end

		#10;
		if (state !== 2'b10) begin
			$display("FAIL: State should be S3");
			$finish;
		end

		#10;
		if (state !== 2'b00) begin
			$display("FAIL: State should be S0");
			$finish;
		end

		// Disable the FSM and check state remains the same
		enable = 0;
		#10;
		if (state !== 2'b00) begin
			$display("FAIL: State should remain S0 when disabled");
			$finish;
		end

		// Re-enable and check state transitions again
		enable = 1;
		#10;
		if (state !== 2'b01) begin
			$display("FAIL: State should be S1 after re-enabling");
			$finish;
		end

		#10;
		if (state !== 2'b11) begin
			$display("FAIL: State should be S2");
			$finish;
		end

		#10;
		if (state !== 2'b10) begin
			$display("FAIL: State should be S3");
			$finish;
		end

		#10;
		if (state !== 2'b00) begin
			$display("FAIL: State should be S0");
			$finish;
		end

		// End of test
		$display("PASS");
		$finish;
	end

endmodule