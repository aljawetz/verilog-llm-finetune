`timescale 1ns/1ps

module tb_expbot_muxsad;

    reg [2:0] safunc;
    wire [1:0] muxsad_a;
    wire [1:0] muxsad_b;

    // Instantiate the module under test (uut)
    expbot_muxsad uut (
        .muxsad_a(muxsad_a),
        .muxsad_b(muxsad_b),
        .safunc(safunc)
    );

    initial begin
        // Test sequence
        // Test case 1: safunc = 3'h1
        safunc = 3'h1; #10;
        if (muxsad_a !== 2'h0 || muxsad_b !== 2'h3) begin
            $display("FAIL: Test case 1 failed for safunc = 3'h1");
            $finish;
        end

        // Test case 2: safunc = 3'h4
        safunc = 3'h4; #10;
        if (muxsad_a !== 2'h2 || muxsad_b !== 2'h2) begin
            $display("FAIL: Test case 2 failed for safunc = 3'h4");
            $finish;
        end

        // Test case 3: safunc = 3'h5
        safunc = 3'h5; #10;
        if (muxsad_a !== 2'h1 || muxsad_b !== 2'h1) begin
            $display("FAIL: Test case 3 failed for safunc = 3'h5");
            $finish;
        end

        // Test case 4: safunc = 3'h6
        safunc = 3'h6; #10;
        if (muxsad_a !== 2'h0 || muxsad_b !== 2'h3) begin
            $display("FAIL: Test case 4 failed for safunc = 3'h6");
            $finish;
        end

        // Test case 5: safunc = 3'h0 (default case)
        safunc = 3'h0; #10;
        if (muxsad_a !== 2'h3 || muxsad_b !== 2'h3) begin
            $display("FAIL: Test case 5 failed for safunc = 3'h0");
            $finish;
        end

        // Test case 6: safunc = 3'h2 (default case)
        safunc = 3'h2; #10;
        if (muxsad_a !== 2'h3 || muxsad_b !== 2'h3) begin
            $display("FAIL: Test case 6 failed for safunc = 3'h2");
            $finish;
        end

        // Test case 7: safunc = 3'h3 (default case)
        safunc = 3'h3; #10;
        if (muxsad_a !== 2'h3 || muxsad_b !== 2'h3) begin
            $display("FAIL: Test case 7 failed for safunc = 3'h3");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule