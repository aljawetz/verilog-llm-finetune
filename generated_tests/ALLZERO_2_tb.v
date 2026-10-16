`timescale 1ns/1ps

module tb_ALLZERO;

	reg [255:0] data_in;
	wire isAllZero_out;

	// Instantiate the module under test (uut)
	ALLZERO uut (
		.data_in(data_in),
		.isAllZero_out(isAllZero_out)
	);

	initial begin
		// Test case 1: All zeros
		data_in = 256'b0;
		#10;
		if (isAllZero_out !== 1'b1) begin
			$display("FAIL: Test case 1 failed, expected 1 but got %b", isAllZero_out);
			$finish;
		end

		// Test case 2: One bit set to 1
		data_in = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
		#10;
		if (isAllZero_out !== 1'b0) begin
			$display("FAIL: Test case 2 failed, expected 0 but got %b", isAllZero_out);
			$finish;
		end

		// Test case 3: All ones
		data_in = 256'b1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111;
		#10;
		if (isAllZero_out !== 1'b0) begin
			$display("FAIL: Test case 3 failed, expected 0 but got %b", isAllZero_out);
			$finish;
		end

		// Test case 4: Random bits with at least one zero
		data_in = 256'b1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010;
		#10;
		if (isAllZero_out !== 1'b0) begin
			$display("FAIL: Test case 4 failed, expected 0 but got %b", isAllZero_out);
			$finish;
		end

		// Test case 5: Random bits with all zeros
		data_in = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
		#10;
		if (isAllZero_out !== 1'b1) begin
			$display("FAIL: Test case 5 failed, expected 1 but got %b", isAllZero_out);
			$finish;
		end

		$display("PASS");
		$finish;
	end

endmodule