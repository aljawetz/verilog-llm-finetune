`timescale 1ns/1ps

module tb_select;

    reg sel;
    reg [5:0] addr_in;
    reg [5:0] addr_fsm_in;
    reg w_in;
    wire [5:0] addr_out;
    wire w_out;

    // Instantiate the module under test (uut)
    select uut (
        .sel(sel),
        .addr_in(addr_in),
        .addr_fsm_in(addr_fsm_in),
        .w_in(w_in),
        .addr_out(addr_out),
        .w_out(w_out)
    );

    initial begin
        // Test case 1: sel = 0, expect addr_out = addr_fsm_in, w_out = 0
        sel = 0; addr_in = 6'b101010; addr_fsm_in = 6'b111111; w_in = 1;
        #10;
        if (addr_out !== addr_fsm_in || w_out !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: sel = 1, expect addr_out = addr_in, w_out = w_in
        sel = 1; addr_in = 6'b110011; addr_fsm_in = 6'b000000; w_in = 1;
        #10;
        if (addr_out !== addr_in || w_out !== w_in) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: sel = 1, w_in = 0, expect w_out = 0
        sel = 1; addr_in = 6'b000001; addr_fsm_in = 6'b111000; w_in = 0;
        #10;
        if (addr_out !== addr_in || w_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: sel = 0, w_in = 1, expect w_out = 0
        sel = 0; addr_in = 6'b111111; addr_fsm_in = 6'b000000; w_in = 1;
        #10;
        if (addr_out !== addr_fsm_in || w_out !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: sel = 1, w_in = 1, expect w_out = 1
        sel = 1; addr_in = 6'b101010; addr_fsm_in = 6'b010101; w_in = 1;
        #10;
        if (addr_out !== addr_in || w_out !== w_in) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: sel = 0, addr_fsm_in = 6'b111111, w_in = 1, expect w_out = 0
        sel = 0; addr_in = 6'b000000; addr_fsm_in = 6'b111111; w_in = 1;
        #10;
        if (addr_out !== addr_fsm_in || w_out !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule