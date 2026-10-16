`timescale 1ns/1ps

module tb_demux_1x4;

	reg din;
	reg [1:0] sel;
	wire dout_0, dout_1, dout_2, dout_3;

	// Instantiate the module under test (uut)
	demux_1x4 uut (
		.din(din),
		.sel(sel),
		.dout_0(dout_0),
		.dout_1(dout_1),
		.dout_2(dout_2),
		.dout_3(dout_3)
	);

	initial begin
		// Test case 1: sel = 00, din = 1
		din = 1; sel = 2'b00; #10;
		if (dout_0 !== 1 || dout_1 !== 0 || dout_2 !== 0 || dout_3 !== 0) begin
			$display("FAIL: Test case 1 failed");
			$finish;
		end

		// Test case 2: sel = 01, din = 1
		din = 1; sel = 2'b01; #10;
		if (dout_0 !== 0 || dout_1 !== 1 || dout_2 !== 0 || dout_3 !== 0) begin
			$display("FAIL: Test case 2 failed");
			$finish;
		end

		// Test case 3: sel = 10, din = 1
		din = 1; sel = 2'b10; #10;
		if (dout_0 !== 0 || dout_1 !== 0 || dout_2 !== 1 || dout_3 !== 0) begin
			$display("FAIL: Test case 3 failed");
			$finish;
		end

		// Test case 4: sel = 11, din = 1
		din = 1; sel = 2'b11; #10;
		if (dout_0 !== 0 || dout_1 !== 0 || dout_2 !== 0 || dout_3 !== 1) begin
			$display("FAIL: Test case 4 failed");
			$finish;
		end

		// Test case 5: sel = 00, din = 0
		din = 0; sel = 2'b00; #10;
		if (dout_0 !== 0 || dout_1 !== 0 || dout_2 !== 0 || dout_3 !== 0) begin
			$display("FAIL: Test case 5 failed");
			$finish;
		end

		// Test case 6: sel = 01, din = 0
		din = 0; sel = 2'b01; #10;
		if (dout_0 !== 0 || dout_1 !== 0 || dout_2 !== 0 || dout_3 !== 0) begin
			$display("FAIL: Test case 6 failed");
			$finish;
		end

		// Test case 7: sel = 10, din = 0
		din = 0; sel = 2'b10; #10;
		if (dout_0 !== 0 || dout_1 !== 0 || dout_2 !== 0 || dout_3 !== 0) begin
			$display("FAIL: Test case 7 failed");
			$finish;
		end

		// Test case 8: sel = 11, din = 0
		din = 0; sel = 2'b11; #10;
		if (dout_0 !== 0 || dout_1 !== 0 || dout_2 !== 0 || dout_3 !== 0) begin
			$display("FAIL: Test case 8 failed");
			$finish;
		end

		$display("PASS");
		$finish;
	end

endmodule