`timescale 1ns/1ps

module tb_mux_8bit_procedural;

    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    // Instantiate the module under test
    mux_8bit_procedural uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select input 0
        in = 8'b10101010; sel = 3'b000; #10;
        if (out !== in[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);

        // Test case 2: Select input 1
        in = 8'b10101010; sel = 3'b001; #10;
        if (out !== in[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);

        // Test case 3: Select input 2
        in = 8'b10101010; sel = 3'b010; #10;
        if (out !== in[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);

        // Test case 4: Select input 3
        in = 8'b10101010; sel = 3'b011; #10;
        if (out !== in[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);

        // Test case 5: Select input 4
        in = 8'b10101010; sel = 3'b100; #10;
        if (out !== in[4]) $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], out);

        // Test case 6: Select input 5
        in = 8'b10101010; sel = 3'b101; #10;
        if (out !== in[5]) $display("FAIL: Test case 6 failed, expected %b, got %b", in[5], out);

        // Test case 7: Select input 6
        in = 8'b10101010; sel = 3'b110; #10;
        if (out !== in[6]) $display("FAIL: Test case 7 failed, expected %b, got %b", in[6], out);

        // Test case 8: Select input 7
        in = 8'b10101010; sel = 3'b111; #10;
        if (out !== in[7]) $display("FAIL: Test case 8 failed, expected %b, got %b", in[7], out);

        // Test case 9: Undefined select
        in = 8'b10101010; sel = 3'bxxx; #10;
        if (out !== 1'bx) $display("FAIL: Test case 9 failed, expected x, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule