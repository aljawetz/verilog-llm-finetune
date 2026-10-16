`timescale 1ns/1ps

module tb_tristate;

    reg en;
    reg in;
    wire out;
    wire reg_out;

    // Instantiate the module under test (uut)
    tristate uut (
        .en(en),
        .in(in),
        .out(out),
        .reg_out(reg_out)
    );

    initial begin
        // Initialize inputs
        en = 0;
        in = 0;

        // Test case 1: When en is 0, reg_out should be high impedance (z)
        #10;
        if (reg_out !== 1'bz) begin
            $display("FAIL: reg_out should be high impedance when en is 0");
            $finish;
        end

        // Test case 2: When en is 1, reg_out should follow in
        en = 1; in = 1;
        #10;
        if (reg_out !== 1'b1) begin
            $display("FAIL: reg_out should be 1 when en is 1 and in is 1");
            $finish;
        end

        // Test case 3: Change in while en is 1
        in = 0;
        #10;
        if (reg_out !== 1'b0) begin
            $display("FAIL: reg_out should be 0 when en is 1 and in is 0");
            $finish;
        end

        // Test case 4: Disable the buffer
        en = 0;
        #10;
        if (reg_out !== 1'bz) begin
            $display("FAIL: reg_out should be high impedance when en is 0");
            $finish;
        end

        // Test case 5: Re-enable and set in to 1
        en = 1; in = 1;
        #10;
        if (reg_out !== 1'b1) begin
            $display("FAIL: reg_out should be 1 when en is 1 and in is 1");
            $finish;
        end

        // Test case 6: Re-enable and set in to 0
        in = 0;
        #10;
        if (reg_out !== 1'b0) begin
            $display("FAIL: reg_out should be 0 when en is 1 and in is 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule