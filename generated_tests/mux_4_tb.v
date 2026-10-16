`timescale 1ns/1ps

module tb_mux;

    reg [7:0] a;
    reg [7:0] b;
    reg sel;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    mux uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: sel = 0, expect out = b
        a = 8'hAA; // 10101010
        b = 8'h55; // 01010101
        sel = 0;
        #10;
        if (out !== b) begin
            $display("FAIL: Test case 1 failed, expected out = %h, got out = %h", b, out);
            $finish;
        end

        // Test case 2: sel = 1, expect out = a
        sel = 1;
        #10;
        if (out !== a) begin
            $display("FAIL: Test case 2 failed, expected out = %h, got out = %h", a, out);
            $finish;
        end

        // Test case 3: Change inputs, sel = 0, expect out = b
        a = 8'hFF; // 11111111
        b = 8'h00; // 00000000
        sel = 0;
        #10;
        if (out !== b) begin
            $display("FAIL: Test case 3 failed, expected out = %h, got out = %h", b, out);
            $finish;
        end

        // Test case 4: Change inputs, sel = 1, expect out = a
        sel = 1;
        #10;
        if (out !== a) begin
            $display("FAIL: Test case 4 failed, expected out = %h, got out = %h", a, out);
            $finish;
        end

        // Test case 5: sel = 0, expect out = b with different values
        a = 8'h1C; // 00011100
        b = 8'hE3; // 11100011
        sel = 0;
        #10;
        if (out !== b) begin
            $display("FAIL: Test case 5 failed, expected out = %h, got out = %h", b, out);
            $finish;
        end

        // Test case 6: sel = 1, expect out = a with different values
        sel = 1;
        #10;
        if (out !== a) begin
            $display("FAIL: Test case 6 failed, expected out = %h, got out = %h", a, out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule