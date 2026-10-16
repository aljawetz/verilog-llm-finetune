`timescale 1ns/1ps

module tb_comparator;

    reg [7:0] s;
    reg [7:0] tot;
    wire tot_lts;

    // Instantiate the module under test (uut)
    comparator uut (
        .s(s),
        .tot(tot),
        .tot_lts(tot_lts)
    );

    initial begin
        // Test case 1: s = 5, tot = 3 (s >= tot)
        s = 8'd5; tot = 8'd3;
        #10;
        if (tot_lts !== 1'b1) begin
            $display("FAIL: Test case 1 failed (s=5, tot=3)");
            $finish;
        end

        // Test case 2: s = 2, tot = 2 (s >= tot)
        s = 8'd2; tot = 8'd2;
        #10;
        if (tot_lts !== 1'b1) begin
            $display("FAIL: Test case 2 failed (s=2, tot=2)");
            $finish;
        end

        // Test case 3: s = 1, tot = 2 (s < tot)
        s = 8'd1; tot = 8'd2;
        #10;
        if (tot_lts !== 1'b0) begin
            $display("FAIL: Test case 3 failed (s=1, tot=2)");
            $finish;
        end

        // Test case 4: s = 255, tot = 0 (s >= tot)
        s = 8'd255; tot = 8'd0;
        #10;
        if (tot_lts !== 1'b1) begin
            $display("FAIL: Test case 4 failed (s=255, tot=0)");
            $finish;
        end

        // Test case 5: s = 0, tot = 1 (s < tot)
        s = 8'd0; tot = 8'd1;
        #10;
        if (tot_lts !== 1'b0) begin
            $display("FAIL: Test case 5 failed (s=0, tot=1)");
            $finish;
        end

        // Test case 6: s = 100, tot = 100 (s >= tot)
        s = 8'd100; tot = 8'd100;
        #10;
        if (tot_lts !== 1'b1) begin
            $display("FAIL: Test case 6 failed (s=100, tot=100)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule