`timescale 1ns/1ps

module tb_mux;

    // Inputs
    reg a;
    reg b;
    reg sel;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: sel = 0, expect out = a
        a = 1'b1; b = 1'b0; sel = 1'b0;
        #10;
        if (out !== a) begin
            $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", a, out);
            $finish;
        end

        // Test case 2: sel = 1, expect out = b
        a = 1'b0; b = 1'b1; sel = 1'b1;
        #10;
        if (out !== b) begin
            $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", b, out);
            $finish;
        end

        // Test case 3: sel = 0, expect out = a
        a = 1'b0; b = 1'b1; sel = 1'b0;
        #10;
        if (out !== a) begin
            $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", a, out);
            $finish;
        end

        // Test case 4: sel = 1, expect out = b
        a = 1'b1; b = 1'b0; sel = 1'b1;
        #10;
        if (out !== b) begin
            $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", b, out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule