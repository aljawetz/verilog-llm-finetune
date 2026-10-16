`timescale 1ns/1ps

module tb_latch_sr;

    reg s;
    reg r;
    wire Q;
    wire Qbar;

    // Instantiate the SR latch
    latch_sr uut (
        .Q(Q),
        .Qbar(Qbar),
        .s(s),
        .r(r)
    );

    initial begin
        // Initialize inputs
        s = 1;
        r = 1;

        // Test case 1: Both inputs high (Q and Qbar should retain previous state)
        #10;
        if (Q !== 1'bx || Qbar !== 1'bx) begin
            $display("FAIL: Initial state should be undefined (x)");
            $finish;
        end

        // Test case 2: Set the latch (s = 0, r = 1)
        s = 0; r = 1;
        #10;
        if (Q !== 1'b1 || Qbar !== 1'b0) begin
            $display("FAIL: Expected Q=1, Qbar=0 after setting");
            $finish;
        end

        // Test case 3: Reset the latch (s = 1, r = 0)
        s = 1; r = 0;
        #10;
        if (Q !== 1'b0 || Qbar !== 1'b1) begin
            $display("FAIL: Expected Q=0, Qbar=1 after resetting");
            $finish;
        end

        // Test case 4: Both inputs high again (should retain state)
        s = 1; r = 1;
        #10;
        if (Q !== 1'b0 || Qbar !== 1'b1) begin
            $display("FAIL: Expected Q=0, Qbar=1 when both inputs are high");
            $finish;
        end

        // Test case 5: Set the latch again (s = 0, r = 1)
        s = 0; r = 1;
        #10;
        if (Q !== 1'b1 || Qbar !== 1'b0) begin
            $display("FAIL: Expected Q=1, Qbar=0 after setting again");
            $finish;
        end

        // Test case 6: Reset the latch again (s = 1, r = 0)
        s = 1; r = 0;
        #10;
        if (Q !== 1'b0 || Qbar !== 1'b1) begin
            $display("FAIL: Expected Q=0, Qbar=1 after resetting again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule