`timescale 1ns/1ps

module tb_select;

    // Inputs
    reg sel;
    reg [5:0] addr_in;
    reg [5:0] addr_fsm_in;
    reg w_in;

    // Outputs
    wire [5:0] addr_out;
    wire w_out;

    // Instantiate the Unit Under Test (UUT)
    select uut (
        .sel(sel),
        .addr_in(addr_in),
        .addr_fsm_in(addr_fsm_in),
        .w_in(w_in),
        .addr_out(addr_out),
        .w_out(w_out)
    );

    initial begin
        // Initialize Inputs
        sel = 0;
        addr_in = 6'b000000;
        addr_fsm_in = 6'b111111;
        w_in = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: sel = 0, expect addr_out = addr_fsm_in
        sel = 0; addr_in = 6'b101010; addr_fsm_in = 6'b111111; w_in = 1;
        #10;
        if (addr_out !== addr_fsm_in) begin
            $display("FAIL: Test case 1 failed, expected addr_out = %b, got %b", addr_fsm_in, addr_out);
            $finish;
        end
        if (w_out !== 0) begin
            $display("FAIL: Test case 1 failed, expected w_out = 0, got %b", w_out);
            $finish;
        end

        // Test case 2: sel = 1, expect addr_out = addr_in
        sel = 1; addr_in = 6'b101010; addr_fsm_in = 6'b111111; w_in = 1;
        #10;
        if (addr_out !== addr_in) begin
            $display("FAIL: Test case 2 failed, expected addr_out = %b, got %b", addr_in, addr_out);
            $finish;
        end
        if (w_out !== w_in) begin
            $display("FAIL: Test case 2 failed, expected w_out = %b, got %b", w_in, w_out);
            $finish;
        end

        // Test case 3: sel = 1, w_in = 0, expect w_out = 0
        sel = 1; addr_in = 6'b101010; addr_fsm_in = 6'b111111; w_in = 0;
        #10;
        if (addr_out !== addr_in) begin
            $display("FAIL: Test case 3 failed, expected addr_out = %b, got %b", addr_in, addr_out);
            $finish;
        end
        if (w_out !== 0) begin
            $display("FAIL: Test case 3 failed, expected w_out = 0, got %b", w_out);
            $finish;
        end

        // Test case 4: sel = 0, w_in = 1, expect w_out = 0
        sel = 0; addr_in = 6'b101010; addr_fsm_in = 6'b111111; w_in = 1;
        #10;
        if (addr_out !== addr_fsm_in) begin
            $display("FAIL: Test case 4 failed, expected addr_out = %b, got %b", addr_fsm_in, addr_out);
            $finish;
        end
        if (w_out !== 0) begin
            $display("FAIL: Test case 4 failed, expected w_out = 0, got %b", w_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule