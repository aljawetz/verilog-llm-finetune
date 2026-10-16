`timescale 1ns/1ps

module tb_mux_allstyles;

    // Inputs
    reg a;
    reg b;
    reg sel;

    // Output
    wire mux_out;

    // Instantiate the Unit Under Test (UUT)
    mux_allstyles uut (
        .a(a),
        .b(b),
        .sel(sel),
        .mux_out(mux_out)
    );

    initial begin
        // Test case 1: sel = 1, expect mux_out = a
        a = 1'b1; b = 1'b0; sel = 1'b1;
        #10;
        if (mux_out !== a) begin
            $display("FAIL: Test case 1 failed, expected mux_out = %b, got %b", a, mux_out);
            $finish;
        end

        // Test case 2: sel = 0, expect mux_out = b
        a = 1'b1; b = 1'b0; sel = 1'b0;
        #10;
        if (mux_out !== b) begin
            $display("FAIL: Test case 2 failed, expected mux_out = %b, got %b", b, mux_out);
            $finish;
        end

        // Test case 3: sel = 1, expect mux_out = a
        a = 1'b0; b = 1'b1; sel = 1'b1;
        #10;
        if (mux_out !== a) begin
            $display("FAIL: Test case 3 failed, expected mux_out = %b, got %b", a, mux_out);
            $finish;
        end

        // Test case 4: sel = 0, expect mux_out = b
        a = 1'b0; b = 1'b1; sel = 1'b0;
        #10;
        if (mux_out !== b) begin
            $display("FAIL: Test case 4 failed, expected mux_out = %b, got %b", b, mux_out);
            $finish;
        end

        // Test case 5: sel = 1, expect mux_out = a
        a = 1'b1; b = 1'b1; sel = 1'b1;
        #10;
        if (mux_out !== a) begin
            $display("FAIL: Test case 5 failed, expected mux_out = %b, got %b", a, mux_out);
            $finish;
        end

        // Test case 6: sel = 0, expect mux_out = b
        a = 1'b1; b = 1'b1; sel = 1'b0;
        #10;
        if (mux_out !== b) begin
            $display("FAIL: Test case 6 failed, expected mux_out = %b, got %b", b, mux_out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule