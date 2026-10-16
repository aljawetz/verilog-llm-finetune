`timescale 1ns/1ps

module tb_seq_dlatch_rst_bh;

    reg en;
    reg d;
    reg rst;
    wire q;

    // Instantiate the module under test (uut)
    seq_dlatch_rst_bh uut (
        .q(q),
        .en(en),
        .d(d),
        .rst(rst)
    );

    initial begin
        // Initialize inputs
        en = 0;
        d = 0;
        rst = 0;

        // Test sequence
        // Test 1: Reset functionality
        rst = 1; #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        
        // Test 2: Enable and set d
        rst = 0; en = 1; d = 1; #10;
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d when enabled");
            $finish;
        end

        // Test 3: Disable and check q holds value
        en = 0; #10;
        if (q !== 1'b1) begin
            $display("FAIL: q changed when disabled");
            $finish;
        end

        // Test 4: Change d while enabled
        en = 1; d = 0; #10;
        if (q !== 1'b0) begin
            $display("FAIL: q did not follow new d when enabled");
            $finish;
        end

        // Test 5: Reset again
        rst = 1; #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test 6: Enable with d = 1 after reset
        rst = 0; en = 1; d = 1; #10;
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d after reset");
            $finish;
        end

        // Test 7: Disable and check q holds value
        en = 0; #10;
        if (q !== 1'b1) begin
            $display("FAIL: q changed when disabled after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule