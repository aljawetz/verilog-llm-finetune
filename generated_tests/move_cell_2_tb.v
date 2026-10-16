`timescale 1ns/1ps

module tb_move_cell;

    // Inputs
    reg r;
    reg b;
    reg fw_in;
    reg bw_in;
    reg pulse;

    // Outputs
    wire fw_out;
    wire bw_out;
    wire r_out;
    wire b_out;

    // Instantiate the Unit Under Test (UUT)
    move_cell uut (
        .r(r),
        .b(b),
        .fw_in(fw_in),
        .bw_in(bw_in),
        .fw_out(fw_out),
        .bw_out(bw_out),
        .pulse(pulse),
        .r_out(r_out),
        .b_out(b_out)
    );

    initial begin
        // Initialize Inputs
        r = 0; b = 0; fw_in = 0; bw_in = 0; pulse = 0;

        // Test Case 1: Normal propagation without flipping
        #10;
        r = 1; b = 0; fw_in = 0; bw_in = 0; pulse = 0;
        #10;
        if (r_out !== 1 || b_out !== 0) begin
            $display("FAIL: Test Case 1 Failed");
            $finish;
        end

        // Test Case 2: Forward signal propagation
        #10;
        r = 1; b = 0; fw_in = 1; bw_in = 0; pulse = 0;
        #10;
        if (fw_out !== 1) begin
            $display("FAIL: Test Case 2 Failed");
            $finish;
        end

        // Test Case 3: Backward signal propagation
        #10;
        r = 0; b = 1; fw_in = 0; bw_in = 1; pulse = 0;
        #10;
        if (bw_out !== 1) begin
            $display("FAIL: Test Case 3 Failed");
            $finish;
        end

        // Test Case 4: Flipping the discs
        #10;
        r = 1; b = 0; fw_in = 1; bw_in = 1; pulse = 0;
        #10;
        if (r_out !== 0 || b_out !== 1) begin
            $display("FAIL: Test Case 4 Failed");
            $finish;
        end

        // Test Case 5: Pulse signal affecting forward output
        #10;
        r = 0; b = 0; fw_in = 0; bw_in = 0; pulse = 1;
        #10;
        if (fw_out !== 1) begin
            $display("FAIL: Test Case 5 Failed");
            $finish;
        end

        // Test Case 6: Check state preservation
        #10;
        r = 1; b = 1; fw_in = 0; bw_in = 0; pulse = 0;
        #10;
        if (r_out !== 1 || b_out !== 1) begin
            $display("FAIL: Test Case 6 Failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule